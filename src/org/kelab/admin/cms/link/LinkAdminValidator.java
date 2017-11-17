package org.kelab.admin.cms.link;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class LinkAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		@SuppressWarnings("unused")
		UploadFile uf = c.getFile();
		validateRequired("li.link_name", "linkNameMsg", "名称不能为空!");
		validateRequired("li.link_url", "linkUrlMsg", "链接地址不能为空！");
		validateUrl("li.link_url", "linkUrlMsg", "请使用正确的链接地址！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
