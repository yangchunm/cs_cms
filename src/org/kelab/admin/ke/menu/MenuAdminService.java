package org.kelab.admin.ke.menu;

import java.util.List;

import org.kelab.model.KeAction;
import org.kelab.model.KeMenu;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class MenuAdminService {
	public static final MenuAdminService me = new MenuAdminService();
	final static KeMenu dao = new KeMenu().dao();
	final static KeAction keActionDao = new KeAction().dao();
	final String menuCacheName = "keMenu";
	
	/**
	 * 加载菜单项，根据一级菜单查找
	 * @param menuid
	 * @return 如果menuid为0，则返回所有
	 */
	public List<KeMenu> findAllKeMenu(int menuId){
		String strWhere = "";
		if(menuId >0)
			strWhere = " and menu_id = " + menuId;
		String sql = "select * from ke_menu where menu_parent_id= 0 " + strWhere + " order by menu_order ASC";
		List<KeMenu> menuList = (List<KeMenu>) dao.find(sql);
		for(KeMenu keMenu : menuList){
			keMenu.put("subMenuL",findByParentId(keMenu.getId()));
			//keMenu.put("keAction",findAllKeAction(keMenu.getId()));
		}
		return menuList;
	}
	
	/**
	 * 根据一级菜单查找二级菜单
	 * @author yangc
	 * @param menuparentid
	 * @return 该菜单下所有的菜单
	 */
	public List<KeMenu> findByParentId(int parentId){
		String sql = "select * from ke_menu where menu_parent_id = "+parentId+" order by menu_order ASC";
		return dao.find(sql);
	}
	
	/**
	 * 查找某个功能菜单下的所有操作资源
	 * @param menuId
	 * @return 资源列表
	 */
	public List<KeAction> findAllKeAction(int menuId){
		String sql = "";
		if(menuId > 0){
			sql = "select * from ke_action keac, ke_menu_action kemc where kemc.acti_id = keac.id "
					+ "and kemc.menu_id="+ menuId + " order by keac.id ASC";
			return keActionDao.find(sql);
		}else
			return null;
	}
	
	/**
	 * 保存菜单信息
	 * @param keMenu对象
	 * @return 结果信息
	 */
	public Ret save(KeMenu keMenu){
		if (isExists(keMenu)) {
			return Ret.fail("msg", "该菜单名称已经存在");
		}
		if(keMenu.getMenuParentId() == 0){
			keMenu.setMenuLevel(1);
			keMenu.setMenuIsLeaf(false);
		}else{
			keMenu.setMenuLevel(2);
			keMenu.setMenuIsLeaf(true);
		}
		KeMenu tmpM = findLastOne(keMenu);
		int tmpOrder = 1;
		if(tmpM != null)
			tmpOrder = tmpM.getMenuOrder()+1;
		keMenu.setMenuOrder(tmpOrder);
		keMenu.save();
		MenuAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查菜单是否存在
	 * @param keMeny
	 * @return 在同一层中是否存在名字重复的菜单
	 */
	private boolean isExists(KeMenu keMenu) {
		String sql = "select id from ke_menu where menu_parent_id=? and menu_name=? limit 1";
		return Db.queryInt(sql , keMenu.getMenuParentId(), keMenu.getMenuName()) != null;
	}
	
	/**
	 * 获取指定条件的最新一条菜单信息
	 * @param keMenu
	 * @return 一条keMenu信息
	 */
	public KeMenu findLastOne(KeMenu keMenu){
		String sql = "select * from ke_menu where menu_parent_id="+ keMenu.getMenuParentId()+" order by menu_order desc limit 1";
		
		List<KeMenu> menuL = dao.find(sql);
		if(menuL.size()>0)
			return menuL.get(0);
		else
			return null;
	}
	
	/**
	 * 删除指定id的菜单
	 * @param 菜单id
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
	    	if(id > 0 ){
	    		Db.update("delete from ke_menu where id="+id+" or menu_parent_id =" + id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分菜单下还有数据，不能删除！";
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	/**
	 * 调整顺序
	 * @param menuId
	 * @return 结果信息
	 */
	public Ret reOrder(int id,int way,int order){
		KeMenu keMenu = dao.findById(id);
		String sql = "";
		if(way > 0)//增加
			//比当前order大1
			sql = "select * from ke_menu where menu_parent_id = "+keMenu.getMenuParentId()
					+" and menu_order >"+order+" order by menu_order asc limit 1";
		else
			//比当前order小1
			sql = "select * from ke_menu where menu_parent_id = "+keMenu.getMenuParentId()
					+" and menu_order <"+order+" order by menu_order desc limit 1";
		List<KeMenu> tempKM = dao.find(sql);
		if(tempKM != null && tempKM.size() > 0){
			KeMenu KM =tempKM.get(0);
			KM.setMenuOrder(order);
			KM.update();
		}else
			return Ret.fail("msg", "顺序调整失败！");
		keMenu.setMenuOrder(order+way);
		keMenu.update();
		
		MenuAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 获取指定用户id的所有菜单项
	 * @param userId
	 * @return 该用户id对应角色的所有菜单项
	 */
	public List<KeMenu> findByUserId(int userId){
		int parentId =0;
		String sql = "select keme.* from ke_menu keme,ke_role_menu kerm,ke_user keus "
				+ "where keus.user_role_id = kerm.role_id and keme.id = kerm.menu_id"
				+ " and keus.id = ? and keme.menu_parent_id = ? order by keme.menu_order asc";
		List<KeMenu> menuL = dao.find(sql,userId,parentId);
		for(KeMenu keMenu : menuL){
			parentId = keMenu.getId();
			keMenu.put("subMenuL",dao.find(sql,userId,parentId));
		}
		
		return menuL;
	}
	
	/**
	 * 根据roleid查找对应菜单
	 * @param roleId
	 * @return 
	 * @return 该角色对应的菜单名称
	 */
	public List<KeMenu> findMenuByRoleId(int roleId){
		String sql = "select keme.* from ke_role kero, ke_menu keme, ke_role_menu kerm "
				+ "where kero.id = kerm.role_id and kerm.menu_id = keme.id and kero.id = ?"
				+ " and keme.menu_parent_id =? order by keme.menu_order asc";
		List<KeMenu> menuL = dao.find(sql,roleId,0);
		for(KeMenu keMenu : menuL){
			int parentId = keMenu.getId();
			keMenu.put("subMenuL",dao.find(sql,roleId,parentId));
		}
		
		return menuL;
	}
	
	/**
	 * 根据url找菜单
	 * @param url
	 * @return KeMenu
	 */
	public KeMenu findMenuByUrl(String url){
		String sql = "select * from ke_menu where menu_url = ?";
		List<KeMenu> menuL = dao.find(sql,url);
		if(menuL.size()>0)
			return menuL.get(0);
		else
			return null;
				
	}
	
	public void clearCache() {
		CacheKit.removeAll(menuCacheName);
	}
}
