package org.kelab.index;
import java.util.List;

import org.kelab.model.CmsLink;
import org.kelab.model.CmsNavi;
import org.kelab.model.CmsNews;
import org.kelab.model.CmsSlide;
import org.kelab.util.StringUtils;

public class IndexService{
	
	public List<CmsSlide> findSlide(){
		String sql = "select * from cms_slide order by slid_order asc";
		return CmsSlide.dao.find(sql);
	}
	
	public static List<CmsLink> findLink(int linkType){
		String sql = "select * from cms_link where link_type =? order by link_order asc";
		return CmsLink.dao.find(sql,linkType);
	}
	
	public static List<CmsNews> findNews(int num, String naviIds,int titlelen,int wordlen,boolean isHighlight){
		String highStr = "";
		if(isHighlight)
			highStr = "and !ISNULL(ne.news_pic)";
		String sql = "select ne.*,nv.navi_name_en as naviNameEn from cms_news ne,cms_navi nv where ne.news_is_pub = 1 "
				+ "and ne.news_navi_id = nv.id and ne.news_navi_id in ("+naviIds+") "+highStr+" "
				+ "order by ne.news_is_top desc,ne.id desc limit ?";
		List<CmsNews> newsL = CmsNews.dao.find(sql,num);
		for(CmsNews news : newsL){
			String delHtmlStr = StringUtils.delHTML(news.getNewsContent());
			if(delHtmlStr.length()>wordlen)
				news.setNewsContent(delHtmlStr.substring(0, wordlen)+"...");
			else
				news.setNewsContent(delHtmlStr);
			news.put("shortTitle", news.getNewsTitle());
			if(news.getNewsTitle().length()>titlelen)
				news.put("shortTitle",news.getNewsTitle().substring(0, titlelen)+"...");
		}
		return newsL;
	}
	
	public CmsNavi findNaviByEnName(String enName){
		String sql = "select * from cms_navi where navi_name_en=?";
		List<CmsNavi> naviL = CmsNavi.dao.find(sql,enName);
		if(naviL.size()>0)
			return naviL.get(0);
		else
			return null;
	}
}
