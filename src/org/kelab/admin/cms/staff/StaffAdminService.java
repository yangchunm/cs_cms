package org.kelab.admin.cms.staff;

import java.util.List;
import org.kelab.model.CmsStaff;
import com.jfinal.plugin.ehcache.CacheKit;

public class StaffAdminService {
	public static final StaffAdminService me = new StaffAdminService();
	final static CmsStaff dao = new CmsStaff().dao();
	final String cacheName = "cmsStaff";
	
	/**
	 * 加载
	 */
	public CmsStaff findByUserId(int userId){
		String sql = "select * from cms_staff where staf_user_id = ?";
		List<CmsStaff> stafL = dao.find(sql,userId);
		if(stafL.size()>0)
			return stafL.get(0);
		else
			return null;
	}
	
	
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
