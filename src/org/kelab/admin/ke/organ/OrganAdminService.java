package org.kelab.admin.ke.organ;

import java.util.List;

import org.kelab.model.KeOrgan;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class OrganAdminService {
	public static final OrganAdminService me = new OrganAdminService();
	final static KeOrgan dao = new KeOrgan().dao();
	final String organCacheName = "keOrgan";
	
	/**
	 * 加载机构
	 * @param Organid
	 * @return 如果Organid为0，则返回所有
	 */
	public List<KeOrgan> findAllKeOrgan(int orgaParentId){
		String sql = "select * from ke_organ where orga_parent_id= ? "
				+ " order by id ASC";
		List<KeOrgan> organList = dao.find(sql,orgaParentId);
		for(KeOrgan keOrgan : organList){
			keOrgan.put("subOrgaL",findAllKeOrgan(keOrgan.getId()));
			//keOrgan.put("userCount",UserAdminService.me.findUserByOrgaId(keOrgan.getId()).size());
		}
		return organList;
	}
	
	
	/**
	 * 保存信息
	 * @param keOrgan对象
	 * @return 结果信息
	 */
	public Ret save(KeOrgan keOrgan){
		if (isExists(keOrgan)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		keOrgan.save();
		OrganAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param keOrgan
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KeOrgan keOrgan) {
		String sql = "select id from ke_organ where orga_name=? limit 1";
		return Db.queryInt(sql , keOrgan.getOrgaName()) != null;
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
    		String checkSql = "select * from ke_user where user_orga_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	
	    		Db.update("delete from ke_organ where id="+id);
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
		CacheKit.removeAll(organCacheName);
	}
}
