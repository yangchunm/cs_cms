package org.kelab.admin.ke.user;

import java.util.Date;
import java.util.List;

import org.kelab.bean.CommQuery;
import org.kelab.model.KeUser;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class UserAdminService {
	public static final UserAdminService me = new UserAdminService();
	final static KeUser dao = new KeUser().dao();
	final String userCacheName = "keUser";
	
	/**
	 * 加载
	 * @return 则返回所有
	 */
	public Page<KeUser> findAllUser(CommQuery comQ, KeUser sUser){
		String strSele = "select keus.*,keor.orga_name as orgaName,kero.role_name as roleName,kese.secu_name as secuName";
		String strFrom = "from ke_user keus, ke_organ keor, ke_role kero, ke_security kese";
		String strWhere = " where keus.user_orga_id = keor.id and keus.user_role_id = kero.id and keus.user_security_id = kese.id";
		if(sUser.getUserName() != null)
			strWhere = strWhere + " and keus.user_name like '%"+sUser.getUserName()+"%'";
		if(sUser.getUserRealName() != null)
			strWhere = strWhere + " and keus.user_real_name like '%"+sUser.getUserRealName()+"%'";
		if(sUser.getUserRoleId()!=null &&sUser.getUserRoleId() >0)
			strWhere = strWhere + " and user_role_id ="+sUser.getUserRoleId()+"";
		if(sUser.getUserOrgaId() != null && sUser.getUserOrgaId() >0)
			strWhere = strWhere + " and user_orga_id ="+sUser.getUserOrgaId()+"";
		if(sUser.getUserSecurityId() != null && sUser.getUserSecurityId() >0)
			strWhere = strWhere + " and user_security_id ="+sUser.getUserSecurityId()+"";
		
		Page<KeUser> userP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by keus.id desc");
		return userP;
	}
	

	
	/**
	 * 保存信息
	 * @param keUser对象
	 * @return 结果信息
	 */
	public Ret save(KeUser keUser){
		if (isUserNameExists(keUser.getUserName(),keUser.getId())) {
			return Ret.fail("msg", "该名称已经存在");
		}
		keUser.setUserRegTime(new Date());
		keUser.setUserIsenable(true);
		keUser.setUserIsSuper(true);
		keUser.save();
		UserAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param keUser
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	boolean isUserNameExists(String userName, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from ke_user where user_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , userName) != null;
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
	    		Db.update("delete from ke_user where id=?",id);
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
	
	/**
	 * 根据角色id查找所有用户
	 * @param roleId
	 * @return 用户列表
	 */
	public List<KeUser> findUserByRoleId(int roleId){
		String sql = "select * from ke_user where user_role_id =? order by id asc";
		return dao.find(sql,roleId);
	}
	
	/**
	 * 根据部门id查找所有用户
	 * @param orgaId
	 * @return 用户列表
	 */
	public List<KeUser> findUserByOrgaId(int orgaId){
		String sql = "select * from ke_user where user_orga_id =? order by id asc";
		return dao.find(sql,orgaId);
	}
	
	public void clearCache() {
		CacheKit.removeAll(userCacheName);
	}
}
