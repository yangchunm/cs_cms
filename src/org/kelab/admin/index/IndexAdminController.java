package org.kelab.admin.index;

import com.jfinal.core.Controller;

public class IndexAdminController extends Controller{
	public void index() {
		render("index.html");
	}
}
