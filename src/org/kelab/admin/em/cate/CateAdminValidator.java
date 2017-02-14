package org.kelab.admin.em.cate;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class CateAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("emca_name", "emcaNameMsg", "名称不能为空!");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
