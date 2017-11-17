package org.kelab.admin.cms.staff;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class StaffAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		@SuppressWarnings("unused")
		UploadFile uf = c.getFile();
		validateRequired("st.staf_name_piny", "staf_name_piny_msg", "姓名的拼音或英文名不能为空!");
		validateRequired("st.staf_office", "staf_office_msg", "办公地址不能为空！");
		validateRequired("st.staf_resume", "staf_resume_msg", "个人简历不能为空！");
		validateRequired("st.staf_title", "staf_title_msg", "职称不能为空！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
