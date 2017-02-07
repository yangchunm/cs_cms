
package org.kelab.common.controller;

import org.kelab.login.LoginService;
import org.kelab.model.KeUser;

import com.jfinal.core.Controller;

/**
 * 基础控制器，方便获取登录信息
 *
 * 注意：
 * 需要 LoginSessionInterceptor 配合，该拦截器使用
 * setAttr("loginAccount", ...) 事先注入了登录账户
 * 否则即便已经登录，该控制器也会认为没有登录
 *
 */
public class BaseController extends Controller {

	private KeUser loginUser = null;

	public KeUser getLoginUser() {
		if (loginUser == null) {
			loginUser = getAttr(LoginService.loginUserCacheName);
			if (loginUser != null && ! loginUser.getUserIsenable()) {
				throw new IllegalStateException("当前用户状态不允许登录，status = " + loginUser.getUserIsenable());
			}
		}
		return loginUser;
	}

	public boolean isLogin() {
		return getLoginUser() != null;
	}

	public boolean notLogin() {
		return !isLogin();
	}

	/**
	 * 获取登录账户id
	 * 确保在 FrontAuthInterceptor 之下使用，或者 isLogin() 为 true 时使用
	 * 也即确定已经是在登录后才可调用
	 */
	public int getLoginUserId() {
		return getLoginUser().getId();
	}
}


