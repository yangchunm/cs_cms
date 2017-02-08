package org.kelab.admin.kn.formula;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class FormulaAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		validateRequired("knfo_name", "knfo_name_msg", "*名称不能为空");
		validateRequired("knfo_tag", "knfo_tag_msg", "*标签不能为空");
		validateRequired("knfo_text", "knfo_text_msg", "*公式不能为空");
		validateRequired("knfo_desc", "knfo_desc_msg", "*公式说明不能为空");
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
}
