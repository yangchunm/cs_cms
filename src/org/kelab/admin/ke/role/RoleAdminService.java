package org.kelab.admin.ke.role;

import java.util.ArrayList;
import java.util.List;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.admin.ke.user.UserAdminService;
import org.kelab.model.KeRole;
import org.kelab.model.KeRoleMenu;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class RoleAdminService {
	public static final RoleAdminService me = new RoleAdminService();
	public static MenuAdminService menuSrv = new MenuAdminService();
	final static KeRole dao = new KeRole().dao();
	final String roleCacheName = "keRole";
	
	/**
	 * 加载
	 * @param roleid
	 * @return 如果roleid为0，则返回所有
	 */
	public List<KeRole> findByRoleId(int roleId){
		List<KeRole> roleL = new ArrayList<KeRole>();
		String sql ="";
		if(roleId == 0){
			sql = "select * from ke_role order by id asc";
			roleL = dao.find(sql);
		}else
			roleL.add(dao.findById(roleId));
		for(KeRole keRole : roleL){
			keRole.put("menuL",menuSrv.findMenuByRoleId(keRole.getId()));
			keRole.put("userCount",UserAdminService.me.findUserByRoleId(keRole.getId()).size());
		}
		return roleL;
	}
	

	
	/**
	 * 保存信息
	 * @param keROle对象
	 * @return 结果信息
	 */
	public Ret save(KeRole keRole, String[] roleMenu){
		if (isExists(keRole,0)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		keRole.save();
		//保存菜单关联
		int currRoleId = findLastOne().getId();
		for(String menuId : roleMenu){
			int currMenuId = Integer.parseInt(menuId);
			new KeRoleMenu().set("role_id",currRoleId)
				.set("menu_id",currMenuId).save();
		}
		if(keRole.getId() != null)
		RoleAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 更新
	 * @param keRole
	 * @result 结果
	 */
	public Ret update(KeRole keRole, String[] roleMenu){
		if(isExists(keRole,keRole.getId())){
			return Ret.fail("msg","改名成已经存在");
		}
		System.out.println("GGG"+keRole.getId());;
		List<KeRoleMenu> reMeL = KeRoleMenu.dao.find("select * from ke_role_menu where role_id =?",keRole.getId());
		for(String newId: roleMenu){//检查新增
			int newMeId = Integer.parseInt(newId);
			boolean isHave = false;
			for(KeRoleMenu oldRM : reMeL){
				if(newMeId == oldRM.getMenuId()){
					isHave = true;
					break;
				}
			}
			if(!isHave){
				new KeRoleMenu().set("role_id", keRole.getId())
					.set("menu_id", newMeId).save();
			}
		}
		for(KeRoleMenu oldRM : reMeL){//检查删除
			boolean isHave = false;
			for(String newId: roleMenu){
				int newMeId = Integer.parseInt(newId);
				if(newMeId == oldRM.getMenuId()){
					isHave = true;
					break;
				}
			}
			if(!isHave){
				oldRM.delete();
			}
		}
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param keRole
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KeRole keRole, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from ke_role where role_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , keRole.getRoleName()) != null;
	}
	
	/**
	 * 找到最新一条信息
	 */
	public KeRole findLastOne(){
		String sql = "select * from ke_role order by id desc limit 1";
		List<KeRole> roleL = dao.find(sql);
		if(roleL.size()>0)
			return roleL.get(0);
		else
			return null;
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
    		String checkSql = "select * from ke_user where user_role_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	
	    		Db.update("delete from ke_role_menu where role_id=?",id);
	    		Db.update("delete from ke_role where id=?",id);
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
	
	
	public List<KeRoleMenu> findRoleMenu(int menuId, int roleId){
		String sql = "select * from ke_role_menu where role_id =? and menu_id = ?";
		return KeRoleMenu.dao.find(sql,roleId,menuId);
	}
	public void clearCache() {
		CacheKit.removeAll(roleCacheName);
	}
}
