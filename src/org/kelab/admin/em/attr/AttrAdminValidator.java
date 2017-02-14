package org.kelab.admin.em.attr;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class AttrAdminValidator extends Validator {

	protected void validate(Controller c) {
		validateRequired("emat_name", "ematNameMsg", "不能为空");

	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
}
