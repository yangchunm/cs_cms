package org.kelab.admin.common;

import org.kelab.admin.dm.algocate.AlgoCateAdminController;
import org.kelab.admin.dm.algorithm.AlgorithmAdminController;
import org.kelab.admin.dm.submit.SubmitAdminController;
import org.kelab.admin.em.attr.AttrAdminController;
import org.kelab.admin.em.cate.CateAdminController;
import org.kelab.admin.em.gene.GeneAdminController;
import org.kelab.admin.index.IndexAdminController;
import org.kelab.admin.ke.menu.MenuAdminController;
import org.kelab.admin.ke.organ.OrganAdminController;
import org.kelab.admin.ke.role.RoleAdminController;
import org.kelab.admin.ke.user.UserAdminController;
import org.kelab.admin.ke.userlog.UserLogAdminController;
import org.kelab.admin.kn.entry.EntryAdminController;
import org.kelab.admin.kn.file.FileAdminController;
import org.kelab.admin.kn.formula.FormulaAdminController;
import org.kelab.admin.kn.molecular.MolecularAdminController;
import org.kelab.admin.kn.tree.TreeAdminController;
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
		
		add("/admin/kntree", TreeAdminController.class, "/kntree");
		add("/admin/knfile", FileAdminController.class, "/knfile");
		add("/admin/knform", FormulaAdminController.class, "/knform");
		add("/admin/knmole", MolecularAdminController.class, "/knmole");
		add("/admin/knentry", EntryAdminController.class, "/knentry");

		add("/admin/emcate", CateAdminController.class, "/emcate");
		add("/admin/emattr", AttrAdminController.class, "/emattr");
		add("/admin/emgene", GeneAdminController.class, "/emgene");
		
		add("/admin/dmcate", AlgoCateAdminController.class, "/dmcate");
		add("/admin/dmalgo", AlgorithmAdminController.class, "/dmalgo");
		add("/admin/dmsubmit", SubmitAdminController.class, "/dmsubmit");
	}

	
}





