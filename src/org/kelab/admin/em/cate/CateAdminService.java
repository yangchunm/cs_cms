package org.kelab.admin.em.cate;

import java.util.List;

import org.kelab.model.EmCate;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class CateAdminService {
	public static final CateAdminService me = new CateAdminService();
	final static EmCate dao = new EmCate().dao();
	final String cacheName = "emCate";
	
	/**
	 * 加载树
	 * @param parentId
	 * @return 如果id为0，则返回所有
	 */
	public List<EmCate> findAllEmCate(int parentId){
		String sql = "select * from em_cate where emca_parent_id= ? "
				+ " order by id ASC";
		List<EmCate> cList = dao.find(sql,parentId);
		for(EmCate cate : cList){
			cate.put("emCateL",findAllEmCate(cate.getId()));
		}
		return cList;
	}
	
	/**
	 * 保存信息
	 * @param emCate对象
	 * @return 结果信息
	 */
	public Ret save(EmCate emCate){
		if (isExists(emCate)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		emCate.save();
		CateAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param emCate
	 * @return 是否存在重复名称
	 */
	private boolean isExists(EmCate emCate) {
		String sql = "select id from em_cate where emca_name=? limit 1";
		return Db.queryInt(sql , emCate.getEmcaName()) != null;
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
    		String checkSql = "select * from em_formula_cate where emca_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	
	    		Db.update("delete from em_cate where id="+id);
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
	
	public EmCate findCateIdByName(String cateName){
		String sql = "select * from em_cate where emca_name=?";
		List<EmCate> cateL = dao.find(sql,cateName);
		if(cateL.size()>0)
			return cateL.get(0);
		else
			return null;
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
