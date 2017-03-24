package org.kelab.index;


import org.kelab.admin.index.IndexAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;

import com.jfinal.core.Controller;

public class IndexController extends Controller{
	static IndexService srv = new IndexService();
	static TreeAdminService treeSrv = new TreeAdminService();
	static IndexAdminService inAdSrv = new IndexAdminService();
	public void index(){
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		setAttr("static",inAdSrv.siteStatics());
		render("index.html");
	}
	
}
