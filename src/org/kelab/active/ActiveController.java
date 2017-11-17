package org.kelab.active;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.model.CmsNavi;
import org.kelab.model.KeUser;
import org.kelab.util.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;


public class ActiveController extends Controller{
	static ActiveService srv = new ActiveService();
	static NaviAdminService naviSrv = new NaviAdminService();
	Prop p = PropKit.use("config.properties");
	
	public void index(){
		setAttr("step",1);
		render("index.html");
	}
	
	@Before(ActiveValidator.class)
	public void confirm(){
		KeUser keUser = getModel(KeUser.class,"");
		KeUser user = srv.findUserByAvtive(keUser);
		if(user != null){
			String actiCode = StringUtils.MD5(String.valueOf(System.currentTimeMillis()));
			user.set("user_acti_codeset",actiCode)
				.set("user_email",keUser.getUserEmail())
				.update();
			String emailMsg = "<a href=\""+p.get("sysUrl")+"/doactive/"+actiCode+"\">请点击这里激活您的账号>>></a>";
			setAttr("step",2);
			setAttr("em",emailMsg);
		}else{
			setAttr("step",1);
			setAttr("msg","该账户不存在，或该用户已经激活！");
			render("index.html");
		}
	}

}
