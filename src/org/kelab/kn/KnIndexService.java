package org.kelab.kn;

import java.util.List;
import info.bliki.wiki.model.WikiModel;
import info.bliki.wiki.model.Configuration;
import info.bliki.wiki.tags.*;

import org.kelab.model.KnEntry;

public class KnIndexService{
	
	public static WikiModel confWiki(){
		Configuration conf = Configuration.DEFAULT_CONFIGURATION;
		conf.addTokenTag("img", new HTMLTag("img"));
		WikiModel wiki = new WikiModel(conf, "${image}", "/kn/entry/${title}");
		return wiki;
	}
	
	public KnEntry firstEntry(){
		String sql = "select * from kn_entry order by id asc limit 1";
		List<KnEntry> entryL = KnEntry.dao.find(sql);
		if(entryL.size()>0){
			KnEntry entry = entryL.get(0);
			WikiModel wiki = confWiki();
			entry.setKnenText(wiki.render(entry.getKnenText()));
			return entry;
		}
		else
			return null;
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
		return enL;
		
	}
}
