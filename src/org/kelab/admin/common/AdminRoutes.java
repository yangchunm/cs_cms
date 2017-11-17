package org.kelab.admin.common;

import org.kelab.admin.cms.about.AboutAdminController;
import org.kelab.admin.cms.file.FileAdminController;
import org.kelab.admin.cms.link.LinkAdminController;
import org.kelab.admin.cms.navi.NaviAdminController;
import org.kelab.admin.cms.news.NewsAdminController;
import org.kelab.admin.cms.slide.SlideAdminController;
import org.kelab.admin.cms.staff.StaffAdminController;
import org.kelab.admin.index.IndexAdminController;
import org.kelab.admin.ke.menu.MenuAdminController;
import org.kelab.admin.ke.organ.OrganAdminController;
import org.kelab.admin.ke.role.RoleAdminController;
import org.kelab.admin.ke.user.UserAdminController;
import org.kelab.admin.ke.userlog.UserLogAdminController;
import org.kelab.common.interceptor.AdminAuthInterceptor;

import com.jfinal.config.Routes;

/**
 * 后台管理路由
 * 注意：自 jfinal 3.0 开始，baesViewPath 改为在 Routes 中独立配置
 *      并且支持 Routes 级别的 Interceptor，这类拦截器将拦截所有
 *      在此 Routes 中添加的 Controller，行为上相当于 class 级别的拦截器
 *      Routes 级别的拦截器特别适用于后台管理这样的需要统一控制权限的场景
 *      减少了代码冗余
 */
public class AdminRoutes extends Routes {

	public void config() {
		// 添加后台管理拦截器，将拦截在此方法中注册的所有 Controller
		addInterceptor(new AdminAuthInterceptor());
		
		setBaseViewPath("/_view/_admin");
		
		add("/admin", IndexAdminController.class, "/index");
		add("/admin/menu", MenuAdminController.class, "/menu");
		add("/admin/organ", OrganAdminController.class, "/organ");
		add("/admin/role", RoleAdminController.class, "/role");
		add("/admin/user", UserAdminController.class, "/user");
		add("/admin/userlog", UserLogAdminController.class, "/userlog");		
		add("/admin/navi", NaviAdminController.class, "/cmsnavi");
		add("/admin/news", NewsAdminController.class, "/cmsnews");
		add("/admin/about", AboutAdminController.class, "/cmsabout");
		add("/admin/file", FileAdminController.class, "/cmsfile");
		add("/admin/link", LinkAdminController.class, "/cmslink");
		add("/admin/slide", SlideAdminController.class, "/cmsslide");
		add("/admin/staff", StaffAdminController.class, "/cmsstaff");
		
	}

	
}





