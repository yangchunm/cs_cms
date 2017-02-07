package org.kelab.admin.kn.tree;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class TreeAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("kntr_name", "kntrNameMsg", "名称不能为空!");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
