package org.kelab.admin.kn.molecular;

import java.io.File;
import java.io.IOException;

import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnMolecular;
import org.kelab.util.FileUtils;
import org.kelab.util.FormularUtils;
import org.openscience.cdk.exception.CDKException;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class MolecularAdminService {
	public static final MolecularAdminService me = new MolecularAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	final static KnMolecular dao = new KnMolecular().dao();
	final String cacheName = "knMole";
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnMolecular> findAllMole(CommQuery comQ){
		String strSele = "select knmo.*,kntr.kntr_name as kntrName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from kn_molecular knmo, kn_tree kntr, ke_user keus";
		String strWhere = " where keus.id = knmo.knmo_user_id and knmo.knmo_kntr_id = kntr.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knmo.knmo_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knmo.knmo_tag like '%"+comQ.getKeyWord()+"%' "
					+ " or kntr.kntr_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and knmo.knmo_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnMolecular> fileP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by knmo.id desc");
		return fileP;
	}
	
	/**
	 * 保存信息
	 * @param KnMolecular对象
	 * @return 结果信息
	 * @throws IOException 
	 */
	public Ret save(KnMolecular knMole) throws IOException{
		int currId = 0;
		if(knMole.getId() != null && knMole.getId() > 0)
			currId = knMole.getId();
		if (isExists(knMole,currId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		//svg及png转换
		String fileType = FileUtils.getSuffix(knMole.getKnmoFile());
		String molfile = PathKit.getWebRootPath()+"/"+PropKit.get("baseUploadPath")+PropKit.get("knMolePath")+knMole.getKnmoFile();
		System.out.println(fileType+"##"+ molfile+"$$"+fileType.substring(1));
		try {
			FormularUtils.writePNGSVG(molfile);
		} catch (CDKException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Ret.fail("msg","mol文件转换为Png、svg错误");
		}
		knMole.setKnmoPng(knMole.getKnmoFile().replace(fileType, ".png"));
		
		knMole.setKnmoTag(knMole.getKnmoTag().replace("，", ",").replace(" ",","));
		if(currId == 0){	//新增
			knMole.save();
			tagSrv.saveMutil(knMole.getKnmoTag());
		}else{	//修改
			knMole.update();
			tagSrv.saveMutil(knMole.getKnmoTag());
		}
		MolecularAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param KnMolecular
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnMolecular knMole, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from kn_molecular where knmo_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , knMole.getKnmoName()) != null;
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
    		String checkSql = "select * from kn_entr_mole where mole_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from kn_molecular where id=?",id);
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
	
	public Ret fileDown(String filePath){
		String file = PathKit.getWebRootPath()+filePath;
		File f = new File(file);
		if(f.exists()){
			return Ret.ok("msg",filePath);
		}else
			return Ret.fail("msg","该文件不存在！");
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}
