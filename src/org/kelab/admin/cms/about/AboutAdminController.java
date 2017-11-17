package org.kelab.admin.cms.about;

import java.util.Date;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsAbout;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;


public class AboutAdminController extends BaseController{
	static AboutAdminService srv = AboutAdminService.me;
	static NaviAdminService naviSrv = NaviAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("newsNaviL",naviSrv.findNaviByType(1));
		setAttr("cmsAboutP",srv.findAllCmsAbout(comQ));
		render("index.html");
	}
	
	public void edit(){
		int id = getParaToInt(0,0);
		setAttr("about",srv.findByNaviId(id));
		render("edit.html");
	}
	
	@Before(AboutAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsAbout cmsAbout = getModel(CmsAbout.class,"");
		cmsAbout.setAbouTime(new Date());
		cmsAbout.setAbouUserId(getLoginUserId());
		cmsAbout.update();
		ret= Ret.ok();
		renderJson(ret);
	}
}
