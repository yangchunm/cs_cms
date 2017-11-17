package org.kelab.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("cms_about", "id", CmsAbout.class);
		arp.addMapping("cms_file", "id", CmsFile.class);
		arp.addMapping("cms_link", "id", CmsLink.class);
		arp.addMapping("cms_navi", "id", CmsNavi.class);
		arp.addMapping("cms_navi_type", "id", CmsNaviType.class);
		arp.addMapping("cms_news", "id", CmsNews.class);
		arp.addMapping("cms_slide", "id", CmsSlide.class);
		arp.addMapping("cms_staff", "id", CmsStaff.class);
		arp.addMapping("ke_action", "id", KeAction.class);
		arp.addMapping("ke_auth_code", "id", KeAuthCode.class);
		arp.addMapping("ke_menu", "id", KeMenu.class);
		arp.addMapping("ke_menu_action", "id", KeMenuAction.class);
		arp.addMapping("ke_organ", "id", KeOrgan.class);
		arp.addMapping("ke_role", "id", KeRole.class);
		arp.addMapping("ke_role_menu", "id", KeRoleMenu.class);
		arp.addMapping("ke_security", "id", KeSecurity.class);
		arp.addMapping("ke_session", "id", KeSession.class);
		arp.addMapping("ke_user", "id", KeUser.class);
		arp.addMapping("ke_user_log", "id", KeUserLog.class);
	}
}

