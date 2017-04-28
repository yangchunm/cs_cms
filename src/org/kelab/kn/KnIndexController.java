package org.kelab.kn;


import java.io.UnsupportedEncodingException;
import java.util.List;

import org.kelab.admin.index.IndexAdminService;
import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.em.EmGeneService;
import org.kelab.model.EmGene;
import org.kelab.model.KnEntry;
import org.kelab.model.KnTree;

import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;

public class KnIndexController extends Controller{
	static KnIndexService srv = new KnIndexService();
	static EmGeneService emgeSrv = new EmGeneService();
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
			if(knEntry != null){
				KnTree knTree = KnTree.dao.findById(knEntry.getKnenKntrId());
				setAttr("knEntryPath",treeSrv.findParentByTree(knTree));
				setAttr("knEntry",knEntry);
			}
			else
				setAttr("simKnEntry",srv.findSimEntryByWord(knWord));
    	}
		setAttr("knWord",knWord);
		render("entry.html");
	}
	
	public void findEmgeByKnWord(){
		Ret ret = new Ret();
		String knWord = getPara("knWord");
		int topN = getParaToInt("topN",10);
		if(knWord != null && knWord != ""){
			List<EmGene> emGeneL = emgeSrv.findGeneByKnWord(knWord, topN);
			if(emGeneL.size()>0)
				ret = Ret.ok("emgeL", emGeneL);
			else
				ret = Ret.fail();
    	}
		renderJson(ret);
	}
}
