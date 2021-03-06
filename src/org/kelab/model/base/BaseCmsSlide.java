package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseCmsSlide<M extends BaseCmsSlide<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setSlidTitle(java.lang.String slidTitle) {
		set("slid_title", slidTitle);
	}

	public java.lang.String getSlidTitle() {
		return get("slid_title");
	}

	public void setSlidPic(java.lang.String slidPic) {
		set("slid_pic", slidPic);
	}

	public java.lang.String getSlidPic() {
		return get("slid_pic");
	}

	public void setSlidUrl(java.lang.String slidUrl) {
		set("slid_url", slidUrl);
	}

	public java.lang.String getSlidUrl() {
		return get("slid_url");
	}

	public void setSlidOrder(java.lang.Integer slidOrder) {
		set("slid_order", slidOrder);
	}

	public java.lang.Integer getSlidOrder() {
		return get("slid_order");
	}

	public void setSlidTime(java.util.Date slidTime) {
		set("slid_time", slidTime);
	}

	public java.util.Date getSlidTime() {
		return get("slid_time");
	}

	public void setSlidUserId(java.lang.Integer slidUserId) {
		set("slid_user_id", slidUserId);
	}

	public java.lang.Integer getSlidUserId() {
		return get("slid_user_id");
	}

}
