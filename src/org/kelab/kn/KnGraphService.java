package org.kelab.kn;

import java.util.HashSet;
import java.util.List;
import info.bliki.wiki.model.WikiModel;
import info.bliki.wiki.model.Configuration;
import info.bliki.wiki.tags.*;

import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.model.KnGraph;

public class KnGraphService{
	static TreeAdminService treeSrv = new TreeAdminService();
	
	public static WikiModel confWiki(){
		Configuration conf = Configuration.DEFAULT_CONFIGURATION;
		conf.addTokenTag("img", new HTMLTag("img"));
		WikiModel wiki = new WikiModel(conf, "${image}", "/kn/entry/${title}");
		return wiki;
	}
	
	/**
	 * 查找度最高的topN个节点
	 * @param topN
	 * @return
	 */
	public List<KnGraph> findTopnNode(int topN){
		String sql = "select kngr_node_src as id,kngr_node_src as label,count(*) as size "
				+ "from kn_graph group by kngr_node_src "
				+ "ORDER BY size desc limit ?";
		List<KnGraph> gL = KnGraph.dao.find(sql,topN);
		int aMax = gL.size();
		if(gL.size()<topN){
			String sqlT = "select kngr_node_des as id,kngr_node_des as label,count(*) as size "
				+ "from kn_graph group by kngr_node_des "
				+ "ORDER BY size desc limit ?";
			List<KnGraph> gTL = KnGraph.dao.find(sqlT,topN-aMax);
			for(int i = 0; i< gTL.size(); i ++){
				KnGraph des = gTL.get(i);
				boolean flag = true;
				for(int j =0; j < aMax; j++){
					KnGraph src = gL.get(j);
					if(src.getStr("id").equals(des.getSql("id"))){
						src.set("size", src.getLong("size") + des.getLong("size"));
						flag = false;
						break;
					}
				}
				if(flag)
					gL.add(des);
			}
		}
		return gL;
	}
	
	
	public List<KnGraph> findTopnEdge(List<KnGraph> topNode){
		String strIn = "(";
		for(KnGraph node : topNode){
			strIn += "'"+node.getStr("id")+"',";
		}
		strIn = strIn.substring(0, strIn.length()-1)+")";
		String sqlE = "select kngr_node_src as source, kngr_node_des as target from kn_graph"
				+ " where kngr_node_src in "+strIn+"";
		return KnGraph.dao.find(sqlE);
	}
	
}
