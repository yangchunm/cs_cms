package org.kelab.login;

import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import org.kelab.common.authcode.AuthCodeService;
import org.kelab.util.EmailKit;
import com.jfinal.kit.Ret;
import org.kelab.model.KeUser;
import org.kelab.model.KeSession;
import java.util.Date;

/**
 * 登录业务
 */
public class LoginService {

	public static final LoginService me = new LoginService();
	private final KeUser keUserDao = new KeUser().dao();

	// 存放登录用户的 cacheName
	public static final String loginUserCacheName = "loginUser";

	// "jfinalId" 仅用于 cookie 名称，其它地方如 cache 中全部用的 "sessionId" 来做 key
	public static final String sessionIdName = "keId";

	/**
	 * 登录成功返回 sessionId 与 loginAccount，否则返回一个 msg
	 */
	public Ret login(String userName, String password, boolean keepLogin, String loginIp) {
		userName = userName.toLowerCase().trim();
		password = password.trim();
		KeUser loginUser = keUserDao.findFirst("select * from ke_user where user_name=? limit 1", userName);
		if (loginUser == null) {
			return Ret.fail("msg", "用户名或密码不正确");
		}
		if (!loginUser.getUserIsenable()) {
			return Ret.fail("msg", "账号已被锁定");
		}

		//String salt = loginUser.getSalt();
		//String hashedPass = HashKit.sha256(salt + password);
		// 未通过密码验证
		if (loginUser.getUserPasswd().equals(password) == false) {
			return Ret.fail("msg", "用户名或密码不正确");
		}

		// 如果用户勾选保持登录，暂定过期时间为 3 年，否则为 120 分钟，单位为秒
		long liveSeconds =  keepLogin ? 3 * 365 * 24 * 60 * 60 : 120 * 60;
		// 传递给控制层的 cookie
		int maxAgeInSeconds = (int)(keepLogin ? liveSeconds : -1);
		// expireAt 用于设置 session 的过期时间点，需要转换成毫秒
		long expireTime = System.currentTimeMillis() + (liveSeconds * 1000);
		// 保存登录 session 到数据库
		KeSession session = new KeSession();
		String sessionId = StrKit.getRandomUUID();
		session.setId(sessionId);
		session.setUserId(loginUser.getId());
		session.setExpireTime(expireTime);
		if ( ! session.save()) {
			return Ret.fail("msg", "保存 session 到数据库失败，请联系管理员");
		}

		loginUser.removeSensitiveInfo();                                 // 移除 password 与 salt 属性值
		loginUser.put("sessionId", sessionId);                          // 保存一份 sessionId 到 loginAccount 备用
		CacheKit.put(loginUserCacheName, sessionId, loginUser);

		createLoginLog(loginUser.getId(), loginIp);

		return Ret.ok(sessionIdName, sessionId)
						.set(loginUserCacheName, loginUser)
						.set("maxAgeInSeconds", maxAgeInSeconds);   // 用于设置 cookie 的最大存活时间
	}

	public KeUser getLoginAccountWithSessionId(String sessionId) {
		return CacheKit.get(loginUserCacheName, sessionId);
	}

	/**
	 * 通过 sessionId 获取登录用户信息
	 * sessoin表结构：session(id, accountId, expireAt)
	 *
	 * 1：先从缓存里面取，如果取到则返回该值，如果没取到则从数据库里面取
	 * 2：在数据库里面取，如果取到了，则检测是否已过期，如果过期则清除记录，
	 *     如果没过期则先放缓存一份，然后再返回
	 */
	public KeUser loginWithSessionId(String sessionId, String loginIp) {
		KeSession session = KeSession.dao.findById(sessionId);
		if (session == null) {      // session 不存在
			return null;
		}
		if (session.isExpired()) {  // session 已过期
			session.delete();		// 被动式删除过期数据，此外还需要定时线程来主动清除过期数据
			return null;
		}

		KeUser loginUser = keUserDao.findById(session.getUserId());
		// 找到 loginAccount 并且 是正常状态 才允许登录
		if (loginUser != null && loginUser.getUserIsenable()) {
			loginUser.removeSensitiveInfo();                                 // 移除 password 与 salt 属性值
			loginUser.put("sessionId", sessionId);                          // 保存一份 sessionId 到 loginAccount 备用
			CacheKit.put(loginUserCacheName, sessionId, loginUser);

			createLoginLog(loginUser.getId(), loginIp);
			return loginUser;
		}
		return null;
	}

