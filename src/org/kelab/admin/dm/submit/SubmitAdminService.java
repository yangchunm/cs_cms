package org.kelab.admin.dm.submit;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.DmSubmit;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class SubmitAdminService {
	public static final SubmitAdminService me = new SubmitAdminService();
	public static MenuAdminService menuSrv = new MenuAdminService();
	final static DmSubmit dao = new DmSubmit().dao();
	final String cacheName = "dmSubmit";
	
	/**
	 * 加载
	 * @param comQ
	 * @return 则返回所有
	 */
	public Page<DmSubmit> findAllSubmit(CommQuery comQ){
		String strSele = "select dmsu.*,dmal.dmal_name as dmalName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from dm_algorithm dmal, dm_submit dmsu, ke_user keus";
		String strWhere = " where keus.id = dmsu.dmsu_user_id and dmsu.dmsu_dmal_id = dmal.id";
		if(comQ.getKeyWord() != null)
			strWhere = strWhere + " and (dmal.dmal_name like '%"+comQ.getKeyWord()+"%'"
					+ " or keus.user_name like '%"+comQ.getKeyWord()+"%' "
					+ " or kues.user_real_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and dmsu.dmsu_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<DmSubmit> submP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by dmsu.id desc");
		return submP;
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
	    		Db.update("delete from dm_submit where id=?",id);
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
	
	/**
	 * 获取最新一条信息
	 */
	public DmSubmit findOneById(int submId){
		DmSubmit subm = dao.findById(submId);
		String sql = "select * from dm_algo_argument where dmaa_dmal_id = ? order by id asc";
		subm.put("argL",DmSubmit.dao.find(sql,submId));
		return subm;
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
