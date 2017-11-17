package org.kelab.staff;

import org.kelab.admin.cms.navi.NaviAdminService;
import org.kelab.model.CmsNavi;
import org.kelab.model.KeUser;

import com.jfinal.core.Controller;


public class StaffController extends Controller{
	static StaffService srv = new StaffService();
	static NaviAdminService naviSrv = new NaviAdminService();
	
	public void index(){
		String naviName = "staff";
		String orderType = getPara();
		if(orderType == null || orderType =="")
			orderType = naviName;
		CmsNavi navi = naviSrv.findNaviByEnName(naviName);
		if(navi != null && navi.getNaviLevel() ==1){
			navi = naviSrv.findFirstChild(navi.getId());
		}
		setAttr("navi",navi);
		CmsNavi subNavi = findSubMenu(navi);
		setAttr("subNavi",subNavi);
		if(orderType.equals("staff") || orderType.equals("staff_dept")){
			setAttr("staffL",srv.findStaffByDept());
		}
		if(orderType.equals("staff_secu")){
			setAttr("staffL",srv.findStaffBySecu());
		}
		if(orderType.equals("staff_pinyin")){
			setAttr("staffL",srv.findStaffByPinyin());
		}
		if(orderType.equals("staff_advisor")){
			setAttr("staffL",srv.findStaffByAdvisor());
		}
		setAttr("orderType",orderType);
		render("index.html");
	}
	
	public void p(){
		String userPy = getPara();
		String naviName = "staff";
		CmsNavi navi = naviSrv.findNaviByEnName(naviName);
		if(navi != null && navi.getNaviLevel() ==1){
			navi = naviSrv.findFirstChild(navi.getId());
		}
		setAttr("navi",navi);
		CmsNavi subNavi = findSubMenu(navi);
		setAttr("subNavi",subNavi);
		if(userPy != null && userPy != ""){
			KeUser u = srv.findUserByPinyin(userPy);
			if(u!=null){
				setAttr("u",u);
				setAttr("staff",srv.findStaffByUserId(u.getId()));
				render("staff.html");
			}
		}else
			render("/_view/error_404.html");
	}
	
	private CmsNavi findSubMenu(CmsNavi navi){
		CmsNavi sub = new CmsNavi();
		if(navi.getNaviLevel() == 1){
			sub = navi;
			sub.put("subM",naviSrv.findAllCmsNavi(navi.getId()));
		}else{
			sub = naviSrv.findTopCmsNavi(navi.getId());
			sub.put("subM",naviSrv.findAllCmsNavi(navi.getNaviParentId()));
		}
		return sub;
	}

}
