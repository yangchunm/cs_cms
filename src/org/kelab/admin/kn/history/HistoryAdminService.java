package org.kelab.admin.kn.history;

import java.util.List;

import org.kelab.bean.CommQuery;
import org.kelab.model.KnEntryHistory;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class HistoryAdminService {
	public static final HistoryAdminService me = new HistoryAdminService();
	final static KnEntryHistory dao = new KnEntryHistory().dao();
	final String cacheName = "knFile";
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnEntryHistory> findAllKnHistory(CommQuery comQ){
		String strSele = "select kneh.*,knen.knen_name as knenName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from kn_entry_history kneh, kn_entry knen, ke_user keus";
		String strWhere = " where keus.id = kneh.kneh_user_id and kneh.kneh_knen_id = knen.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knen.knen_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knen.knen_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knen.knen_alias like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and kneh.kneh_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnEntryHistory> histP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by kneh.id desc");
		return histP;
	}
	
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
