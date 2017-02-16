package org.kelab.admin.em.gene;

import java.util.ArrayList;
import java.util.List;

import org.kelab.bean.CommQuery;
import org.kelab.model.EmAttr;
import org.kelab.model.EmGene;
import org.kelab.model.KnEntry;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class GeneAdminService {
	public static final GeneAdminService me = new GeneAdminService();
	final static EmGene dao = new EmGene().dao();
	final String cacheName = "emGene";
	
	public Page<EmGene> findAllGene(CommQuery comQ){
		String strSele = "select emge.*,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName,kese.secu_name as secuName";
		String strFrom = "from em_gene emge, ke_user keus, ke_security kese";
		String strWhere = " where keus.id = emge.emge_user_id "
				+ "and kese.id = emge.emge_secu_id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (emge.emge_abbr_name like '%"+comQ.getKeyWord()+"%' "
					+ " or emge.emge_en_name like '%"+comQ.getKeyWord()+"%' "
					+ " or emge.emge_zh_name like '%"+comQ.getKeyWord()+"%'"
					+ " or emge.emge_code like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and emge.emge_create_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<EmGene> geneP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by emge.id desc");
		return geneP;
	}
	
	
	/**
	 * 保存信息
	 * @param EmAttr对象
	 * @return 结果信息
	 */
	public Ret save(EmAttr emAttr){
		if (isAttrNameExists(emAttr.getEmatName(),emAttr.getId())) {
			return Ret.fail("msg", "该名称已经存在");
		}
		emAttr.save();
		GeneAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param EmAttr
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	boolean isAttrNameExists(String attrName, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from em_attr where emat_name =? "+strWhere+" limit 1";
		return Db.queryInt(sql , attrName) != null;
	}
	
	
	/**
	 * 删除指定id的信息
	 * @param id
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
    		String sql ="select * from em_formula_attr where emat_id = ?";
	    	if(id > 0 && Db.find(sql,id).size() == 0){	    		
	    		Db.update("delete from em_attr where id=?",id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分不能删除！";
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
