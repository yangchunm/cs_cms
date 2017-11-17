package org.kelab.index;

import org.kelab.admin.cms.about.AboutAdminService;
import org.kelab.admin.cms.file.FileAdminService;
import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.admin.cms.news.NewsAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.CmsFile;
import org.kelab.model.CmsNavi;
import org.kelab.model.CmsNews;

import com.jfinal.core.Controller;

public class IndexController extends Controller{
	static IndexService srv = new IndexService();
	static NaviAdminService naviSrv = new NaviAdminService();
	
	public void index(){
		String naviName = getPara(0);
		if(naviName == null || naviName == ""){
			setAttr("slide",srv.findSlide());
			render("index.html");
		}else{
			CmsNavi navi = srv.findNaviByEnName(naviName);
			if(navi != null && navi.getNaviLevel() ==1){
				navi = naviSrv.findFirstChild(navi.getId());
			}
			int naviType = 0;
			if(navi != null){
				naviType = navi.getNaviType();
				if(naviType == 1)
					about(navi);
				else if(naviType == 2)
					newsList(navi);
				else if(naviType == 3)
					fileList(navi);
			}
		}
	}
	
	public void newsdetail(){
		String naviName = getPara(0);
		int newsId = getParaToInt(1,0);
		if(naviName != null && naviName != "" && newsId>0){
			CmsNavi navi = srv.findNaviByEnName(naviName);
			setAttr("navi",navi);
			setAttr("locpath",naviSrv.findParentByNavi(navi));
			CmsNavi subNavi = findSubMenu(navi);
			CmsNews news = CmsNews.dao.findById(newsId);
			news.setNewsHit(news.getNewsHit()+1);
			news.update();
			setAttr("subNavi",subNavi);
			setAttr("news",news);
			render("newsdetail.html");
		}else
			render("/_view/error_404.html");
		
	}
	
	public void filedetail(){
		String naviName = getPara(0);
		int fileId = getParaToInt(1,0);
		if(naviName != null && naviName != "" && fileId>0){
			CmsNavi navi = srv.findNaviByEnName(naviName);
			setAttr("navi",navi);
			setAttr("locpath",naviSrv.findParentByNavi(navi));
			CmsNavi subNavi = findSubMenu(navi);
			CmsFile file = CmsFile.dao.findById(fileId);
			file.setFileHit(file.getFileHit()+1);
			file.update();
			setAttr("subNavi",subNavi);
			setAttr("file",file);
			render("filedetail.html");
		}else
			render("/_view/error_404.html");
		
	}
	
	private void about(CmsNavi navi) {
		setAttr("navi",navi);
		setAttr("locpath",naviSrv.findParentByNavi(navi));
		CmsNavi subNavi = findSubMenu(navi);
		setAttr("subNavi",subNavi);
		setAttr("about",AboutAdminService.me.findByNaviId(navi.getId()));
		render("about.html");
	}
	
	private void newsList(CmsNavi navi) {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(20);
		setAttr("navi",navi);
		setAttr("locpath",naviSrv.findParentByNavi(navi));
		CmsNavi subNavi = findSubMenu(navi);
		setAttr("subNavi",subNavi);
		int naviId = navi.getId();
		if(navi.getNaviLevel() == 1)
			naviId = naviSrv.findFirstChild(naviId).getId();
		comQ.setNaviId(naviId);
		setAttr("comQ",comQ);
		setAttr("newsL",NewsAdminService.me.findAllCmsNews(comQ));
		render("news.html");
	}
	
	private void fileList(CmsNavi navi) {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(20);
		setAttr("navi",navi);
		setAttr("locpath",naviSrv.findParentByNavi(navi));
		CmsNavi subNavi = findSubMenu(navi);
		setAttr("subNavi",subNavi);
		int naviId = navi.getId();
		if(navi.getNaviLevel() == 1)
			naviId = naviSrv.findFirstChild(naviId).getId();
		comQ.setNaviId(naviId);
		setAttr("comQ",comQ);
		setAttr("fileL",FileAdminService.me.findAllCmsFile(comQ));
		render("file.html");
	}
	
	private CmsNavi findSubMenu(CmsNavi navi){
		CmsNavi sub = new CmsNavi();
		if(navi.getNaviLevel() == 1){
			sub = navi;
			sub.put("subM",naviSrv.findAllCmsNavi(navi.getId()));
		}else{
			sub = naviSrv.findTopCmsNavi(navi.getId());
			sub.put("subM",naviSrv.findAllCmsNavi(sub.getId()));
		}
		return sub;
	}

}
