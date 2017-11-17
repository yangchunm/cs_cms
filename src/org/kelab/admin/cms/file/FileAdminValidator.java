package org.kelab.admin.cms.file;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class FileAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		@SuppressWarnings("unused")
		UploadFile uf = c.getFile();
		validateRequired("fi.file_title", "file_title_msg", "文件名称不能为空!");
		validateRequired("fi.file_content", "file_content_msg", "描述不能为空！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
