package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKnFile<M extends BaseKnFile<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setKnfiKntrId(java.lang.Integer knfiKntrId) {
		set("knfi_kntr_id", knfiKntrId);
	}

	public java.lang.Integer getKnfiKntrId() {
		return get("knfi_kntr_id");
	}

	public void setKnfiEname(java.lang.String knfiEname) {
		set("knfi_ename", knfiEname);
	}

	public java.lang.String getKnfiEname() {
		return get("knfi_ename");
	}

	public void setKnfiPath(java.lang.String knfiPath) {
		set("knfi_path", knfiPath);
	}

	public java.lang.String getKnfiPath() {
		return get("knfi_path");
	}

	public void setKnfiDesc(java.lang.String knfiDesc) {
		set("knfi_desc", knfiDesc);
	}

	public java.lang.String getKnfiDesc() {
		return get("knfi_desc");
	}

	public void setKnfiType(java.lang.String knfiType) {
		set("knfi_type", knfiType);
	}

	public java.lang.String getKnfiType() {
		return get("knfi_type");
	}

	public void setKnfiUserId(java.lang.Integer knfiUserId) {
		set("knfi_user_id", knfiUserId);
	}

	public java.lang.Integer getKnfiUserId() {
		return get("knfi_user_id");
	}

	public void setKnfiTime(java.util.Date knfiTime) {
		set("knfi_time", knfiTime);
	}

	public java.util.Date getKnfiTime() {
		return get("knfi_time");
	}

	public void setKnfiSize(java.lang.Long knfiSize) {
		set("knfi_size", knfiSize);
	}

	public java.lang.Long getKnfiSize() {
		return get("knfi_size");
	}

	public void setKnfiTag(java.lang.String knfiTag) {
		set("knfi_tag", knfiTag);
	}

	public java.lang.String getKnfiTag() {
		return get("knfi_tag");
	}

}
