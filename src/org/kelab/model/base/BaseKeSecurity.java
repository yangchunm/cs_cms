package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKeSecurity<M extends BaseKeSecurity<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setSecuName(java.lang.String secuName) {
		set("secu_name", secuName);
	}

	public java.lang.String getSecuName() {
		return get("secu_name");
	}

}
