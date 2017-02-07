package org.kelab.admin.kn.tree;

import java.util.List;
import org.kelab.model.KnTree;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;


public class TreeAdminController extends Controller{
	static TreeAdminService srv = TreeAdminService.me;
	
	public void index() {
		List<KnTree> knTreeList = srv.findAllKnTree(0);
		setAttr("knTreeL",knTreeList);
		render("index.html");
	}
	
	@Before(TreeAdminValidator.class)
	public void save(){
		KnTree tree = getModel(KnTree.class,"");
		Ret ret = new Ret();
		if(tree.getId()>0 && tree.update())
			ret =Ret.ok();
		else
			ret = srv.save(tree);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getTreeById(){
		int treeId = getParaToInt(0);
		@SuppressWarnings("static-access")
		KnTree knTree = srv.dao.findById(treeId);
		renderJson(knTree);
	}
}
