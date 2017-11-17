package org.kelab.admin.cms.navi;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class NaviAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);

		validateRequired("navi_name", "naviNameMsg", "名称不能为空!");
		//validateRequired("navi_url", "naviUrlMsg", "访问地址不能为空！");
		validateRequired("navi_name_en", "naviNameEnMsg", "英文名称不能为空！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
