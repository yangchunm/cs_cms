package org.kelab.admin.dm.algocate;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class AlgoCateAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("dmac_name", "dmacNameMsg", "名称不能为空!");
		validateRequired("dmac_desc", "dmacDescMsg", "描述不能为空!");
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
