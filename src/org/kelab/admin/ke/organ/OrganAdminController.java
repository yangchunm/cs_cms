package org.kelab.admin.ke.organ;

import java.util.List;

import org.kelab.model.KeOrgan;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class OrganAdminController extends Controller{
	static OrganAdminService srv = OrganAdminService.me;
	
	public void index() {
		List<KeOrgan> keOrganList = srv.findAllKeOrgan(0);
		setAttr("keOrgaList",keOrganList);
		render("index.html");
	}
	
	@Before(OrganAdminValidator.class)
	public void save(){
		KeOrgan organ = getModel(KeOrgan.class,"");
		Ret ret = new Ret();
		if(organ.getId()>0 && organ.update())
			ret =Ret.ok();
		else
			ret = srv.save(organ);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getOrganById(){
		int OrganId = getParaToInt(0);
		@SuppressWarnings("static-access")
		KeOrgan keOrgan = srv.dao.findById(OrganId);
		renderJson(keOrgan);
	}
}
