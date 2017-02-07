package org.kelab.admin.dm.algocate;

import java.util.List;

import org.kelab.model.DmAlgoCate;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class AlgoCateAdminController extends Controller{
	static AlgoCateAdminService srv = AlgoCateAdminService.me;
	
	public void index() {
		List<DmAlgoCate> dmAlgoCateL = srv.findAllCate();
		setAttr("dmAlgoCateL",dmAlgoCateL);
		render("index.html");
	}
	
	@Before(AlgoCateAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		DmAlgoCate algoCate = getModel(DmAlgoCate.class,"");
		ret = srv.save(algoCate,algoCate.getId());
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getAlgoCateById(){
		int id = getParaToInt(0);
		renderJson(DmAlgoCate.dao.findById(id));
	}
}
