package org.kelab.admin.cms.file;

import java.util.Date;

import org.kelab.bean.CommQuery;
import org.kelab.model.CmsFile;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class FileAdminService {
	public static final FileAdminService me = new FileAdminService();
	final static CmsFile dao = new CmsFile().dao();
	final String cacheName = "cmsNews";
	
	/**
	 * 加载新闻列表
	 * @param fileId
	 * @return 如果fieId为0，则返回所有
	 */
	public Page<CmsFile> findAllCmsFile(CommQuery comQ){
		String strSele = "select cmfi.*,cmna.navi_name as naviName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from cms_file cmfi, cms_navi cmna, ke_user keus";
		String strWhere = " where keus.id = cmfi.file_user_id and cmfi.file_navi_id = cmna.id ";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (cmfi.file_title like '%"+comQ.getKeyWord()+"%' "
					+ " or cmfi.file_tags like '%"+comQ.getKeyWord()+"%') ";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and cmfi.file_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		if(comQ.getNaviId()>0)
			strWhere = strWhere + " and cmfi.file_navi_id = "+comQ.getNaviId();
		Page<CmsFile> cmsNewsP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by cmfi.id desc");
		return cmsNewsP;
	}
	
	
	/**
	 * 保存菜单信息
	 * @param CmsFile对象
	 * @return 结果信息
	 */
	public Ret save(CmsFile cmsFile){
		if (cmsFile.getId() > 0 && isExists(cmsFile)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		cmsFile.setFileTime(new Date());
		cmsFile.setFileIsRestrict(false);
		cmsFile.save();
		FileAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param cmsFile
	 * @return 是否存在名字重复
	 */
	private boolean isExists(CmsFile cmsFile) {
		String sql = "select id from cms_file where file_title=? limit 1";
		return Db.queryInt(sql , cmsFile.getFileTitle()) != null;
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
	    		Db.update("delete from cms_file where id="+id);
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
