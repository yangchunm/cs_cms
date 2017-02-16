package org.kelab.admin.em.gene;


import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.EmAttr;
import org.kelab.model.EmAttrType;
import org.kelab.model.KeSecurity;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class GeneAdminController extends Controller{
	static GeneAdminService srv = GeneAdminService.me;
	static CateAdminService cateSrv = CateAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("emGeneP",srv.findAllGene(comQ));
		render("index.html");
	}
	
	@Before(GeneAdminValidator.class)
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
