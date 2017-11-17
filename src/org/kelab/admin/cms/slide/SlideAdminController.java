package org.kelab.admin.cms.slide;

import java.io.File;
import java.util.List;

import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsSlide;
import org.kelab.util.FileUtils;
import org.kelab.util.ImageKit;

import com.jfinal.aop.Before;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class SlideAdminController extends BaseController{
	static SlideAdminService srv = SlideAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		List<CmsSlide> cmsSlideL = srv.findAllCmsSlide();
		setAttr("cmsSlideL",cmsSlideL);
		render("index.html");
	}
	
	@Before(SlideAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsSlide cmsSlide = new CmsSlide();
		String filestr = "/"+p.get("cmsImage")+System.currentTimeMillis()+"";
		UploadFile uf = null;
		try {
			uf = getFile("slidpic",p.get("cmsImage"));
			cmsSlide = getModel(CmsSlide.class,"sl");
			if (cmsSlide.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择链接图片文件"));
				return;
			}
			if(uf != null && !ImageKit.isImageExtName(uf.getFileName())){
				renderJson(Ret.fail("msg", "请先选择图片文件"));
				return;
			}
			if(uf != null && ImageKit.isImageExtName(uf.getFileName())){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				cmsSlide.setSlidPic(filestr);
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
		cmsSlide.setSlidUserId(getLoginUserId());
		if(cmsSlide.getId()>0 && cmsSlide.update())
			ret =Ret.ok();
		else
			ret = srv.save(cmsSlide,getLoginUserId());
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void reOrder(){
		int id = getParaToInt("id");
		int way = getParaToInt("way");
		int order = getParaToInt("order");
		Ret ret = srv.reOrder(id,way,order);
		renderJson(ret);
	}
	
	public void getSlideById(){
		int linkId = getParaToInt(0);
		@SuppressWarnings("static-access")
		CmsSlide cmsSlide = srv.dao.findById(linkId);
		renderJson(cmsSlide);
	}
	
}
