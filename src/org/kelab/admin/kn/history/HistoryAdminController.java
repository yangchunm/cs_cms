package org.kelab.admin.kn.history;


import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.KnEntryHistory;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;


public class HistoryAdminController extends BaseController{
	static HistoryAdminService srv = HistoryAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("knHistP",srv.findAllKnHistory(comQ));
		render("index.html");
	}
	
	public void findByKnehId(){
		int knehId = getParaToInt(0,0);
		if(knehId > 0)
			renderJson(Ret.ok("kneh",KnEntryHistory.dao.findById(knehId)));
	}
	
}
