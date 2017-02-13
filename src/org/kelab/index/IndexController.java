package org.kelab.index;


import org.kelab.admin.kn.tree.TreeAdminService;

import com.jfinal.core.Controller;

public class IndexController extends Controller{
	static IndexService srv = new IndexService();
	static TreeAdminService treeSrv = new TreeAdminService();
	public void index(){
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		render("index.html");
	}
	
}
