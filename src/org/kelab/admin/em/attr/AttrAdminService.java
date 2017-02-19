package org.kelab.admin.em.attr;

import java.util.List;

import org.kelab.model.EmAttr;
import org.kelab.model.EmGeneAttr;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class AttrAdminService {
	public static final AttrAdminService me = new AttrAdminService();
	final static EmAttr dao = new EmAttr().dao();
	final static EmGeneAttr emgaDao = new EmGeneAttr().dao();
	final String cacheName = "emAttr";
	
	/**
	 * 加载
	 * @param parentId
	 * 			父id，如果为0，则返回所有
	 * @return
	 */
	public List<EmAttr> findAllAttr(int parentId){
		String sql = "select emat.*,emay.type_name as typeName,kese.secu_name as secuName"
				+ " from em_attr emat ,em_attr_type emay,ke_security kese "
				+ "where emat.emat_type = emay.id and emat.emat_secu_id = kese.id"
				+ " and emat_pare_id = ? order by id asc";
		List<EmAttr> attrL = dao.find(sql,parentId);
		for(EmAttr attr : attrL){
			attr.put("emAttrL",findAllAttr(attr.getId()));
		}
		return attrL;
	}
	
	/**
	 * 加载
	 * @param parentId
	 * 			父id，如果为0，则返回所有
	 * @return
	 */
	public List<EmAttr> findAllAttrValue(int parentId, int emgeneId){
		String sql = "select * from em_attr where emat_pare_id = ?" 
				+ "  order by id asc";
		List<EmAttr> attrL = dao.find(sql,parentId);
		for(EmAttr attr : attrL){
			if(emgeneId > 0){
				String attrSql = "select * from em_gene_attr where emge_id = ? and emat_id =?";
				List<EmGeneAttr> emgaL = emgaDao.find(attrSql,emgeneId,attr.getId());
				if(emgaL.size()>0){
					attr.put("emgaValue",emgaL.get(0).getEmgaValue());
					attr.put("emgaId",emgaL.get(0).getId());
				}
			}
			attr.put("emAttrL",findAllAttrValue(attr.getId(),emgeneId));
		}
		return attrL;
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
		AttrAdminService.me.clearCache();    // 清缓存
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
