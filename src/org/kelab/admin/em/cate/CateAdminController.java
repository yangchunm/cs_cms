package org.kelab.admin.em.cate;

import java.util.List;

import org.kelab.model.EmCate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class CateAdminController extends Controller{
	static CateAdminService srv = CateAdminService.me;
	
	public void index() {
		List<EmCate> emCateL = srv.findAllEmCate(0);
		setAttr("emCateL",emCateL);
		render("index.html");
	}
	
	@Before(CateAdminValidator.class)
	public void save(){
		EmCate cate = getModel(EmCate.class,"");
		Ret ret = new Ret();
		if(cate.getId()>0 && cate.update())
			ret =Ret.ok();
		else
			ret = srv.save(cate);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getCateById(){
		int cateId = getParaToInt(0);
		@SuppressWarnings("static-access")
		EmCate cate = srv.dao.findById(cateId);
		renderJson(cate);
	}
}
