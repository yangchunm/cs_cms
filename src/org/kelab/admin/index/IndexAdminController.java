package org.kelab.admin.index;

import com.jfinal.core.Controller;

public class IndexAdminController extends Controller{
	static IndexAdminService srv = IndexAdminService.me;
	public void index() throws Exception {
		setAttr("static",srv.siteStatics());
		setAttr("srvSta",srv.serverStatus());
		render("index.html");
	}
}
