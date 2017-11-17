package org.kelab.admin.cms.slide;

import java.util.Date;
import java.util.List;

import org.kelab.model.CmsSlide;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class SlideAdminService {
	public static final SlideAdminService me = new SlideAdminService();
	final static CmsSlide dao = new CmsSlide().dao();
	final String cacheName = "cmsSlide";
	
	/**
	 * 加载
	 */
	public List<CmsSlide> findAllCmsSlide(){
		String sql = "select * from cms_slide order by slid_order asc";
		return dao.find(sql);
	}
	
	/**
	 * 保存
	 * @param CmsSlide对象
	 * @return 结果信息
	 */
	public Ret save(CmsSlide cmsSlide, Integer userId){
		if (cmsSlide.getId() == 0 && isExists(cmsSlide)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		cmsSlide.setSlidUserId(userId);
		cmsSlide.setSlidTime(new Date());
		int currOrder = 1;
		if(findLastOne() != null)
			currOrder = findLastOne().getSlidOrder()+1;
		cmsSlide.setSlidOrder(currOrder);
		cmsSlide.save();
		SlideAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param cmsSlide
	 * @return 
	 */
	private boolean isExists(CmsSlide cmsSlide) {
		String sql = "select id from cms_slide where slid_title=? limit 1";
		return Db.queryInt(sql , cmsSlide.getSlidTitle()) != null;
	}
	
	public CmsSlide findLastOne(){
		String sql = "select * from cms_slide order by slid_order desc limit 1";
		List<CmsSlide> slideL = dao.find(sql);
		if(slideL.size() >0)
			return slideL.get(0);
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
    			Db.update("delete from cms_slide where id="+id);
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
		CmsSlide cmsSlide = dao.findById(id);
		String sql = "";
		if(way > 0)//增加
			//比当前order大1
			sql = "select * from cms_slide where slid_order >"+order+" order by slid_order asc limit 1";
		else
			//比当前order小1
			sql = "select * from cms_slide where slid_order <"+order+" order by slid_order desc limit 1";
		List<CmsSlide> tempL = dao.find(sql);
		if(tempL != null && tempL.size() > 0){
			CmsSlide KM =tempL.get(0);
			KM.setSlidOrder(order);
			KM.update();
		}else
			return Ret.fail("msg", "顺序调整失败！");
		cmsSlide.setSlidOrder(order+way);
		cmsSlide.update();
		
		SlideAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
