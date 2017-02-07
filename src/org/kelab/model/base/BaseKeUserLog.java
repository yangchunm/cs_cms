package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKeUserLog<M extends BaseKeUserLog<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setLogUserId(java.lang.Integer logUserId) {
		set("log_user_id", logUserId);
	}

	public java.lang.Integer getLogUserId() {
		return get("log_user_id");
	}

	public void setLogDesc(java.lang.String logDesc) {
		set("log_desc", logDesc);
	}

	public java.lang.String getLogDesc() {
		return get("log_desc");
	}

	public void setLogIp(java.lang.String logIp) {
		set("log_ip", logIp);
	}

	public java.lang.String getLogIp() {
		return get("log_ip");
	}

	public void setLogTime(java.util.Date logTime) {
		set("log_time", logTime);
	}

	public java.util.Date getLogTime() {
		return get("log_time");
	}

	public void setLogOptTable(java.lang.String logOptTable) {
		set("log_opt_table", logOptTable);
	}

	public java.lang.String getLogOptTable() {
		return get("log_opt_table");
	}

}
