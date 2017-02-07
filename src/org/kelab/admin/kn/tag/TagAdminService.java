package org.kelab.admin.kn.tag;

import java.util.List;

import org.kelab.model.KnLang;
import org.kelab.model.KnTag;
import org.kelab.util.StringUtils;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class TagAdminService {
	public static final TagAdminService me = new TagAdminService();
	final static KnTag dao = new KnTag().dao();
	final String CacheName = "knTag";
	
	/**
	 * 加载
	 * @param 
	 * @return 如果id为0，则返回所有
	 */
	public List<KnTag> findAllKnTag(){
		String sql = "select * from kn_tag order by id ASC";
		List<KnTag> tagList = dao.find(sql);
		return tagList;
	}
	
	
	/**
	 * 保存信息
	 * @param KnLang对象
	 * @return 结果信息
	 */
	public Ret save(KnTag knTag){
		if (isExists(knTag))
			Db.update("update kn_tag set num = num +1 where tag = ?",knTag.getTag());
		else{
			knTag.setNum(1);
			knTag.save();
		}
		TagAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	/**
	 * 检查是否存在
	 * @param knTLang
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnTag knTag) {
		String sql = "select id from kn_tag where tag=? limit 1";
		return Db.queryInt(sql , knTag.getTag()) != null;
	}
	
	/**
	 * 保存用逗号或空格隔开的Tag
	 * @param knTags
	 * @return
	 */
	public Ret saveMutil(String knTags){
		String[] tags = StringUtils.splitTags(knTags);
		for(String tag : tags){
			KnTag knTag = new KnTag();
			knTag.setTag(tag);
			save(knTag);
		}
		return Ret.ok();
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
