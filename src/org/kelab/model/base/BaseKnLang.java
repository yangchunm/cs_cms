package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKnLang<M extends BaseKnLang<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setLang(java.lang.String lang) {
		set("lang", lang);
	}

	public java.lang.String getLang() {
		return get("lang");
	}

	public void setExt(java.lang.String ext) {
		set("ext", ext);
	}

	public java.lang.String getExt() {
		return get("ext");
	}
	
	public void setCmd(java.lang.String cmd){
		set("cmd",cmd);
	}
	public java.lang.String getCmd(){
		return get("cmd");
	}
	
	public void setArgu(java.lang.String argu){
		set("argu",argu);
	}
	public java.lang.String getArgu(){
		return get("argu");
	}

}
