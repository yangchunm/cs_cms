package org.kelab.admin.cms.news;

import java.util.Date;

import org.kelab.bean.CommQuery;
import org.kelab.model.CmsNews;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class NewsAdminService {
	public static final NewsAdminService me = new NewsAdminService();
	final static CmsNews dao = new CmsNews().dao();
	final String cacheName = "cmsNews";
	
	/**
	 * 加载新闻列表
	 * @param newsId
	 * @return 如果niewsId为0，则返回所有
	 */
	public Page<CmsNews> findAllCmsNews(CommQuery comQ){
		String strSele = "select cmne.*,cmna.navi_name as naviName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from cms_news cmne, cms_navi cmna, ke_user keus";
		String strWhere = " where keus.id = cmne.news_user_id and cmne.news_navi_id = cmna.id ";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (cmne.news_title like '%"+comQ.getKeyWord()+"%' "
					+ " or cmne.news_tags like '%"+comQ.getKeyWord()+"%') ";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and cmne.news_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		if(comQ.getNaviId()>0)
			strWhere = strWhere + " and cmne.news_navi_id = "+comQ.getNaviId();
		Page<CmsNews> cmsNewsP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by cmne.news_is_top desc,cmne.id desc");
		return cmsNewsP;
	}
	
	
	/**
	 * 保存菜单信息
	 * @param CmsNews对象
	 * @return 结果信息
	 */
	public Ret save(CmsNews cmsNews){
		if (isExists(cmsNews)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		cmsNews.setNewsTime(new Date());
		cmsNews.setNewsIsRestrict(false);
		cmsNews.setNewsIsPub(true);
		cmsNews.save();
		NewsAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param cmsNews
	 * @return 是否存在名字重复
	 */
	private boolean isExists(CmsNews cmsNews) {
		String sql = "select id from cms_news where news_title=? limit 1";
		return Db.queryInt(sql , cmsNews.getNewsTitle()) != null;
	}
	
	/**
	 * 删除指定id的news
	 * @param newsid
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
	    	if(id > 0 ){
	    		Db.update("delete from cms_news where id="+id);
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

	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
