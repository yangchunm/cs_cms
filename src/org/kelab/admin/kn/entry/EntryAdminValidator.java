package org.kelab.admin.kn.entry;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class EntryAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		validateRequired("en.knen_name", "knen_name_msg", "*名称不能为空");
		validateRequired("en.knen_tag", "knen_tag_msg", "*标签不能为空");
		String entryText = c.getPara("en.knen_text");
		String entryPlainText = c.getPara("en.knen_text_plain");
		if(entryPlainText == null || entryPlainText == "")
			validateRequired("en.knen_text", "knen_text_msg", "*词条正文不能为空");
		if(entryText == null || entryText == "")
			validateRequired("en.knen_text_plain", "knen_text_msg", "*词条正文不能为空");
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
}
