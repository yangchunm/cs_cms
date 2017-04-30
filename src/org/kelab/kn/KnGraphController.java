package org.kelab.kn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.kelab.bean.CommQuery;
import org.kelab.model.KnGraph;

import com.jfinal.core.Controller;

public class KnGraphController extends Controller{
	static KnGraphService srv = new KnGraphService();
	
	public void index(){
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		int kntrId = getParaToInt(0,1);
		setAttr("kntrId",kntrId);
		//setAttr("entrL",srv.findEntryByTreeId(kntrId,comQ));
		render("tree.html");
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void loadTopGraph(){
		Map ret = new HashMap();
		int topN = getParaToInt(0,30);
		List<KnGraph> nodes = srv.findTopnNode(topN);
		ret.put("nodes", nodes);
		ret.put("edges", srv.findTopnEdge(nodes));
		renderJson(ret);
	}
}
