package org.kelab.admin.em.gene;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class GeneAdminValidator extends Validator {

	protected void validate(Controller c) {
		validateRequired("em.emge_abbr_name", "emgeAbbrNameMsg", "不能为空");
		validateRequired("em.emge_en_name", "emgeEnNameMsg", "不能为空");
		validateRequired("em.emge_code", "emgeCodeMsg", "不能为空");
		validateRequired("em.emge_src", "emgeSrcMsg", "不能为空");
		validateRequired("em.emge_desc", "emgeDescMsg", "不能为空");
		

	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
}
