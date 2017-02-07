package org.kelab.admin.ke.menu;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class MenuAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("menu_name", "menuNameMsg", "名称不能为空!");
		validateRequired("menu_url", "menuUrlMsg", "访问地址不能为空！");
		validateRequired("menu_icon", "menuIconMsg", "图标不能为空，使用BootStrap图标！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
