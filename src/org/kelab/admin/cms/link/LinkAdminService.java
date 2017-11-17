package org.kelab.admin.cms.link;

import java.util.Date;
import java.util.List;

import org.kelab.model.CmsLink;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class LinkAdminService {
	public static final LinkAdminService me = new LinkAdminService();
	final static CmsLink dao = new CmsLink().dao();
	final String cacheName = "cmsLink";
	
	/**
	 * 加载
	 */
	public List<CmsLink> findAllCmsLink(){
		String sql = "select * from cms_link order by link_order asc";
		return dao.find(sql);
	}
	
	/**
	 * 保存
	 * @param CmsLink对象
	 * @return 结果信息
	 */
	public Ret save(CmsLink cmsLink, Integer userId){
		if (cmsLink.getId() == 0 && isExists(cmsLink)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		cmsLink.setLinkUserId(userId);
		cmsLink.setLinkTime(new Date());
		int currOrder = 1;
		if(findLastOne() != null)
			currOrder = findLastOne().getLinkOrder()+1;
		cmsLink.setLinkOrder(currOrder);
		cmsLink.save();
		LinkAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param cmsLink
	 * @return 
	 */
	private boolean isExists(CmsLink cmsLink) {
		String sql = "select id from cms_link where link_name=? limit 1";
		return Db.queryInt(sql , cmsLink.getLinkName()) != null;
	}
	
	public CmsLink findLastOne(){
		String sql = "select * from cms_link order by link_order desc limit 1";
		List<CmsLink> linkL = dao.find(sql);
		if(linkL.size() >0)
			return linkL.get(0);
		else
			return null;
	}
	
	/**
	 * 删除指定id
	 * @param id
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
	    	if(id > 0 ){
    			Db.update("delete from cms_link where id="+id);
	    		rt=1;
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	
	/**
	 * 调整顺序
	 * @param Id
	 * @return 结果信息
	 */
	public Ret reOrder(int id,int way,int order){
		CmsLink cmsLink = dao.findById(id);
		String sql = "";
		if(way > 0)//增加
			//比当前order大1
			sql = "select * from cms_link where link_order >"+order+" order by link_order asc limit 1";
		else
			//比当前order小1
			sql = "select * from cms_link where link_order <"+order+" order by link_order desc limit 1";
		List<CmsLink> tempL = dao.find(sql);
		if(tempL != null && tempL.size() > 0){
			CmsLink KM =tempL.get(0);
			KM.setLinkOrder(order);
			KM.update();
		}else
			return Ret.fail("msg", "顺序调整失败！");
		cmsLink.setLinkOrder(order+way);
		cmsLink.update();
		
		LinkAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
