package org.kelab.admin.cms.about;

import java.util.List;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.CmsAbout;
import org.kelab.model.CmsNavi;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class AboutAdminService {
	public static final AboutAdminService me = new AboutAdminService();
	final static CmsAbout dao = new CmsAbout().dao();
	final String cacheName = "about";
	
	/**
	 * 加载列表
	 * @param abouId
	 * @return 如果abouId为0，则返回所有
	 */
	public Page<CmsAbout> findAllCmsAbout(CommQuery comQ){
		String strSele = "select cmab.*,cmna.navi_name as naviName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from cms_about cmab, cms_navi cmna, ke_user keus";
		String strWhere = " where keus.id = cmab.abou_user_id and cmab.abou_navi_id = cmna.id ";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (cmab.abou_title like '%"+comQ.getKeyWord()+"%' "
					+ " or cmab.abou_tags like '%"+comQ.getKeyWord()+"%') ";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and cmab.abou_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		if(comQ.getNaviId()>0)
			strWhere = strWhere + " and cmab.abou_navi_id = "+comQ.getNaviId();
		Page<CmsAbout> cmsAboutP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by cmab.id desc");
		return cmsAboutP;
	}
	
	public CmsAbout findByNaviId(int naviId){
		CmsNavi navi = CmsNavi.dao.findById(naviId);
		if(navi.getNaviLevel() ==1){
			naviId = NaviAdminService.me.findFirstChild(naviId).getId();
		}
		
		String sql = "select * from cms_about where abou_navi_id = ?";
		List<CmsAbout> abouL = dao.find(sql,naviId);
		if(abouL.size()>0){
			CmsAbout about = abouL.get(0);
			about.setAbouHit(about.getAbouHit()+1);
			about.update();
			return about;
		}
		else
			return null;
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
