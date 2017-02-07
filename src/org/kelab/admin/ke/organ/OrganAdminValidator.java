package org.kelab.admin.ke.organ;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class OrganAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("orga_name", "orgaNameMsg", "名称不能为空!");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
