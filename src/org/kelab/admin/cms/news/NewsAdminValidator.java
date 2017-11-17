package org.kelab.admin.cms.news;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class NewsAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		@SuppressWarnings("unused")
		UploadFile uf = c.getFile();
		validateRequired("ne.news_title", "news_title_msg", "新闻标题不能为空!");
		validateRequired("ne.news_content", "news_content_msg", "新闻正文不能为空！");
		
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
}
