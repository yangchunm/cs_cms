package org.kelab.index;

import java.util.List;

import org.kelab.model.KnEntry;

public class IndexService{
	
	public KnEntry firstEntry(){
		String sql = "select * from kn_entry order by id asc limit 1";
		List<KnEntry> entryL = KnEntry.dao.find(sql);
		if(entryL.size()>0)
			return entryL.get(0);
		else
			return null;
	}
}
