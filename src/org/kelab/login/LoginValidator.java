package org.kelab.login;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * ajax 登录参数验证
 */
public class LoginValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("userName", "userNameMsg", "空!");
		validateEmail("userName", "userNameMsg", "格式！");

		validateRequired("userPasswd", "userPasswdMsg", "空！");
		validateCaptcha("captcha", "captchaMsg", "错误！");
	}

	protected void handleError(Controller c) {
		c.renderJson();
	}
}
