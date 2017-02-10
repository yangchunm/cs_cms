package org.kelab.admin.kn.file;

import java.io.File;

import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnFile;
import org.kelab.util.StringUtils;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class FileAdminService {
	public static final FileAdminService me = new FileAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	final static KnFile dao = new KnFile().dao();
	final String cacheName = "knFile";
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnFile> findAllFile(CommQuery comQ){
		String strSele = "select knfi.*,kntr.kntr_name as kntrName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from kn_file knfi, kn_tree kntr, ke_user keus";
		String strWhere = " where keus.id = knfi.knfi_user_id and knfi.knfi_kntr_id = kntr.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knfi.knfi_ename like '%"+comQ.getKeyWord()+"%' "
					+ " or knfi.knfi_tag like '%"+comQ.getKeyWord()+"%' "
					+ " or kntr.kntr_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and knfi.knfi_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnFile> fileP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by knfi.id desc");
		return fileP;
	}
	
	/**
	 * 保存信息
	 * @param KnFile对象
	 * @return 结果信息
	 */
	public Ret save(KnFile knFile){
		int currFileId = 0;
		if(knFile.getId() != null && knFile.getId() > 0)
			currFileId = knFile.getId();
		if (isExists(knFile,currFileId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		knFile.setKnfiTag(knFile.getKnfiTag().replace("，", ",").replace(" ",","));
		if(currFileId == 0){	//新增
			knFile.save();
			tagSrv.saveMutil(knFile.getKnfiTag());
		}else{	//修改
			knFile.update();
			tagSrv.saveMutil(knFile.getKnfiTag());
		}
		FileAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param KnFile
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnFile knFile, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from kn_file where knfi_ename=? "+strWhere+" limit 1";
		return Db.queryInt(sql , knFile.getKnfiEname()) != null;
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
    		String checkSql = "select * from kn_entr_file where knfi_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from kn_file where id=?",id);
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
	
	/**
	 * 检查文件是否存在
	 * @param filePath
	 * @return
	 */
	
	public Ret fileDown(String filePath){
		String file = PathKit.getWebRootPath()+filePath;
		File f = new File(file);
		if(f.exists()){
			return Ret.ok("msg",filePath);
		}else
			return Ret.fail("msg","该文件不存在！");
	}
	
	/**
	 * 根据选择的知识点和填入的标签，自动匹配相关的文件
	 * @param knTreeId
	 * @param enTags
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Page<KnFile> findFileByWords(int knTreeId, String enTags,int page, int pageSize){
		String strSele = "select knfi.*";
		String strFrom = "from kn_file knfi, kn_tree kntr";
		String strWhere = " where knfi.knfi_kntr_id = kntr.id";
		if(knTreeId > 0)
			strWhere = strWhere + " and kntr.id ="+knTreeId;
		if(enTags != null && enTags != ""){
			String[] arrTags = StringUtils.splitTags(enTags);
			strWhere += " and ( ";
			int i = 1;
			for(String tag: arrTags){
				strWhere += "knfi.knfi_tag like '%"+tag+"%' or knfi.knfi_ename like '%"+tag+"%'";
				if(arrTags.length > 1 && i < (arrTags.length))
					strWhere += " or ";
				i++;
			}
			strWhere += " )";
		}
		Page<KnFile> fileP = dao.paginate(page, pageSize, strSele, strFrom
				+  strWhere+" order by knfi.id desc");
		return fileP;
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
