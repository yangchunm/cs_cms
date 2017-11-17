package org.kelab.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseKeUser<M extends BaseKeUser<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setUserName(java.lang.String userName) {
		set("user_name", userName);
	}

	public java.lang.String getUserName() {
		return get("user_name");
	}

	public void setUserPasswd(java.lang.String userPasswd) {
		set("user_passwd", userPasswd);
	}

	public java.lang.String getUserPasswd() {
		return get("user_passwd");
	}

	public void setUserRealName(java.lang.String userRealName) {
		set("user_real_name", userRealName);
	}

	public java.lang.String getUserRealName() {
		return get("user_real_name");
	}

	public void setUserRegTime(java.util.Date userRegTime) {
		set("user_reg_time", userRegTime);
	}

	public java.util.Date getUserRegTime() {
		return get("user_reg_time");
	}

	public void setUserLastLoginTime(java.util.Date userLastLoginTime) {
		set("user_last_login_time", userLastLoginTime);
	}

	public java.util.Date getUserLastLoginTime() {
		return get("user_last_login_time");
	}

	public void setUserLoginCount(java.lang.Integer userLoginCount) {
		set("user_login_count", userLoginCount);
	}

	public java.lang.Integer getUserLoginCount() {
		return get("user_login_count");
	}

	public void setUserOrgaId(java.lang.Integer userOrgaId) {
		set("user_orga_id", userOrgaId);
	}

	public java.lang.Integer getUserOrgaId() {
		return get("user_orga_id");
	}

	public void setUserRoleId(java.lang.Integer userRoleId) {
		set("user_role_id", userRoleId);
	}

	public java.lang.Integer getUserRoleId() {
		return get("user_role_id");
	}

	public void setUserSecurityId(java.lang.Integer userSecurityId) {
		set("user_security_id", userSecurityId);
	}

	public java.lang.Integer getUserSecurityId() {
		return get("user_security_id");
	}

	public void setUserIsenable(java.lang.Boolean userIsenable) {
		set("user_isenable", userIsenable);
	}

	public java.lang.Boolean getUserIsenable() {
		return get("user_isenable");
	}
	
	public void setUserIsSuper(java.lang.Boolean userIsSuper) {
		set("user_is_super", userIsSuper);
	}

	public java.lang.Boolean getUserIsSuper() {
		return get("user_is_super");
	}
	
	public void setUserPinyin(java.lang.String userPinyin) {
		set("user_pinyin", userPinyin);
	}

	public java.lang.String getUserPinyin() {
		return get("user_pinyin");
	}
	
	public void setUserIsActived(java.lang.Boolean userIsActived) {
		set("user_is_actived", userIsActived);
	}

	public java.lang.Boolean getUserIsActived() {
		return get("user_is_actived");
	}
	
	public void setUserActiCode(java.lang.String userActiCode) {
		set("user_acti_code", userActiCode);
	}

	public java.lang.String getUserActiCode() {
		return get("user_acti_code");
	}
	
	public void setUserEmail(java.lang.String userEmail) {
		set("user_email", userEmail);
	}

	public java.lang.String getUserEmail() {
		return get("user_email");
	}

}
