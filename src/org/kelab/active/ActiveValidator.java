package org.kelab.active;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class ActiveValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("user_name", "userNameMsg", "工号不能为空!");
		validateLong("user_name", 10,11,"userNameMsg", "工号错误!");
		validateRequired("user_real_name", "userRealNameMsg", "真实姓名不能为空！");
		validateRequired("user_email", "userEmailMsg", "邮箱地址不能为空！");
		validateEmail("user_email", "userEmailMsg", "邮箱地址不正确！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
