package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseDmSubmit<M extends BaseDmSubmit<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setDmsuDmalId(java.lang.Integer dmsuDmalId) {
		set("dmsu_dmal_id", dmsuDmalId);
	}

	public java.lang.Integer getDmsuDmalId() {
		return get("dmsu_dmal_id");
	}

	public void setDmsuUserId(java.lang.Integer dmsuUserId) {
		set("dmsu_user_id", dmsuUserId);
	}

	public java.lang.Integer getDmsuUserId() {
		return get("dmsu_user_id");
	}

	public void setDmsuArgument(java.lang.String dmsuArgument) {
		set("dmsu_argument", dmsuArgument);
	}

	public java.lang.String getDmsuArgument() {
		return get("dmsu_argument");
	}

	public void setDmsuDataFile(java.lang.String dmsuDataFile) {
		set("dmsu_data_file", dmsuDataFile);
	}

	public java.lang.String getDmsuDataFile() {
		return get("dmsu_data_file");
	}

	public void setDmsuResult(java.lang.String dmsuResult) {
		set("dmsu_result", dmsuResult);
	}

	public java.lang.String getDmsuResult() {
		return get("dmsu_result");
	}

	public void setDmsuTime(java.util.Date dmsuTime) {
		set("dmsu_time", dmsuTime);
	}

	public java.util.Date getDmsuTime() {
		return get("dmsu_time");
	}

	public void setDmsuIp(java.lang.String dmsuIp) {
		set("dmsu_ip", dmsuIp);
	}

	public java.lang.String getDmsuIp() {
		return get("dmsu_ip");
	}

	public void setDmsuTimeUse(java.lang.Integer dmsuTimeUse) {
		set("dmsu_time_use", dmsuTimeUse);
	}

	public java.lang.Integer getDmsuTimeUse() {
		return get("dmsu_time_use");
	}

	public void setDmsuMemUse(java.lang.Double dmsuMemUse) {
		set("dmsu_mem_use", dmsuMemUse);
	}

	public java.lang.Double getDmsuMemUse() {
		return get("dmsu_mem_use");
	}

}
