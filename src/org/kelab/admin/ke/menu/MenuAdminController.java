package org.kelab.admin.ke.menu;

import java.util.List;

import org.kelab.model.KeMenu;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class MenuAdminController extends Controller{
	static MenuAdminService srv = MenuAdminService.me;
	
	public void index() {
		List<KeMenu> keMenuList = srv.findAllKeMenu(0);
		setAttr("keMenuList",keMenuList);
		render("index.html");
	}
	
	@Before(MenuAdminValidator.class)
	public void save(){
		KeMenu menu = getModel(KeMenu.class,"");
		Ret ret = new Ret();
		if(menu.getId()>0 && menu.update())
			ret =Ret.ok();
		else
			ret = srv.save(menu);
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
	
	public void getMenuById(){
		int menuId = getParaToInt(0);
		@SuppressWarnings("static-access")
		KeMenu keMenu = srv.dao.findById(menuId);
		renderJson(keMenu);
	}
}
