package org.kelab.index;

import java.util.List;
import info.bliki.wiki.model.WikiModel;
import info.bliki.wiki.model.Configuration;
import info.bliki.wiki.tags.*;

import org.kelab.model.KnEntry;

public class IndexService{
	
	public KnEntry firstEntry(){
		Configuration conf = Configuration.DEFAULT_CONFIGURATION;
		conf.addTokenTag("img", new HTMLTag("img"));
		WikiModel wiki = new WikiModel(conf, "${image}", "kn/${title}");
		String sql = "select * from kn_entry order by id asc limit 1";
		List<KnEntry> entryL = KnEntry.dao.find(sql);
		if(entryL.size()>0){
			KnEntry entry = entryL.get(0);
			entry.setKnenText(wiki.render(entry.getKnenText()));
			return entry;
		}
		else
			return null;
	}
}
