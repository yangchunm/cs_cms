package org.kelab.kn;

import java.util.ArrayList;
import java.util.List;
import info.bliki.wiki.model.WikiModel;
import info.bliki.wiki.model.Configuration;
import info.bliki.wiki.tags.*;

import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.KnEntry;
import org.kelab.model.KnFile;
import org.kelab.model.KnFormula;
import org.kelab.model.KnMolecular;
import org.kelab.model.KnTree;
import org.kelab.util.StringUtils;

import com.jfinal.plugin.activerecord.Page;

public class KnTreeService{
	static TreeAdminService treeSrv = new TreeAdminService();
	
	public static WikiModel confWiki(){
		Configuration conf = Configuration.DEFAULT_CONFIGURATION;
		conf.addTokenTag("img", new HTMLTag("img"));
		WikiModel wiki = new WikiModel(conf, "${image}", "/kn/entry/${title}");
		return wiki;
	}
	
	public Page<KnEntry> findEntryByTreeId(int kntrId,CommQuery comQ){
		List<KnTree> knTreeL = treeSrv.findAllChild(kntrId);
		List<Integer> childIds = new ArrayList<Integer>();
		childIds.add(kntrId);
		treeSrv.findAllChildIds(knTreeL, childIds);
		String strIn = "(";
		for(Integer id: childIds){
			strIn += id + ",";
		}
		strIn = strIn.substring(0, strIn.length()-1) +")";
		String sql = " from kn_entry where knen_kntr_id in "+strIn+" order by id asc";
		Page<KnEntry> entryL = KnEntry.dao.paginate(comQ.getPage(), comQ.getPageSize(), "select *", sql);
		for(KnEntry en: entryL.getList()){
			String delHtmlStr = StringUtils.delHTML(en.getKnenText());
			if(delHtmlStr.length()>100)
				en.setKnenText(delHtmlStr.substring(0, 100)+"...");
			else
				en.setKnenText(delHtmlStr);
		}
		return entryL;
	}
	
	/**
	 * 根据词条名称查找完整词条
	 * @param knName
	 * @return
	 */
	public KnEntry findEntryByName(String knName){
		String sql = "select * from kn_entry where knen_name = ?";
		List<KnEntry> entryL = KnEntry.dao.find(sql,knName);
		if(entryL.size()>0){
			KnEntry entry = entryL.get(0);
			WikiModel wiki = confWiki();
			entry.setKnenText(wiki.render(entry.getKnenText()));
			//查找相关的文件、公式和分子式
			int entrId = entry.getId();
			String sqlF = "select knfi.* from kn_file knfi,kn_entr_file knef"
					+ " where knfi.id = knef.knfi_id and knef.entr_id = ?";
			entry.put("fileL",KnFile.dao.find(sqlF,entrId));
			
			String sqlFo = "select knfo.* from kn_formula knfo,kn_entr_form knef"
					+ " where knfo.id = knef.form_id and knef.entr_id = ?";
			entry.put("formL",KnFormula.dao.find(sqlFo,entrId));
			
			String sqlM = "select knmo.* from kn_molecular knmo,kn_entr_mole knem"
					+ " where knmo.id = knem.mole_id and knem.entr_id = ?";
			entry.put("moleL",KnMolecular.dao.find(sqlM,entrId));
			return entry;
		}
		else
			return null;
	}
	
	
	
	/**
	 * 根据词语查找相似词条，首先从Tag中查找，再从标题中匹配
	 * @param knWord
	 * @return
	 */
	public List<KnEntry> findSimEntryByWord(String knWord){
		String sql = "select * from kn_entry where knen_tag like '%"+knWord+"%'"
				+ " or knen_name like '%"+knWord+"%' order by id desc";
		List<KnEntry> enL = KnEntry.dao.find(sql);
		for(KnEntry en: enL){
			en.setKnenText(StringUtils.delHTML(en.getKnenText()).substring(0, 100)+"...");
		}
		return enL;
		
	}
}
