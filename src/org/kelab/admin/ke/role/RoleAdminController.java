package org.kelab.admin.ke.role;

import java.util.List;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.model.KeRole;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class RoleAdminController extends Controller{
	static RoleAdminService srv = RoleAdminService.me;
	static MenuAdminService menuSrv = MenuAdminService.me;
	
	public void index() {
		List<KeRole> keRoleList = srv.findByRoleId(0);
		setAttr("keRoleList",keRoleList);
		setAttr("keMenuList",menuSrv.findAllKeMenu(0));
		render("index.html");
	}
	
	@Before(RoleAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		KeRole role = new KeRole();
		role.setRoleName(getPara("role_name"));
		role.setRoleDesc(getPara("role_desc"));
		int roleId = getParaToInt("id",0);
		String[] roleMenu = getParaValues("role_menu");
		if(roleId == 0){//新增
			ret = srv.save(role,roleMenu);
		}else{
			role.setId(roleId);
			ret = srv.update(role, roleMenu);
		}
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getRoleById(){
		int roleId = getParaToInt(0);
		List<KeRole> keRoleL = srv.findByRoleId(roleId);
		if(keRoleL != null)
			renderJson(keRoleL.get(0));
		else
			renderJson(Ret.fail());
	}
}
