package org.kelab.admin.dm.submit;

import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;

import com.jfinal.kit.Ret;

public class SubmitAdminController extends BaseController{
	static SubmitAdminService srv = SubmitAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("dmSubmP",srv.findAllSubmit(comQ));
		render("index.html");
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getAlgoById(){
		int id = getParaToInt(0);
		renderJson(srv.findOneById(id));
	}
	
}
