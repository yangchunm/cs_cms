package org.kelab.common.navi;

import java.util.Date;
import java.util.List;

import org.kelab.admin.cms.about.AboutAdminService;
import org.kelab.model.CmsAbout;
import org.kelab.model.CmsNavi;
import org.kelab.model.CmsNaviType;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class NaviService {
	public static final NaviService me = new NaviService();
	final static AboutAdminService abouSrv = new AboutAdminService();
	final static CmsNavi dao = new CmsNavi().dao();
	final String cacheName = "keMenu";
	
	/**
	 * 加载菜单项，根据一级菜单查找
	 * @param menuid
	 * @return 如果menuid为0，则返回所有
	 */
	public List<CmsNavi> findAllCmsNavi(int parentId){
		String sql = "select cmna.*,cmnt.naty_name as typeName from cms_navi cmna,cms_navi_type cmnt"
				+ " where cmna.navi_type = cmnt.id and cmna.navi_parent_id= " + parentId + " order by "
						+ "cmna.navi_order ASC";
		List<CmsNavi> naviList = (List<CmsNavi>) dao.find(sql);
		for(CmsNavi cmsNavi : naviList){
			cmsNavi.put("subNaviL",findAllCmsNavi(cmsNavi.getId()));
		}
		return naviList;
	}
	
	
	public List<CmsNavi> findAllCmsNaviByEn(String naviEnName){
		int parentId = 0;
		if(naviEnName != null && naviEnName != ""){
			String sql = "select * from cms_navi where navi_name = ?";
			List<CmsNavi> tmpL = dao.find(sql,naviEnName);
			if(tmpL.size()>0)
				parentId = tmpL.get(0).getId();
		}
		String sql = "select cmna.*,cmnt.naty_name as typeName from cms_navi cmna,cms_navi_type cmnt"
				+ " where cmna.navi_type = cmnt.id and cmna.navi_parent_id= " + parentId + " order by "
						+ "cmna.navi_order ASC";
		List<CmsNavi> naviList = (List<CmsNavi>) dao.find(sql);
		for(CmsNavi cmsNavi : naviList){
			cmsNavi.put("subNaviL",findAllCmsNavi(cmsNavi.getId()));
		}
		return naviList;
	}
	
	public List<CmsNaviType> findAllNaviType(){
		String sql = "select * from cms_navi_type order by id asc";
		return CmsNaviType.dao.find(sql);
	}
	
	/**
	 * 根据一级菜单查找二级菜单
	 * @author yangc
	 * @param menuparentid
	 * @return 该菜单下所有的菜单
	 */
	public List<CmsNavi> findByParentId(int parentId){
		String sql = "select * from cms_navi where navi_parent_id = "+parentId+" order by navi_order ASC";
		return dao.find(sql);
	}
	
	/**
	 * 保存菜单信息
	 * @param CmsNavi对象
	 * @return 结果信息
	 */
	public Ret save(CmsNavi cmsNavi,int userId){
		if (cmsNavi.getId() == 0 && isExists(cmsNavi)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		if(cmsNavi.getNaviParentId() == 0){
			cmsNavi.setNaviLevel(1);
		}else{
			cmsNavi.setNaviLevel(2);
		}
		CmsNavi tmpM = findLastOne(cmsNavi);
		int tmpOrder = 1;
		if(tmpM != null)
			tmpOrder = tmpM.getNaviOrder()+1;
		cmsNavi.setNaviOrder(tmpOrder);
		if(cmsNavi.getId()>0){
			cmsNavi.update();
			if(cmsNavi.getNaviType() == 1 && abouSrv.findByNaviId(cmsNavi.getId()) == null){
				new CmsAbout().set("abou_navi_id",cmsNavi.getId())
								.set("abou_user_id", userId).set("abou_time", new Date())
								.set("abou_title",cmsNavi.getNaviName()).save();
			}
		}
		else{
			cmsNavi.save();
			//信息类栏目直接添加到About
			CmsNavi tmpNavi = findNaviByName(cmsNavi.getNaviName());
			if(cmsNavi.getNaviType() == 1){
				new CmsAbout().set("abou_navi_id",tmpNavi.getId())
								.set("abou_user_id", userId).set("abou_time", new Date())
								.set("abou_title",tmpNavi.getNaviName()).save();
			}
		}
		NaviService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查菜单是否存在
	 * @param cmsNavi
	 * @return 在同一层中是否存在名字重复的菜单
	 */
	private boolean isExists(CmsNavi cmsNavi) {
		String sql = "select id from cms_navi where navi_parent_id=? and navi_name=? limit 1";
		return Db.queryInt(sql , cmsNavi.getNaviParentId(), cmsNavi.getNaviName()) != null;
	}
	
	/**
	 * 获取指定条件的最新一条菜单信息
	 * @param cmsnavi
	 * @return 一条cmsNavi信息
	 */
	public CmsNavi findLastOne(CmsNavi cmsNavi){
		String sql = "select * from cms_navi where navi_parent_id="+ cmsNavi.getNaviParentId()+" order by navi_order desc limit 1";
		
		List<CmsNavi> naviL = dao.find(sql);
		if(naviL.size()>0)
			return naviL.get(0);
		else
			return null;
	}
	
	
	public List<CmsNavi> findNaviByType(int typeId){
		String sql = "select * from cms_navi where navi_type = ? order by navi_order asc";
		return dao.find(sql,typeId);
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
	    		CmsNavi tmpNavi = CmsNavi.dao.findById(id);
	    		if(tmpNavi.getNaviType() == 1){
	    			Db.update("delete from cms_about where abou_navi_id = "+ id);
	    			Db.update("delete from cms_navi where id="+id);
	    		}else if(tmpNavi.getNaviType() > 1 && !checkHaveContent(tmpNavi)){
	    			Db.update("delete from cms_navi where id="+id);
	    		}	    		
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分下还有数据，不能删除！";
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	public boolean checkHaveContent(CmsNavi cmsNavi){
		String tableName = "cms_news";
		switch(cmsNavi.getNaviType()){
			case 3 : tableName = "cms_file"; break;
			case 4 : tableName = "cms_slide"; break;
			case 5 : tableName = "cms_veido"; break;
		}
		String sql ="select count(id) from "+ tableName;
		Long Num = Db.queryLong(sql);
		if(Num >0)
			return true;
		else
			return false;
	}
	
	/**
	 * 调整顺序
	 * @param menuId
	 * @return 结果信息
	 */
	public Ret reOrder(int id,int way,int order){
		CmsNavi cmsNavi = dao.findById(id);
		String sql = "";
		if(way > 0)//增加
			//比当前order大1
			sql = "select * from cms_navi where navi_parent_id = "+cmsNavi.getNaviParentId()
					+" and navi_order >"+order+" order by navi_order asc limit 1";
		else
			//比当前order小1
			sql = "select * from cms_navi where navi_parent_id = "+cmsNavi.getNaviParentId()
					+" and navi_order <"+order+" order by navi_order desc limit 1";
		List<CmsNavi> tempKM = dao.find(sql);
		if(tempKM != null && tempKM.size() > 0){
			CmsNavi KM =tempKM.get(0);
			KM.setNaviOrder(order);
			KM.update();
		}else
			return Ret.fail("msg", "顺序调整失败！");
		cmsNavi.setNaviOrder(order+way);
		cmsNavi.update();
		
		NaviService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	

	
	
	/**
	 * 根据name找栏目
	 * @param naviName
	 * @return cmsNavi
	 */
	public CmsNavi findNaviByName(String naviName){
		String sql = "select * from cms_navi where navi_name= ?";
		List<CmsNavi> naviL = dao.find(sql,naviName);
		if(naviL.size()>0)
			return naviL.get(0);
		else
			return null;
				
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
