package org.kelab.admin.kn.tree;

import java.util.List;

import org.kelab.model.KnTree;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class TreeAdminService {
	public static final TreeAdminService me = new TreeAdminService();
	final static KnTree dao = new KnTree().dao();
	final String treeCacheName = "knTree";
	
	/**
	 * 加载树
	 * @param parentId
	 * @return 如果id为0，则返回所有
	 */
	public List<KnTree> findAllKnTree(int treeParentId){
		String sql = "select * from kn_tree where kntr_parent_id= ? "
				+ " order by id ASC";
		List<KnTree> treeList = dao.find(sql,treeParentId);
		for(KnTree knTree : treeList){
			knTree.put("knTreeL",findAllKnTree(knTree.getId()));
		}
		return treeList;
	}
	
	/**
	 * 保存信息
	 * @param knTree对象
	 * @return 结果信息
	 */
	public Ret save(KnTree knTree){
		if (isExists(knTree)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		knTree.save();
		TreeAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param knTree
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnTree knTree) {
		String sql = "select id from ke_organ where orga_name=? limit 1";
		return Db.queryInt(sql , knTree.getKntrName()) != null;
	}
	
	/**
	 * 删除指定id的信息
	 * @param id
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
	    	if(id > 0 ){
	    		Db.update("delete from kn_tree where id="+id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分不能删除！";
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	public void clearCache() {
		CacheKit.removeAll(treeCacheName);
	}
}
