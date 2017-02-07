package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKnFormula<M extends BaseKnFormula<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setKnfoKntrId(java.lang.Integer knfoKntrId) {
		set("knfo_kntr_id", knfoKntrId);
	}

	public java.lang.Integer getKnfoKntrId() {
		return get("knfo_kntr_id");
	}

	public void setKnfoText(java.lang.String knfoText) {
		set("knfo_text", knfoText);
	}

	public java.lang.String getKnfoText() {
		return get("knfo_text");
	}

	public void setKnfoCode(java.lang.String knfoCode) {
		set("knfo_code", knfoCode);
	}

	public java.lang.String getKnfoCode() {
		return get("knfo_code");
	}

	public void setKnfoLang(java.lang.String knfoLang) {
		set("knfo_lang", knfoLang);
	}

	public java.lang.String getKnfoLang() {
		return get("knfo_lang");
	}

	public void setKnfoUserId(java.lang.Integer knfoUserId) {
		set("knfo_user_id", knfoUserId);
	}

	public java.lang.Integer getKnfoUserId() {
		return get("knfo_user_id");
	}

	public void setKnfoImput(java.lang.String knfoInput) {
		set("knfo_input", knfoInput);
	}

	public java.lang.String getKnfoInput() {
		return get("knfo_input");
	}
	
	public void setKnfoInputDesc(java.lang.String knfoInputDesc) {
		set("knfo_input_desc", knfoInputDesc);
	}

	public java.lang.String getKnfoInputDesc() {
		return get("knfo_input_desc");
	}

	public void setKnfoDesc(java.lang.String knfoDesc) {
		set("knfo_desc", knfoDesc);
	}

	public java.lang.String getKnfoDesc() {
		return get("knfo_desc");
	}

	public void setKnfoName(java.lang.String knfoName) {
		set("knfo_name", knfoName);
	}

	public java.lang.String getKnfoName() {
		return get("knfo_name");
	}

	public void setKnfoTime(java.util.Date knfoTime) {
		set("knfo_time", knfoTime);
	}

	public java.util.Date getKnfoTime() {
		return get("knfo_time");
	}

	public void setKnfoTag(java.lang.String knfoTag) {
		set("knfo_tag", knfoTag);
	}

	public java.lang.String getKnfoTag() {
		return get("knfo_tag");
	}
	public void setKnfoLatex(java.lang.String knfoLatex) {
		set("knfo_latex", knfoLatex);
	}

	public java.lang.String getKnfoLatex() {
		return get("knfo_latex");
	}
}
