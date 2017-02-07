
package org.kelab.common.authcode;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;

import org.kelab.model.KeAuthCode;

import com.jfinal.kit.Ret;

/**
 * 授权码业务
 * 用于一切需要授权的业务，例如：
 * 1：邮件激活
 * 2：密码找回
 * 3：未来一切需要授权码的场景
 */
public class AuthCodeService {
	
	public static final AuthCodeService me = new AuthCodeService();
	private static final KeAuthCode dao = new KeAuthCode().dao();

	/**
	 * 创建注册激活授权码，一个小时后过期，3600 秒
	 */
	public String createRegActivateAuthCode(int accountId) {
		return createAuthCode(accountId, KeAuthCode.TYPE_REG_ACTIVATE, 3600);
	}

	/**
	 * 创建密码找回授权码，一个小时后过期，3600 秒
	 */
	public String createRetrievePasswordAuthCode(int accountId) {
		return createAuthCode(accountId, KeAuthCode.TYPE_RETRIEVE_PASSWORD, 3600);
	}

	/**
	 * 获取授权码，授权码只能使用一次，在被获取后会被立即删除
	 */
	public KeAuthCode getAuthCode(String authCodeId) {
		if (StrKit.notBlank(authCodeId)) {
			KeAuthCode authCode = dao.findById(authCodeId.trim());    // authCode 是唯一的
			if (authCode != null) {
				authCode.delete();   // 只要找到 authCode，则立即删除
				return authCode;
			}
		}
		return null;
	}

	/**
	 * 创建授权码，并自动保存到数据库
	 * @param accountId 用户账号id
	 * @param authType 授权类型
	 * @param expireTime 授权码过期时长，过期时长是指授权码自创建时间起直到过期的时间长度，单位为秒
	 */
	private String createAuthCode(int accountId, int authType, int expireTime) {
		long et = expireTime;   // 使用 long et 为了避免 int 数值溢出，造成保存到数据库中的数值错误
		long expireAt = System.currentTimeMillis() + (et * 1000);

		KeAuthCode ac = new  KeAuthCode();
		ac.setId(StrKit.getRandomUUID());
		ac.setUserId(accountId);
		ac.setType(authType);
		ac.setExpireTime(expireAt);

		if (ac.save()) {
			return ac.getId();
		} else {
			throw new RuntimeException("保存 auth_code 记录失败，请联系管理员");
		}
	}

	/**
	 * 看一眼授权码，未过期时则不删除
	 */
	public Ret peekAuthCode(String id) {
		KeAuthCode authCode = dao.findById(id);
		if (authCode != null) {
			if (authCode.notExpired()) {
				return Ret.ok("authCode", authCode);
			} else {
				authCode.delete();
				return Ret.fail("msg", "授权码已过期");
			}
		} else {
			return Ret.fail("msg", "授权码不存在");
		}
	}
	
	/**
	 * 主动清除未使用过的过期授权码
	 * 不用经常调用，因为授权码在第一次使用时会自动删除，过期的未删除的授权码仅是未使用过的
	 */
	public int clearExpiredAuthCode() {
		return Db.update("delete from auth_code where expireAt < ?", System.currentTimeMillis());
	}
}







