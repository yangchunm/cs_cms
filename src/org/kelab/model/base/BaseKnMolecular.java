package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKnMolecular<M extends BaseKnMolecular<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setKnmoMoluText(java.lang.String knmoMoluText) {
		set("knmo_molu_text", knmoMoluText);
	}

	public java.lang.String getKnmoMoluText() {
		return get("knmo_molu_text");
	}

	public void setKnmoKntrId(java.lang.Integer knmoKntrId) {
		set("knmo_kntr_id", knmoKntrId);
	}

	public java.lang.Integer getKnmoKntrId() {
		return get("knmo_kntr_id");
	}

	public void setKnmoUserId(java.lang.Integer knmoUserId) {
		set("knmo_user_id", knmoUserId);
	}

	public java.lang.Integer getKnmoUserId() {
		return get("knmo_user_id");
	}

	public void setKnmoTime(java.util.Date knmoTime) {
		set("knmo_time", knmoTime);
	}

	public java.util.Date getKnmoTime() {
		return get("knmo_time");
	}

	public void setKnmoFile(java.lang.String knmoFile) {
		set("knmo_file", knmoFile);
	}

	public java.lang.String getKnmoFile() {
		return get("knmo_file");
	}

	public void setKnmoName(java.lang.String knmoName) {
		set("knmo_name", knmoName);
	}

	public java.lang.String getKnmoName() {
		return get("knmo_name");
	}

	public void setKnmoDesc(java.lang.String knmoDesc) {
		set("knmo_desc", knmoDesc);
	}

	public java.lang.String getKnmoDesc() {
		return get("knmo_desc");
	}

	public void setKnmoTag(java.lang.String knmoTag) {
		set("knmo_tag", knmoTag);
	}

	public java.lang.String getKnmoTag() {
		return get("knmo_tag");
	}
	public void setKnmoFileType(java.lang.String knmoFileType) {
		set("knmo_file_type", knmoFileType);
	}

	public java.lang.String getKnmoFileType() {
		return get("knmo_file_type");
	}
	public void setKnmoPng(java.lang.String knmoPng) {
		set("knmo_png", knmoPng);
	}

	public java.lang.String getKnmoPng() {
		return get("knmo_png");
	}

}
