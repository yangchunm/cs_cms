package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKeAction<M extends BaseKeAction<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setActiName(java.lang.String actiName) {
		set("acti_name", actiName);
	}

	public java.lang.String getActiName() {
		return get("acti_name");
	}

	public void setActiUrl(java.lang.String actiUrl) {
		set("acti_url", actiUrl);
	}

	public java.lang.String getActiUrl() {
		return get("acti_url");
	}

	public void setActiDesc(java.lang.String actiDesc) {
		set("acti_desc", actiDesc);
	}

	public java.lang.String getActiDesc() {
		return get("acti_desc");
	}

	public void setActiType(java.lang.Integer actiType) {
		set("acti_type", actiType);
	}

	public java.lang.Integer getActiType() {
		return get("acti_type");
	}

}
