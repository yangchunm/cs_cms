package org.kelab.kn;


import java.io.UnsupportedEncodingException;

import org.kelab.admin.index.IndexAdminService;
import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.model.KnEntry;

import com.jfinal.core.Controller;

public class KnIndexController extends Controller{
	static KnIndexService srv = new KnIndexService();
	static TreeAdminService treeSrv = new TreeAdminService();
	static IndexAdminService inAdSrv = new IndexAdminService();
	
	public void index(){
		setAttr("firstEntry",srv.firstEntry());
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		render("index.html");
	}
	
	public void topTags(){
		int topN = getParaToInt(0,30);
		renderJson(TagAdminService.me.findTopKnTag(topN));
	}
	
	public void entry() throws UnsupportedEncodingException{
		String knWord = getPara(0);
		if(knWord == null || knWord == "")
			knWord = getPara("knWord");
		if(knWord != null && knWord != ""){
			knWord = java.net.URLDecoder.decode(knWord,"UTF-8");
			KnEntry knEntry = srv.findEntryByName(knWord);
			if(knEntry != null)
				setAttr("knEntry",knEntry);
			else
				setAttr("simKnEntry",srv.findSimEntryByWord(knWord));
    	}
		render("entry.html");
	}
}
