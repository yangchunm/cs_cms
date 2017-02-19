package org.kelab.admin.em.gene;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class GeneAdminValidator extends Validator {

	protected void validate(Controller c) {
		validateRequired("em.emge_abbr_name", "emge_abbr_name_msg", "不能为空");
		validateRequired("em.emge_en_name", "emge_en_name_msg", "不能为空");
		validateRequired("em.emge_code", "emge_code_msg", "不能为空");
		validateRequired("em.emge_src", "emge_src_msg", "不能为空");
		validateRequired("em.emge_desc", "emge_desc_msg", "不能为空");
		validateRequired("emcateId", "em_cate_id_msg", "请选择配方分类信息！");
		

	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
}
