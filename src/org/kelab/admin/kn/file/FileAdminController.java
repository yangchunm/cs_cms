package org.kelab.admin.kn.file;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnFile;
import org.kelab.util.FileUtils;
import org.kelab.common.controller.BaseController;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class FileAdminController extends BaseController{
	static TreeAdminService treeSrv = TreeAdminService.me;
	static FileAdminService srv = FileAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("knFileP",srv.findAllFile(comQ));
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		render("index.html");
	}
	
	public void save() throws IOException{
		Ret ret = new Ret();
		KnFile knFile = new KnFile();
		String filestr = System.currentTimeMillis()+"";
		long fileSize = 0;
		
		UploadFile uf = null;
		try {
			uf = getFile("knfi_file",p.get("knFilePath"));
			knFile = getModel(KnFile.class,"file");
			if (knFile.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择上传文件"));
				return;
			}
			if(uf != null){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				fileSize = f.length()/1024;//kb
				knFile.setKnfiPath(filestr);
				knFile.setKnfiSize(fileSize);
				knFile.setKnfiType(FileUtils.getSuffix(uf.getFileName()));
			}
		} catch (Exception e) {
			if (e instanceof com.oreilly.servlet.multipart.ExceededSizeException) {
				renderJson(Ret.fail("msg", "文件大小超出范围"));
			} else {
				if (uf != null) {
					uf.getFile().delete();
				}
				renderJson(Ret.fail("msg", e.getMessage()));
			}
			return ;
		}
		
		knFile.setKnfiTime(new Date());
		knFile.setKnfiUserId(getLoginUserId());
		
		ret = srv.save(knFile);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getKnFileById(){
		int id = getParaToInt(0);
		renderJson(KnFile.dao.findById(id));
	}
	
	public void fileDown(){
		int id = getParaToInt(0);
		KnFile f =KnFile.dao.findById(id);
		String fileStr = "/"+p.get("baseUploadPath")+p.get("knFilePath")+f.getKnfiPath();
		renderJson(srv.fileDown(fileStr));
	}
}