	/**
	 * 创建登录日志
	 */
	private void createLoginLog(Integer userId, String loginIp) {
		Record userLog = new Record().set("log_user_id", userId)
				.set("log_ip", loginIp)
				.set("log_desc", "用户登录")
				.set("log_time", new Date())
				.set("log_opt_table","ke_user_log");
		Db.save("ke_user_log", userLog);
		KeUser.dao.findById(userId).set("user_last_login_time", new Date()).update();
	}

	/**
	 * 发送密码找回授权邮件
	 */
	public Ret sendRetrievePasswordAuthEmail(String userName) {
		if (StrKit.isBlank(userName) || userName.indexOf('@') == -1) {
			return Ret.fail("msg", "email 格式不正确，请重新输入");
		}
		userName = userName.toLowerCase().trim();   // email 转成小写
		KeUser account = keUserDao.findFirst("select * from ke_user where user_name=? limit 1", userName);
		if (account == null) {
			return Ret.fail("msg", "您输入的 email 还没注册，无法找回密码");
		}

		String authCode = AuthCodeService.me.createRetrievePasswordAuthCode(account.getId());

		String title = "JFinal 密码找回邮件";
		String content = "在浏览器地址栏里输入并访问下面链接即可重置密码：\n\n"
				+ " http://XXXX/login/retrievePassword?authCode="
				+ authCode;

		String emailServer = PropKit.get("emailServer");
		String fromEmail = PropKit.get("fromEmail");
		String emailPass = PropKit.get("emailPass");
		String toEmail = account.getStr("userName");
		try {
			EmailKit.sendEmail(emailServer, fromEmail, emailPass, toEmail, title, content);
			return Ret.ok("msg", "密码找回邮件已发送至邮箱，请收取邮件并重置密码");
		} catch (Exception e) {
			return Ret.fail("msg", "密码找回邮件发送失败，可能是邮件服务器出现故障，请去JFinal官方QQ群留言给群主");
		}
	}

	/**
	 * 找回密码
	 */
/*	public Ret retrievePassword(String authCodeId, String newPassword) {
		if (StrKit.isBlank(newPassword)) {
			return Ret.fail("msg", "密码不能为空");
		}
		if (newPassword.length() < 6) {
			return Ret.fail("msg", "密码长度不能小于6");
		}

		KeAuthCode authCode = AuthCodeService.me.getAuthCode(authCodeId);
		if (authCode != null && authCode.isValidRetrievePasswordAuthCode()) {
			String salt = HashKit.generateSaltForSha256();
			newPassword = HashKit.sha256(salt + newPassword);
			int accountId = authCode.getAccountId();
			int result = Db.update("update account set password=?, salt=? where id=? limit 1", newPassword, salt, accountId);
			if (result > 0) {
				return Ret.ok("msg", "密码更新成功，现在即可登录");
			} else {
				return Ret.fail("msg", "未找到账号，请联系管理员");
			}
		} else {
			return Ret.fail("msg", "authCode 不存在或已经失效，可以尝试重新发送找回密码邮件");
		}
	}*/

	/**
	 * 退出登录
	 */
	public void logout(String sessionId) {
		if (sessionId != null) {
			CacheKit.remove(loginUserCacheName, sessionId);
			KeSession.dao.deleteById(sessionId);
		}
	}

	/**
	 * 从数据库重新加载登录账户信息
	 */
/*	public void reloadLoginAccount(loginUser loginAccountOld) {
		String sessionId = loginAccountOld.get("sessionId");
		Account loginAccount = accountDao.findFirst("select * from account where id=? limit 1", loginAccountOld.getId());
		loginAccount.removeSensitiveInfo();               // 移除 password 与 salt 属性值
		loginAccount.put("sessionId", sessionId);        // 保存一份 sessionId 到 loginAccount 备用

		// 集群方式下，要做一通知其它节点的机制，让其它节点使用缓存更新后的数据，
		// 将来可能把 account 用 id : obj 的形式放缓存，更新缓存只需要 CacheKit.remove("account", id) 就可以了，
		// 其它节点发现数据不存在会自动去数据库读取，所以未来可能就是在 AccountService.getById(int id)的方法引入缓存就好
		// 所有用到 account 对象的地方都从这里去取
		CacheKit.put(loginAccountCacheName, sessionId, loginAccount);
	}*/
}
