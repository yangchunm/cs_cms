package org.kelab.admin.kn.formula;

import java.util.List;

import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnFormula;
import org.kelab.util.Base64Utils;
import org.kelab.util.StringUtils;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class FormulaAdminService {
	public static final FormulaAdminService me = new FormulaAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	final static KnFormula dao = new KnFormula().dao();
	final String cacheName = "knFormula";
	Prop p = PropKit.use("config.properties");
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnFormula> findAllForm(CommQuery comQ){
		String strSele = "select knfo.*,kntr.kntr_name as kntrName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from kn_formula knfo, kn_tree kntr, ke_user keus";
		String strWhere = " where keus.id = knfo.knfo_user_id and knfo.knfo_kntr_id = kntr.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knfo.knfo_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knfo.knfo_tag like '%"+comQ.getKeyWord()+"%' "
					+ " or kntr.kntr_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and knfi.knfi_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnFormula> formP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by knfo.id desc");
		return formP;
	}
	
	/**
	 * 保存信息
	 * @param KnFormula对象
	 * @return 结果信息
	 */
	public Ret save(KnFormula knForm){
		int currId = 0;
		if(knForm.getId() != null && knForm.getId() > 0)
			currId = knForm.getId();
		if (isExists(knForm,currId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		//获取公式Latex文本
		List<String> latexL = StringUtils.extrLatex(knForm.getKnfoText());
		if(latexL.size()>1){
			return Ret.fail("msg","只能添加一个公式！");
		}else if(latexL.size() > 0)
			knForm.setKnfoLatex(latexL.get(0));
		//转为png
		String filename = System.currentTimeMillis()+".png";
		String filePath = PathKit.getWebRootPath()+"/"+p.get("baseUploadPath")+p.get("knFormPath")+filename;
		Base64Utils.GenerateImage(StringUtils.extBase64Str(knForm.getKnfoText()), filePath);
		knForm.setKnfoPng(filename);
		knForm.setKnfoText(StringUtils.onlyimg(knForm.getKnfoText()));
		knForm.setKnfoTag(knForm.getKnfoTag().replace("，", ",").replace(" ",","));
		if(currId == 0){	//新增
			knForm.save();
			tagSrv.saveMutil(knForm.getKnfoTag());
		}else{	//修改
			knForm.update();
			tagSrv.saveMutil(knForm.getKnfoTag());
		}
		FormulaAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param KnFormula
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnFormula knForm, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from kn_formula where knfo_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , knForm.getKnfoName()) != null;
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
    		String checkSql = "select * from kn_entr_form where form_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from kn_formula where id=?",id);
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
