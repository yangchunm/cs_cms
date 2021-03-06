package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseCmsLink<M extends BaseCmsLink<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setLinkName(java.lang.String linkName) {
		set("link_name", linkName);
	}

	public java.lang.String getLinkName() {
		return get("link_name");
	}

	public void setLinkUrl(java.lang.String linkUrl) {
		set("link_url", linkUrl);
	}

	public java.lang.String getLinkUrl() {
		return get("link_url");
	}

	public void setLinkPic(java.lang.String linkPic) {
		set("link_pic", linkPic);
	}

	public java.lang.String getLinkPic() {
		return get("link_pic");
	}

	public void setLinkTime(java.util.Date linkTime) {
		set("link_time", linkTime);
	}

	public java.util.Date getLinkTime() {
		return get("link_time");
	}

	public void setLinkUserId(java.lang.Integer linkUserId) {
		set("link_user_id", linkUserId);
	}

	public java.lang.Integer getLinkUserId() {
		return get("link_user_id");
	}

	public void setLinkOrder(java.lang.Integer linkOrder) {
		set("link_order", linkOrder);
	}

	public java.lang.Integer getLinkOrder() {
		return get("link_order");
	}
	public void setLinkType(java.lang.Integer linkType) {
		set("link_type", linkType);
	}

	public java.lang.Integer getLinkType() {
		return get("link_type");
	}

}
