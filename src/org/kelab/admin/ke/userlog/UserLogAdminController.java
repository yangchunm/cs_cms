package org.kelab.admin.ke.userlog;


import org.kelab.admin.ke.organ.OrganAdminService;
import org.kelab.admin.ke.role.RoleAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KeUser;

import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class UserLogAdminController extends Controller{
	static UserLogAdminService srv = UserLogAdminService.me;
	static RoleAdminService roleSrv = RoleAdminService.me;
	static OrganAdminService orgaSrv = OrganAdminService.me;
	
	public void index() {
		KeUser sUser = getModel(KeUser.class,"s");
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("sUser",sUser);
		setAttr("comQ",comQ);
		setAttr("keUserLogP",srv.findAllUserLog(comQ,sUser));
		render("index.html");
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getUserById(){
		int userId = getParaToInt(0);
		KeUser keUser = KeUser.dao.findById(userId);
		renderJson(keUser);
	}
	
	public void revIsEnable(){
		int userId = getParaToInt("userId");
		boolean isEnable = getParaToBoolean("isEnable");
		KeUser.dao.findById(userId).set("user_isenable", !isEnable).update();
		renderJson(Ret.ok());
	}
	
	public void revIsSuper(){
		int userId = getParaToInt("userId");
		boolean isSuper = getParaToBoolean("isSuper");
		KeUser.dao.findById(userId).set("user_is_super", !isSuper).update();
		renderJson(Ret.ok());
	}
}
