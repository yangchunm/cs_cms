package org.kelab.admin.ke.user;


import org.kelab.admin.ke.organ.OrganAdminService;
import org.kelab.admin.ke.role.RoleAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KeSecurity;
import org.kelab.model.KeUser;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class UserAdminController extends Controller{
	static UserAdminService srv = UserAdminService.me;
	static RoleAdminService roleSrv = RoleAdminService.me;
	static OrganAdminService orgaSrv = OrganAdminService.me;
	
	public void index() {
		KeUser sUser = getModel(KeUser.class,"s");
		CommQuery comQ = new CommQuery();
		comQ.setPageSize(getParaToInt("pageSize",10));
		comQ.setPage(getParaToInt("page",1));
		comQ.setKeyWord(getPara("keyWord"));
		setAttr("sUser",sUser);
		setAttr("comQ",comQ);
		setAttr("keUserP",srv.findAllUser(comQ,sUser));
		setAttr("keRoleL",roleSrv.findByRoleId(0));
		setAttr("keOrgaL",orgaSrv.findAllKeOrgan(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		render("index.html");
	}
	
	@Before(UserAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		KeUser user = getModel(KeUser.class,"");
		int userId = getParaToInt("id",0);
		if(userId == 0){//新增
			ret = srv.save(user);
		}else{
			user.setId(userId);
			user.update();
			ret = Ret.ok();
		}
		renderJson(ret);
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
