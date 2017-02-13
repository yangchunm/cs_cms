package org.kelab.index;

import java.util.ArrayList;
import java.util.List;

import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.Tree;
import org.kelab.model.KnTree;

public class IndexService{
	static TreeAdminService srvTree = new TreeAdminService();
	
	public List<Tree> getKnTree(int parentId){
		List<Tree> treeL = new ArrayList<Tree>();
		Tree tree = new Tree();		
		String sql = "select * from kn_tree where kntr_parent_id = ? order by id asc";
		List<KnTree> knTreeL = KnTree.dao.find(sql,parentId);
		for(KnTree kntr : knTreeL){
			tree.setId(kntr.getId());
			tree.setText(kntr.getKntrName());
			tree.setNodes(getKnTree(kntr.getId()));
			treeL.add(tree);
		}
		return treeL;
	}
	
}
