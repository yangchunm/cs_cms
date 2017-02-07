package org.kelab.admin.kn.lang;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kelab.model.KnLang;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class LangAdminService {
	public static final LangAdminService me = new LangAdminService();
	final static KnLang dao = new KnLang().dao();
	final String CacheName = "knLang";
	
	/**
	 * 加载
	 * @param 
	 * @return 如果id为0，则返回所有
	 */
	public List<KnLang> findAllKnLang(){
		String sql = "select * from kn_lang order by id ASC";
		List<KnLang> langList = dao.find(sql);
		return langList;
	}
	
	public Map<String,String> findAllKnLangMap(){
		Map<String,String> map = new HashMap<String,String>();
		String sql = "select * from kn_lang order by id ASC";
		List<KnLang> langList = dao.find(sql);
		for(KnLang lang : langList){
			map.put(lang.getExt(), lang.getLang());
		}
		map.put("0", "无");
		return map;
	}
	
	
	/**
	 * 保存信息
	 * @param KnLang对象
	 * @return 结果信息
	 */
	public Ret save(KnLang knLang){
		if (isExists(knLang)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		knLang.save();
		LangAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param knTLang
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnLang knLang) {
		String sql = "select id from ke_lang where lang=? limit 1";
		return Db.queryInt(sql , knLang.getLang()) != null;
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
	    		Db.update("delete from kn_lang where id="+id);
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
		CacheKit.removeAll(CacheName);
	}
}
