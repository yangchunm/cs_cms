package org.kelab.admin.cms.navi;

import java.util.List;

import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsNavi;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;


public class NaviAdminController extends BaseController{
	static NaviAdminService srv = NaviAdminService.me;
	
	public void index() {
		List<CmsNavi> cmsNaviList = srv.findAllCmsNavi(0);
		setAttr("cmsNaviList",cmsNaviList);
		setAttr("naviTypeL",srv.findAllNaviType());
		render("index.html");
	}
	
	@Before(NaviAdminValidator.class)
	public void save(){
		CmsNavi cmsNavi = getModel(CmsNavi.class,"");
		Ret ret = new Ret();
		ret = srv.save(cmsNavi,getLoginUserId());
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
	
	public void getNaviById(){
		int NaviId = getParaToInt(0);
		@SuppressWarnings("static-access")
		CmsNavi cmsNavi = srv.dao.findById(NaviId);
		renderJson(cmsNavi);
	}
	
	public void revIsShow(){
		int naviId = getParaToInt("naviId");
		boolean isShow = getParaToBoolean("isShow");
		CmsNavi.dao.findById(naviId).set("navi_is_show", !isShow).update();
		renderJson(Ret.ok());
	}
	
	public void revIsOut(){
		int naviId = getParaToInt("naviId");
		boolean isOut = getParaToBoolean("isOut");
		CmsNavi.dao.findById(naviId).set("navi_is_out", !isOut).update();
		renderJson(Ret.ok());
	}
}
