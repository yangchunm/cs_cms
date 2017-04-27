package org.kelab.em;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.kelab.admin.em.attr.AttrAdminService;
import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.EmAttr;
import org.kelab.model.EmCate;
import org.kelab.model.EmGene;
import org.kelab.model.EmGeneAttr;
import org.kelab.model.EmGeneCate;
import org.kelab.util.ExcelUtils;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class EmGeneService {
	public static final EmGeneService me = new EmGeneService();
	final static EmGene dao = new EmGene().dao();
	final static EmGeneAttr emgaDao = new EmGeneAttr().dao();
	final static CateAdminService srvCate = new CateAdminService(); 
	final static AttrAdminService srvAttr = new AttrAdminService();
	final String cacheName = "emGene";
	
	public List<EmGene> findGeneByKnWord(String knWord, int topN){
		String sql = "select emge.* from em_gene emge, em_gene_cate emgc, em_cate emca "
				+ "where emca.id = emgc.emca_id and emgc.emge_id = emge.id and "
				+ "(emca.emca_name = ? or emge.emge_abbr_name = ?) order by emge.id desc limit ?";
		return dao.find(sql,knWord,knWord,topN);
	}
	
	/**
	 * 找到最新一条信息
	 * @return
	 */
	public EmGene findLastOne(){
		String sql = "select * from em_gene order by id desc limit 1";
		List<EmGene> geneL = dao.find(sql);
		if(geneL.size()>0)
			return geneL.get(0);
		else
			return null;
	}
	
	public EmGene findOneById(int geneId){
		String sql = "select * from em_gene where id = ?";
		List<EmGene> geneL = dao.find(sql,geneId);
		if(geneL.size() >0){
			String catesql = "select * from em_gene_cate where emge_id = ?";
			geneL.get(0).put("cateL",EmGeneCate.dao.find(catesql,geneId));
			return geneL.get(0);
		}else
			return null;
	}
	
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}