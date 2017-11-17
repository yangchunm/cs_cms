package org.kelab.admin.cms.slide;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class SlideAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		@SuppressWarnings("unused")
		UploadFile uf = c.getFile();
		validateRequired("sl.slid_title", "slidTitleMsg", "名称不能为空!");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
