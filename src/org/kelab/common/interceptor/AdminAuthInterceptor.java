
package org.kelab.common.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.Date;
import java.util.List;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.admin.ke.role.RoleAdminService;
import org.kelab.login.LoginService;
import org.kelab.model.KeMenu;
import org.kelab.model.KeUser;
import org.kelab.util.IpKit;

/**
 * 后台权限管理拦截器
 * 
 * 暂时做成最简单的判断当前用户是否是管理员账号，后续改成完善的
 * 基于用户、角色、权限的权限管理系统，并且实现角色、权限完全动态化配置
 */
public class AdminAuthInterceptor implements Interceptor {

	public static boolean isAdmin(KeUser loginUser) {
		return loginUser != null && loginUser.getUserIsSuper();
	}

	public void intercept(Invocation inv) {
		Controller c = inv.getController();
		KeUser loginAccount = c.getAttr(LoginService.loginUserCacheName);
		if (isAdmin(loginAccount)) {
			//获取菜单项
			List<KeMenu> menuL = MenuAdminService.me.findByUserId(loginAccount.getId());
			c.setAttr("menuL", menuL);
			String acName[] = inv.getActionKey().split("/");
			String currMenuUrl ="";
			if(acName.length >2)
				currMenuUrl = acName[2];
			else
				currMenuUrl = "index";
			if(isInMenuL(currMenuUrl,loginAccount.getUserRoleId())){
				//加日志
				String loginIp = IpKit.getRealIp(c.getRequest());
				Record userLog = new Record().set("log_user_id", loginAccount.getId())
						.set("log_ip", loginIp)
						.set("log_desc", inv.getActionKey())
						.set("log_time", new Date())
						.set("log_opt_table",inv.getMethodName());
				Db.save("ke_user_log", userLog);
				inv.invoke();
			}else
				c.renderError(403);
		} else {
			c.renderError(403);
		}
	}
	
	public boolean isInMenuL(String currUrl, int roleId){
		KeMenu menu = MenuAdminService.me.findMenuByUrl(currUrl);
		if(menu != null && RoleAdminService.me.findRoleMenu(menu.getId(),roleId).size()>0){
			return true;
		} 
		else		
			return false;
	}
}

