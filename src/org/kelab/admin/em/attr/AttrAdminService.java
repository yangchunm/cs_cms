package org.kelab.admin.em.attr;

import java.util.Date;
import java.util.List;

import org.kelab.bean.CommQuery;
import org.kelab.model.EmAttr;
import org.kelab.model.KeUser;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class AttrAdminService {
	public static final AttrAdminService me = new AttrAdminService();
	final static EmAttr dao = new EmAttr().dao();
	final String cacheName = "emAttr";
	
	/**
	 * 加载
	 * @return 则返回所有
	 */
	public Page<EmAttr> findAllAttr(CommQuery comQ, EmAttr emattr){
		String strSele = "select emat.*,emca.emca_name as emcaName,kese.secu_name as secuName";
		String strFrom = "from em_attr emat, em_cate emca, ke_security kese";
		String strWhere = " where emat.emat_emca_id = emca.id and emat.emat_secu_id = kese.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere += " and emat.emat_name like '%"+comQ.getKeyWord()+"%'";
		
		Page<EmAttr> attrP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by emat.id desc");
		return attrP;
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
		String sql = "select id from ke_user where em_attr=? "+strWhere+" limit 1";
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
	    	if(id > 0 ){	    		
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
	
	/**
	 * 根据分类id查找所有用户
	 * @param cateId
	 * @return 用户列表
	 */
	public List<EmAttr> findAttrByRoleId(int cateId){
		String sql = "select * from em_attr where emat_emca_id =? order by id asc";
		return dao.find(sql,cateId);
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
