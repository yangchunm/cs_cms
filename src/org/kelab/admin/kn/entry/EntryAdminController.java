package org.kelab.admin.kn.entry;

import java.util.Date;

import org.kelab.admin.kn.file.FileAdminService;
import org.kelab.admin.kn.formula.FormulaAdminService;
import org.kelab.admin.kn.lang.LangAdminService;
import org.kelab.admin.kn.molecular.MolecularAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnFormula;
import org.kelab.common.controller.BaseController;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;

public class EntryAdminController extends BaseController{
	static TreeAdminService treeSrv = TreeAdminService.me;
	static EntryAdminService srv = EntryAdminService.me;
	static LangAdminService langSrv = LangAdminService.me;
	static FileAdminService fileSrv = FileAdminService.me;
	static FormulaAdminService formSrv = FormulaAdminService.me;
	static MolecularAdminService moleSrv = MolecularAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("knEntryP",srv.findAllEntry(comQ));
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
	
	public void findRelaFile(){
		int kntrId = getParaToInt("kntrId",0);
		String enTags = getPara("enTags");
		int page = getParaToInt("page",1);
		int pageSize = getParaToInt("pageSize",5);
		renderJson(fileSrv.findFileByWords(kntrId, enTags, page, pageSize));
	}
	
	public void findRelaForm(){
		int kntrId = getParaToInt("kntrId",0);
		String enTags = getPara("enTags");
		int page = getParaToInt("page",1);
		int pageSize = getParaToInt("pageSize",5);
		renderJson(formSrv.findFileByWords(kntrId, enTags, page, pageSize));
	}
	
	public void findRelaMole(){
		int kntrId = getParaToInt("kntrId",0);
		String enTags = getPara("enTags");
		int page = getParaToInt("page",1);
		int pageSize = getParaToInt("pageSize",5);
		renderJson(moleSrv.findFileByWords(kntrId, enTags, page, pageSize));
	}
	
	@Before(EntryAdminValidator.class)
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
	
}
