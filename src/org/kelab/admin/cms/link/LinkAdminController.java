package org.kelab.admin.cms.link;

import java.io.File;
import java.util.List;

import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsLink;
import org.kelab.util.FileUtils;
import org.kelab.util.ImageKit;

import com.jfinal.aop.Before;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class LinkAdminController extends BaseController{
	static LinkAdminService srv = LinkAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		List<CmsLink> cmsLinkL = srv.findAllCmsLink();
		setAttr("cmsLinkL",cmsLinkL);
		render("index.html");
	}
	
	@Before(LinkAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsLink cmsLink = new CmsLink();
		String filestr = "/"+p.get("cmsImage")+System.currentTimeMillis()+"";
		UploadFile uf = null;
		try {
			uf = getFile("linkpic",p.get("cmsImage"));
			cmsLink = getModel(CmsLink.class,"li");
			if (cmsLink.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择链接图片文件"));
				return;
			}
			if(uf != null && !ImageKit.isImageExtName(uf.getFileName())){
				renderJson(Ret.fail("msg", "请先选择图片文件"));
				return;
			}
			if(uf != null && ImageKit.isImageExtName(uf.getFileName())){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				System.out.println(uf.getUploadPath()+filestr);
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				cmsLink.setLinkPic(filestr);
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
		cmsLink.setLinkUserId(getLoginUserId());
		if(cmsLink.getId()>0 && cmsLink.update())
			ret =Ret.ok();
		else
			ret = srv.save(cmsLink,getLoginUserId());
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
	
	public void getLinkById(){
		int linkId = getParaToInt(0);
		@SuppressWarnings("static-access")
		CmsLink cmsLink = srv.dao.findById(linkId);
		renderJson(cmsLink);
	}
	
}
