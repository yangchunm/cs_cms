package org.kelab.admin.dm.algorithm;

import java.util.List;

import org.kelab.admin.ke.menu.MenuAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.DmAlgoArgument;
import org.kelab.model.DmAlgorithm;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class AlgorithmAdminService {
	public static final AlgorithmAdminService me = new AlgorithmAdminService();
	public static MenuAdminService menuSrv = new MenuAdminService();
	final static DmAlgorithm dao = new DmAlgorithm().dao();
	final String cacheName = "dmAlgorithm";
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<DmAlgorithm> findAllAlgo(CommQuery comQ, DmAlgorithm sAlgo){
		String strSele = "select dmal.*,dmac.dmac_name as dmacName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from dm_algorithm dmal, dm_algo_cate dmac, ke_user keus";
		String strWhere = " where keus.id = dmal.dmal_user_id and dmal.dmal_dmac_id = dmac.id";
		if(sAlgo.getDmalName() != null)
			strWhere = strWhere + " and dmal.dmal_name like '%"+sAlgo.getDmalName()+"%'";
		if(sAlgo.getDmalDmacId() != null && sAlgo.getDmalDmacId() > 0)
			strWhere = strWhere + " and dmal.dmal_dmac_id = "+sAlgo.getDmalDmacId()+" ";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getKeyWord()+"%' "
					+ "or keus.user_name like '%"+comQ.getKeyWord()+"%') ";
		Page<DmAlgorithm> algoP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by dmal.id desc");
		for(DmAlgorithm algo : algoP.getList()){
			int useCount = Db.find("select * from dm_submit where dmsu_dmal_id =?",algo.getId()).size();
			algo.put("useCount",useCount);
		}
		return algoP;
	}
	
	/**
	 * 保存信息
	 * @param DmAlgo对象
	 * @return 结果信息
	 */
	public Ret save(DmAlgorithm algo,List<DmAlgoArgument> argL){
		int currAlgoId = 0;
		if(algo.getId() != null && algo.getId() > 0)
			currAlgoId = algo.getId();
		if (isExists(algo,currAlgoId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		if(currAlgoId == 0){	//新增
			algo.save();
			String sql = "select * from dm_algorithm order by id desc limit 1";
			List<DmAlgorithm> algoL = dao.find(sql);
			if(algoL.size()>0)
				currAlgoId = algoL.get(0).getId();
		}else{	//修改
			algo.update();
			//先删除相关参数，再增加
			Db.update("delete from dm_algo_argument where dmaa_dmal_id = ?",currAlgoId);
		}
		
		//添加参数信息
		for(DmAlgoArgument arg : argL){
			arg.setDmaaDmalId(currAlgoId);
			arg.save();
		}
		AlgorithmAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param DmAlgorithm
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(DmAlgorithm algo, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from dm_algorithm where dmal_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , algo.getDmalName()) != null;
	}
	
	/**
	 * 获取最新一条信息
	 */
	public DmAlgorithm findOneById(int algoId){
		DmAlgorithm algo = dao.findById(algoId);
		String sql = "select * from dm_algo_argument where dmaa_dmal_id = ? order by id asc";
		algo.put("argL",DmAlgoArgument.dao.find(sql,algoId));
		return algo;
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
    		String checkSql = "select * from dm_submit where dmsu_dmal_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from dm_algorithm where id=?",id);
	    		Db.update("delete from dm_algo_argument where dmaa_dmal_id=?",id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分记录关联数据，不能删除！";
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
