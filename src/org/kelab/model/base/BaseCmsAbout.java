package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseCmsAbout<M extends BaseCmsAbout<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setAbouNaviId(java.lang.Integer abouNaviId) {
		set("abou_navi_id", abouNaviId);
	}

	public java.lang.Integer getAbouNaviId() {
		return get("abou_navi_id");
	}

	public void setAbouTitle(java.lang.String abouTitle) {
		set("abou_title", abouTitle);
	}

	public java.lang.String getAbouTitle() {
		return get("abou_title");
	}

	public void setAbouContent(java.lang.String abouContent) {
		set("abou_content", abouContent);
	}

	public java.lang.String getAbouContent() {
		return get("abou_content");
	}

	public void setAbouTime(java.util.Date abouTime) {
		set("abou_time", abouTime);
	}

	public java.util.Date getAbouTime() {
		return get("abou_time");
	}

	public void setAbouTags(java.lang.String abouTags) {
		set("abou_tags", abouTags);
	}

	public java.lang.String getAbouTags() {
		return get("abou_tags");
	}

	public void setAbouUserId(java.lang.Integer abouUserId) {
		set("abou_user_id", abouUserId);
	}

	public java.lang.Integer getAbouUserId() {
		return get("abou_user_id");
	}

	public void setAbouHit(java.lang.Integer abouHit) {
		set("abou_hit", abouHit);
	}

	public java.lang.Integer getAbouHit() {
		return get("abou_hit");
	}

}
