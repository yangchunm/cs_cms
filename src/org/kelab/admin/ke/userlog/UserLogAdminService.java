package org.kelab.admin.ke.userlog;

import org.kelab.bean.CommQuery;
import org.kelab.model.KeUser;
import org.kelab.model.KeUserLog;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class UserLogAdminService {
	public static final UserLogAdminService me = new UserLogAdminService();
	final static KeUserLog dao = new KeUserLog().dao();
	final String userCacheName = "keUser";
	
	/**
	 * 加载
	 * @return 则返回所有
	 */
	public Page<KeUserLog> findAllUserLog(CommQuery comQ, KeUser sUser){
		String strSele = "select keul.*,keus.id as userId,keus.user_name as userName,keus.user_real_name as userRealName,"
				+ "keor.orga_name as orgaName,kero.role_name as roleName,kese.secu_name as secuName";
		String strFrom = "from ke_user keus, ke_organ keor, ke_role kero, ke_security kese, ke_user_log keul";
		String strWhere = " where keus.user_orga_id = keor.id and keus.user_role_id = kero.id "
				+ "and keus.user_security_id = kese.id and keus.id = keul.log_user_id ";
		if(sUser.getUserName() != null)
			strWhere = strWhere + " and (keus.user_name like '%"+sUser.getUserName()+"%'"
					+ " or keus.user_real_name like '%"+sUser.getUserName()+"%')";
		if(comQ.getKeyWord() != null)
			strWhere = strWhere + " and (keul.log_desc like '%"+comQ.getKeyWord()+"%' "
					+ " or keul.log_opt_table like '%"+comQ.getKeyWord()+"')";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and keul.log_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		/*if(sUser.getUserRoleId()!=null &&sUser.getUserRoleId() >0)
			strWhere = strWhere + " and user_role_id ="+sUser.getUserRoleId()+"";
		if(sUser.getUserOrgaId() != null && sUser.getUserOrgaId() >0)
			strWhere = strWhere + " and user_orga_id ="+sUser.getUserOrgaId()+"";
		if(sUser.getUserSecurityId() != null && sUser.getUserSecurityId() >0)
			strWhere = strWhere + " and user_security_id ="+sUser.getUserSecurityId()+"";*/
		
		Page<KeUserLog> userP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by keul.id desc");
		return userP;
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
	    		Db.update("delete from ke_user_log where id=?",id);
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
		CacheKit.removeAll(userCacheName);
	}
}
