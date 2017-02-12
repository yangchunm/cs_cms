package org.kelab.admin.kn.molecular;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnMolecular;
import org.kelab.util.FileUtils;
import org.kelab.common.controller.BaseController;

import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class MolecularAdminController extends BaseController{
	static TreeAdminService treeSrv = TreeAdminService.me;
	static MolecularAdminService srv = MolecularAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("knMoleP",srv.findAllMole(comQ));
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		render("index.html");
	}
	
	public void save() throws IOException{
		Ret ret = new Ret();
		KnMolecular knMole = new KnMolecular();
		String molfile = System.currentTimeMillis()+"";
		
		UploadFile uf = null;
		try {
			uf = getFile("knmo_file",PropKit.get("knMolePath"));
			knMole = getModel(KnMolecular.class,"mole");
			if (knMole.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择上传文件"));
				return;
			}
			if(uf != null){
				String molType = FileUtils.getSuffix(uf.getFileName());
				molfile =molfile + molType;
				File f = new File(uf.getUploadPath()+molfile);
				uf.getFile().renameTo(f);
				knMole.setKnmoFile(molfile);
				knMole.setKnmoFileType(molType);
				
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
		
		knMole.setKnmoTime(new Date());
		knMole.setKnmoUserId(getLoginUserId());
		
		ret = srv.save(knMole);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getKnMoleById(){
		int id = getParaToInt(0);
		renderJson(KnMolecular.dao.findById(id));
	}
	
	public void fileDown(){
		int id = getParaToInt(0);
		KnMolecular f =KnMolecular.dao.findById(id);
		String fileStr = "/"+PropKit.get("baseUploadPath")+PropKit.get("knMolePath")+f.getKnmoFile();
		renderJson(srv.fileDown(fileStr));
	}
}
