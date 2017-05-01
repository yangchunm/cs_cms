package org.kelab.admin.kn.history;

import java.util.List;

import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.model.KnEntryHistory;
import org.kelab.model.KnFile;

import com.jfinal.plugin.ehcache.CacheKit;

public class HistoryAdminService {
	public static final HistoryAdminService me = new HistoryAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	final static KnFile dao = new KnFile().dao();
	final String cacheName = "knFile";
	
	/**
	 * 根据词条ID查找编辑历史
	 * @param 
	 * @return 则返回所有
	 */
	public List<KnEntryHistory> findHistoryByEnId(int knenId){
		String sql = "select knen.knen_name as knenName, kneh.* from kn_entry knen, kn_entry_history kneh"
				+ " where kneh.kneh_knen_id = ? and kneh.kneh_opra_type in (0,1) and knen.id = kneh.kneh_knen_id"
				+ " order by kneh.id desc";
		return KnEntryHistory.dao.find(sql,knenId);
	}
	
	
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
