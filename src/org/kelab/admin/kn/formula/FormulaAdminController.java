package org.kelab.admin.kn.formula;

import java.io.IOException;
import java.util.Date;

import org.kelab.admin.kn.lang.LangAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnFormula;
import org.kelab.common.controller.BaseController;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;

public class FormulaAdminController extends BaseController{
	static TreeAdminService treeSrv = TreeAdminService.me;
	static FormulaAdminService srv = FormulaAdminService.me;
	static LangAdminService langSrv = LangAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("langMap",langSrv.findAllKnLangMap());
		setAttr("knFormP",srv.findAllForm(comQ));
		render("index.html");
	}
	
	public void add(){
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		setAttr("knLangL",langSrv.findAllKnLang());
		render("edit.html");
	}
	
	public void edit(){
		int id = getParaToInt(0,0);
		setAttr("knForm",KnFormula.dao.findById(id));
		setAttr("knTreeL",treeSrv.findAllKnTree(0));
		setAttr("knLangL",langSrv.findAllKnLang());
		render("edit.html");
	}
	
	@Before(FormulaAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		KnFormula knForm = getModel(KnFormula.class,"");
		knForm.setKnfoTime(new Date());
		knForm.setKnfoUserId(getLoginUserId());
		ret = srv.save(knForm);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getKnFormById(){
		int id = getParaToInt(0);
		renderJson(KnFormula.dao.findById(id));
	}
	
	public void getFormImgById(){
		int id = getParaToInt(0);
		renderHtml(KnFormula.dao.findById(id).getKnfoText());
	}
	
	public void runFormProg() throws IOException{
		int id = getParaToInt(0);
		Ret ret = srv.runFormProg(id);
		renderJson(ret);
	}
	
}
