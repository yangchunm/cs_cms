package org.kelab.common;

import org.kelab.model._MappingKit;
import org.kelab.admin.common.AdminRoutes;
import org.kelab.common.FrontRoutes;
import org.kelab.common.interceptor.LoginSessionInterceptor;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.template.*;

public class MainConfig extends JFinalConfig {
	private static Prop p = loadConfig();
	
	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
		me.setDevMode(p.getBoolean("devMode"));
		me.setBaseUploadPath(p.get("baseUploadPath"));
		me.setBaseDownloadPath(p.get("baseUploadPath"));
		//me.setMaxPostSize(1024*1024*10);
		//me.setBaseDownloadPath("");
		//me.setViewType(ViewType.JSP);
		me.setError404View("error_404.html");
		me.setError500View("error_500.html");
		me.setError403View("error_403.html");
				
	}
	
	private static Prop loadConfig() {
		try {
			// 优先加载生产环境配置文件
			return PropKit.use("config.properties");
		} catch (Exception e) {
			// 找不到生产环境配置文件，再去找开发环境配置文件
			return PropKit.use("config.properties");
		}
	}
	/**
	 * 配置路由映射
	 */
	@Override
	public void configRoute(Routes me) {
		me.add(new FrontRoutes());
	    me.add(new AdminRoutes());

	}
	
	/**
     * 配置模板引擎，通常情况只需配置共享的模板函数
     */
    public void configEngine(Engine me) {
    	me.addSharedFunction("/_view/common/__layout.html");
    	me.addSharedFunction("/_view/common/_paginate.html");
	    me.addSharedFunction("/_view/_admin/common/__admin_layout.html");
    }
	/**
	 * 配置JFinal插件
	 * 数据库连接池
	 * ORM
	 * 缓存等插件
	 * 自定义插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		//配置数据库连接池插件
		C3p0Plugin c3p0Plugin=new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"));
		//orm映射 配置ActiveRecord插件
		ActiveRecordPlugin arp=new ActiveRecordPlugin(c3p0Plugin);
		arp.setShowSql(PropKit.getBoolean("devMode"));
		arp.setDialect(new MysqlDialect());
		/********在此添加数据库 表-Model 映射*********/
		_MappingKit.mapping(arp);
		//添加到插件列表中
		me.add(c3p0Plugin);
		me.add(arp);
        
	    me.add(new EhCachePlugin());
	    
	}
	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
	    me.add(new LoginSessionInterceptor());
    }
	/**
	 * 配置全局处理器
	 */
	@Override
	public void configHandler(Handlers me) {

	}
	public static void main(String[] args) {
		JFinal.start("WebRoot", 80, "/", 5);
	}
	

}
