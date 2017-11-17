package org.kelab.admin.cms.file;

import java.io.File;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsFile;
import org.kelab.model.CmsNews;
import org.kelab.util.FileUtils;

import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class FileAdminController extends BaseController{
	static FileAdminService srv = FileAdminService.me;
	static NaviAdminService naviSrv = NaviAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("naviL",naviSrv.findNaviByType(3));
		setAttr("fileP",srv.findAllCmsFile(comQ));
		render("index.html");
	}
	
	public void add(){
		setAttr("naviL",naviSrv.findNaviByType(3));
		render("edit.html");
	}
	
	public void edit(){
		int id = getParaToInt(0,0);
		setAttr("file",CmsFile.dao.findById(id));
		setAttr("naviL",naviSrv.findNaviByType(3));
		render("edit.html");
	}
	
	@Before(FileAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsFile cmsFile = new CmsFile();
		String filestr = "/"+p.get("cmsFile")+System.currentTimeMillis()+"";
		long fileSize = 0;
		UploadFile uf = null;
		try {
			uf = getFile("file",p.get("cmsFile"));
			cmsFile = getModel(CmsFile.class,"fi");
			if (cmsFile.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择文件"));
				return;
			}
			if(uf != null && !isAllowFile(uf.getFileName())){
				renderJson(Ret.fail("msg", "不允许上传的文件"));
				return;
			}
			if(uf != null && isAllowFile(uf.getFileName())){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				fileSize = f.length()/1024;//kb
				cmsFile.setFileUrl(filestr);
				cmsFile.setFileExt(FileUtils.getSuffix(filestr));
				cmsFile.setFileSize(fileSize);
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
		
		cmsFile.setFileUserId(getLoginUserId());
		if(cmsFile.getId()>0 && cmsFile.update())
			ret =Ret.ok();
		else
			ret = srv.save(cmsFile);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getFileById(){
		int id = getParaToInt(0);
		renderJson(CmsFile.dao.findById(id));
	}
	
	public void fileDown(){
		int id = getParaToInt(0);
		CmsFile f =CmsFile.dao.findById(id);
		String fileStr = "/"+p.get("baseUploadPath")+f.getFileUrl();
		String file = PathKit.getWebRootPath()+fileStr;
		File ff = new File(file);
		if(ff.exists()){
			renderJson(Ret.ok("msg",fileStr));
		}else
			renderJson(Ret.fail("msg","该文件不存在！"));
	}
	
	public void revIsRestrict(){
		int newsId = getParaToInt("newsId");
		boolean isRestrict = getParaToBoolean("isRestrict");
		CmsNews.dao.findById(newsId).set("news_is_restrict", !isRestrict).update();
		renderJson(Ret.ok());
	}
	
	public boolean isAllowFile(String fileName){
		String ext = FileUtils.getSuffix(fileName);
		String allow[] = p.get("fileExt").split(",");
		boolean flag = false;
		for(int i =0; i< allow.length;i++){
			if(allow[i].equals(ext)){
				flag = true;
				break;
			}
		}
		return flag;
	}
}
