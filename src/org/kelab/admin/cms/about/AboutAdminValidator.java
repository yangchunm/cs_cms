package org.kelab.admin.cms.about;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class AboutAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("abou_title", "abou_title_msg", "标题不能为空!");
		validateRequired("abou_content", "abou_content_msg", "正文内容不能为空！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
