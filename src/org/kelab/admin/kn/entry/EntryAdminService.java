package org.kelab.admin.kn.entry;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.kelab.admin.kn.formula.FormulaAdminService;
import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.bean.Latex;
import org.kelab.model.KnEntrFile;
import org.kelab.model.KnEntrForm;
import org.kelab.model.KnEntrMole;
import org.kelab.model.KnEntry;
import org.kelab.model.KnEntryHistory;
import org.kelab.model.KnFile;
import org.kelab.model.KnFormula;
import org.kelab.model.KnGraph;
import org.kelab.model.KnMolecular;
import org.kelab.util.Base64Utils;
import org.kelab.util.StringUtils;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class EntryAdminService {
	public static final EntryAdminService me = new EntryAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	public static FormulaAdminService formSrv = new FormulaAdminService();
	final static KnEntry dao = new KnEntry().dao();
	final String cacheName = "knFormula";
	Prop p = PropKit.use("config.properties");
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnEntry> findAllEntry(CommQuery comQ){
		String strSele = "select knen.*,kntr.kntr_name as kntrName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName,kese.secu_name as secuName";
		String strFrom = "from kn_entry knen, kn_tree kntr, ke_user keus, ke_security kese";
		String strWhere = " where keus.id = knen.knen_crea_user_id and knen.knen_kntr_id = kntr.id "
				+ "and kese.id = knen.knen_secu_id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knen.knen_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knen.knen_tag like '%"+comQ.getKeyWord()+"%' "
					+ " or kntr.kntr_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and knen.knen_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnEntry> entryP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by knen.id desc");
		return entryP;
	}
	
	/**
	 * 保存信息
	 * @param 
	 * @return 结果信息
	 */
	@SuppressWarnings("null")
	public Ret save(KnEntry knEntr,String[] fileL, String[] formL, String[] moleL){
		int currId = 0;
		if(knEntr.getId() != null && knEntr.getId() > 0)
			currId = knEntr.getId();
		if (isExists(knEntr,currId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		knEntr.setKnenTime(new Date());
		knEntr.setKnenLastTime(new Date());
		List<String> formT = saveFromText(knEntr);
		if(formT != null && formL != null)
			formT.addAll(Arrays.asList(formL));
		else if(formT == null && formL != null)
			formT.addAll(Arrays.asList(formL));
		knEntr.setKnenTag(knEntr.getKnenTag().replace("，", ",").replace(" ",","));
		
		KnEntryHistory his = new KnEntryHistory();
		his.setKnehTime(new Date());
		his.setKnehIp(knEntr.getKnenLastIp());
		his.setKnehText(knEntr.getKnenText());
		if(currId == 0){	//新增
			knEntr.save();
			tagSrv.saveMutil(knEntr.getKnenTag());
			saveWikiLinkWord(knEntr.getKnenName(),knEntr.getKnenText());
			int lastEnId = findLastOne().getId();
			saveEntrFile(lastEnId,fileL,formT,moleL);
			his.setKnehUserId(knEntr.getKnenCreaUserId());
			his.setKnehOpraType(0);
			his.setKnehKnenId(lastEnId);
		}else{	//修改
			knEntr.update();
			tagSrv.saveMutil(knEntr.getKnenTag());
			saveWikiLinkWord(knEntr.getKnenName(),knEntr.getKnenText());
			saveEntrFile(currId,fileL,formT,moleL);
			his.setKnehUserId(knEntr.getKnenLastUserId());
			his.setKnehOpraType(1);
			his.setKnehKnenId(knEntr.getId());
		}
		his.save();
		EntryAdminService.me.clearCache();    // 清缓存
		return Ret.ok();
	}
	
	
	/**
	 * 检查是否存在
	 * @param KnEntry
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnEntry knEntr, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from kn_entry where knen_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , knEntr.getKnenName()) != null;
	}
	
	public List<String> saveFromText(KnEntry knEntr){
		//获取公式Latex文本
		List<Latex> latexL = StringUtils.extrLatex(knEntr.getKnenText());
		List<String> formL = new ArrayList<String>();
		int icount = 1;
		for(Latex latex : latexL){
			String filename = System.currentTimeMillis()+".png";
			String filePath = PathKit.getWebRootPath()+"/"+PropKit.get("baseUploadPath")
								+PropKit.get("knFormPath")+filename;
			Base64Utils.GenerateImage(latex.getBase64Code(), filePath);
			String formName = knEntr.getKnenName();
			if(icount > 1)
				formName = formName + icount;
			new KnFormula().set("knfo_kntr_id",knEntr.getKnenKntrId())
							.set("knfo_text", latex.getImgHtml())
							.set("knfo_user_id",knEntr.getKnenCreaUserId())
							.set("knfo_name", formName)
							.set("knfo_time",new Date())
							.set("knfo_tag", knEntr.getKnenTag())
							.set("knfo_latex",latex)
							.set("knfo_png",filename).save();
			formL.add(formSrv.findLastOne().getId().toString());
			icount ++;
		}
		return formL;
	}
	
	/**
	 * 找到最新一条词条
	 * @return
	 */
	public KnEntry findLastOne(){
		String sql = "select * from kn_entry order by id desc limit 1";
		List<KnEntry> enL = dao.find(sql);
		if(enL.size()>0)
			return enL.get(0);
		else
			return null;
	}
	
	/**
	 * 保存与词条相关的所有文件。
	 * @param enId 词条编号
	 * @param fileIds
	 * @param formIds
	 * @param moleIds
	 */
	public void saveEntrFile(int enId, String[] fileIds, List<String> formIds, String[] moleIds){
		//先删除，再添加
		Db.update("delete from kn_entr_file where entr_id = ?",enId);
		if(fileIds != null){
			KnEntry.dao.findById(enId).set("knen_is_file",1).update();
			for(String fileId : fileIds){
				int fid = Integer.parseInt(fileId);
				new KnEntrFile().set("entr_id",enId).set("knfi_id",fid).save();
			}
		}
		
		Db.update("delete from kn_entr_form where entr_id = ?",enId);
		if(formIds != null){
			KnEntry.dao.findById(enId).set("knen_is_form",1).update();
			for(String formId : formIds){
				int fid = Integer.parseInt(formId);
				new KnEntrForm().set("entr_id",enId).set("form_id",fid).save();
			}
		}
		
		Db.update("delete from kn_entr_mole where entr_id = ?",enId);
		if(moleIds != null){
			KnEntry.dao.findById(enId).set("knen_is_mole",1).update();
			for(String moleId : moleIds){
				int mid = Integer.parseInt(moleId);
				new KnEntrMole().set("entr_id",enId).set("mole_id",mid).save();
			}
		}
	}
	
	public void saveWikiLinkWord(String entrName,String wikiTxt){
		List<String> linkWord = StringUtils.findWikiLinkWord(StringUtils.delHTML(wikiTxt));
		for(String word : linkWord){
			String sql = "select * from kn_graph where kngr_node_src = ? and kngr_node_des = ?";
			List<KnGraph> kngrL = KnGraph.dao.find(sql,entrName,word);
			 if(kngrL.size() == 0){
				new KnGraph().set("kngr_node_src", entrName)
				.set("kngr_node_des", word).save();
			}
		}
	}
	
	public List<KnFile> findRelaFileByEnId(int enId){
		String sql = "select knfi.* from kn_file knfi, kn_entr_file knef "
				+ "where knef.knfi_id = knfi.id and knef.entr_id = ?";
		return KnFile.dao.find(sql,enId);
	}
	
	public List<KnFormula> findRelaFormByEnId(int enId){
		String sql = "select knfo.* from kn_formula knfo, kn_entr_form knef "
				+ "where knef.form_id = knfo.id and knef.entr_id = ?";
		return KnFormula.dao.find(sql,enId);
	}
	public List<KnMolecular> findRelaMoleByEnId(int enId){
		String sql = "select knmo.* from kn_molecular knmo, kn_entr_mole knem "
				+ "where knem.mole_id = knmo.id and knem.entr_id = ?";
		return KnMolecular.dao.find(sql,enId);
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
