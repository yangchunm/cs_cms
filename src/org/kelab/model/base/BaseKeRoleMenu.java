package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKeRoleMenu<M extends BaseKeRoleMenu<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setRoleId(java.lang.Integer roleId) {
		set("role_id", roleId);
	}

	public java.lang.Integer getRoleId() {
		return get("role_id");
	}

	public void setMenuId(java.lang.Integer menuId) {
		set("menu_id", menuId);
	}

	public java.lang.Integer getMenuId() {
		return get("menu_id");
	}

}
