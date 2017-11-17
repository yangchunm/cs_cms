
package org.kelab.common.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import java.util.List;

import org.kelab.common.navi.NaviService;
import org.kelab.model.CmsNavi;

/**
 * 需要登录才能授权的操作，例如文件下载
 * 
 * 未登录将被重定向到登录界面，登录成功后又会再返回到原来想跳去的 url
 * 注意在登录表单中有 returnUrl 变量的传递才能跳到原来想跳去的 url
 * 详见登录页面表单传参
 */
public class FrontAuthInterceptor implements Interceptor {
	public void intercept(Invocation inv) {
		//获取菜单项
		Controller c = inv.getController();
		List<CmsNavi> naviL = NaviService.me.findAllCmsNaviByEn("");
		c.setAttr("naviL", naviL);
		inv.invoke();
		/*if (inv.getController().getAttr(LoginService.loginUserCacheName) != null) {
			inv.invoke();
		} else {
			String queryString = inv.getController().getRequest().getQueryString();
			if (StrKit.isBlank(queryString)) {
				inv.getController().redirect("/login?returnUrl=" + inv.getActionKey());
			} else {
				inv.getController().redirect("/login?returnUrl=" + inv.getActionKey() + "?" + queryString);
			}
		}*/
	}
}

