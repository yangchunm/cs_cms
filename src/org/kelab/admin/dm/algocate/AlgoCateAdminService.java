package org.kelab.admin.dm.algocate;

import java.util.List;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.model.DmAlgoCate;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class AlgoCateAdminService {
	public static final AlgoCateAdminService me = new AlgoCateAdminService();
	public static MenuAdminService menuSrv = new MenuAdminService();
	final static DmAlgoCate dao = new DmAlgoCate().dao();
	final String cateCacheName = "dmAlgoCate";
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public List<DmAlgoCate> findAllCate(){
		List<DmAlgoCate> acL = dao.find("select * from dm_algo_cate order by id ASC");
		for(DmAlgoCate dmac : acL){
			dmac.put("alCount",Db.find("select * from dm_algorithm where dmal_dmac_id =?",dmac.getId()).size());
		}
		return acL;
	}
	
	/**
	 * 保存信息
	 * @param DmAlgoCate对象
	 * @return 结果信息
	 */
	public Ret save(DmAlgoCate algoCate,int oldId){
		if (isExists(algoCate,oldId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		if(oldId == 0)
			algoCate.save();
		else
			algoCate.update();
		AlgoCateAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param DmAlgoCate
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(DmAlgoCate algoCate, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from dm_algo_cate where dmac_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , algoCate.getDmacName()) != null;
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
    		String checkSql = "select * from dm_algorithm where dmal_dmac_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from dm_algo_cate where id=?",id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分记录关联数据，不能删除！";
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	public void clearCache() {
		CacheKit.removeAll(cateCacheName);
	}
}
