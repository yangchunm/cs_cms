package org.kelab.index;


import com.jfinal.core.Controller;

public class IndexController extends Controller{
	public void index(){
		//PropKit.use("config.properties");
		//renderText("hello Jfinal World！！！欢迎！"+PropKit.get("sysName"));
		//new KnTree().set("kntr_parent_id","0").set("kntr_name", "火炸药历史").set("kntr_type","1").save();
		render("index.html");
	}
	
}
