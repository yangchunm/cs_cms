package org.kelab.admin.em.attr;


import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.admin.ke.organ.OrganAdminService;
import org.kelab.admin.ke.role.RoleAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.EmAttr;
import org.kelab.model.KeSecurity;
import org.kelab.model.KeUser;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class AttrAdminController extends Controller{
	static AttrAdminService srv = AttrAdminService.me;
	static CateAdminService cateSrv = CateAdminService.me;
	
	public void index() {
		EmAttr emAttr = getModel(EmAttr.class,"s");
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("sEmat",emAttr);
		setAttr("emAttrP",srv.findAllAttr(comQ,emAttr));
		setAttr("emCateL",cateSrv.findAllEmCate(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		render("index.html");
	}
	
	@Before(AttrAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		EmAttr attr = getModel(EmAttr.class,"em");
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
	
	public void revIsEnable(){
		int userId = getParaToInt("userId");
		boolean isEnable = getParaToBoolean("isEnable");
		KeUser.dao.findById(userId).set("user_isenable", !isEnable).update();
		renderJson(Ret.ok());
	}
	
	public void revIsSuper(){
		int userId = getParaToInt("userId");
		boolean isSuper = getParaToBoolean("isSuper");
		KeUser.dao.findById(userId).set("user_is_super", !isSuper).update();
		renderJson(Ret.ok());
	}
}
