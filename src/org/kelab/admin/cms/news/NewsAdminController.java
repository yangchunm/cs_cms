package org.kelab.admin.cms.news;

import java.io.UnsupportedEncodingException;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsNews;
import org.kelab.util.FileUtils;
import org.kelab.util.ImageKit;

import com.jfinal.aop.Before;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class NewsAdminController extends BaseController{
	static NewsAdminService srv = NewsAdminService.me;
	static NaviAdminService naviSrv = NaviAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("newsNaviL",naviSrv.findNaviByType(2));
		setAttr("cmsNewsP",srv.findAllCmsNews(comQ));
		render("index.html");
	}
	
	public void add() throws UnsupportedEncodingException{
		setAttr("newsNaviL",naviSrv.findNaviByType(2));
		render("edit.html");
	}
	
	public void edit(){
		int id = getParaToInt(0,0);
		setAttr("news",CmsNews.dao.findById(id));
		setAttr("newsNaviL",naviSrv.findNaviByType(2));
		render("edit.html");
	}
	
	@Before(NewsAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsNews cmsNews = new CmsNews();
		String filestr = "/"+p.get("cmsImage")+System.currentTimeMillis()+"";
		
		UploadFile uf = null;
		try {
			uf = getFile("news_pic",p.get("cmsImage"));
			cmsNews = getModel(CmsNews.class,"ne");
			/*if (cmsNews.getId() == 0 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择标题图片"));
				return;
			}*/
			if(uf != null && !ImageKit.isImageExtName(uf.getFileName())){
				renderJson(Ret.fail("msg", "请先选择图片文件"));
				return;
			}
			if(uf != null && ImageKit.isImageExtName(uf.getFileName())){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				//File f = new File(uf.getUploadPath()+filestr);
				
				ImageKit.zoom(196, uf.getFile(), uf.getUploadPath()+filestr);
				//uf.getFile().renameTo(f);
				cmsNews.setNewsPic(filestr);
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
		
		cmsNews.setNewsUserId(getLoginUserId());
		if(cmsNews.getId()>0 && cmsNews.update())
			ret =Ret.ok();
		else
			ret = srv.save(cmsNews);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	
	public void revIsTop(){
		int newsId = getParaToInt("newsId");
		boolean isTop = getParaToBoolean("isTop");
		CmsNews.dao.findById(newsId).set("news_is_top", !isTop).update();
		renderJson(Ret.ok());
	}
	
	public void revIsRestrict(){
		int newsId = getParaToInt("newsId");
		boolean isRestrict = getParaToBoolean("isRestrict");
		CmsNews.dao.findById(newsId).set("news_is_restrict", !isRestrict).update();
		renderJson(Ret.ok());
	}
}
