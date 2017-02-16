package org.kelab.admin.em.attr;


import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.model.EmAttr;
import org.kelab.model.EmAttrType;
import org.kelab.model.KeSecurity;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class AttrAdminController extends Controller{
	static AttrAdminService srv = AttrAdminService.me;
	static CateAdminService cateSrv = CateAdminService.me;
	
	public void index() {
		setAttr("emAttrL",srv.findAllAttr(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		setAttr("emAttrTyleL",EmAttrType.dao.findAll());
		render("index.html");
	}
	
	@Before(AttrAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		EmAttr attr = getModel(EmAttr.class,"");
		int attrId = getParaToInt("id",0);
		if(attrId == 0){//新增
			ret = srv.save(attr);
		}else{
			attr.setId(attrId);
			attr.update();
			ret = Ret.ok();
		}
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getAttrById(){
		int attrId = getParaToInt(0);
		EmAttr emattr = EmAttr.dao.findById(attrId);
		renderJson(emattr);
	}
	
}
