package org.kelab.admin.em.gene;


import java.util.Date;

import org.kelab.admin.em.attr.AttrAdminService;
import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.EmAttr;
import org.kelab.model.EmGene;
import org.kelab.model.KeSecurity;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;


public class GeneAdminController  extends BaseController{
	static GeneAdminService srv = GeneAdminService.me;
	static CateAdminService cateSrv = CateAdminService.me;
	static AttrAdminService attrSrv = AttrAdminService.me;
	
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
	
	public void add(){
		setAttr("emCateL",cateSrv.findAllEmCate(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		setAttr("emAttrL",attrSrv.findAllAttrValue(0,0));
		render("edit.html");
	}
	
	@Before(GeneAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		EmGene gene = getModel(EmGene.class,"em");
		String[] emCateIds = getParaValues("emcateId");
		gene.setEmgeUserId(getLoginUserId());
		gene.setEmgeCreateTime(new Date());
		gene.setEmgeUpdateTime(new Date());
		ret = srv.save(gene,emCateIds);
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
