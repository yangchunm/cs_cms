package org.kelab.admin.ke.role;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class RoleAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("role_name", "roleNameMsg", "名称不能为空!");
		validateRequired("role_desc", "roleDescMsg", "描述不能为空!");
		validateRequired("role_menu", "roleMenuMsg", "请选择对应的功能!");
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
