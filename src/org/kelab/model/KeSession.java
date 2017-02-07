package org.kelab.model;

import org.kelab.model.base.BaseKeSession;


public class KeSession extends BaseKeSession<KeSession> {
	public static final KeSession dao = new KeSession();
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 登录会话是否已过期
	 */
	public boolean isExpired() {
		return getExpireTime() < System.currentTimeMillis();
	}

	/**
	 * 登录会话是否未过期
	 */
	public boolean notExpired() {
		return ! isExpired();
	}
}
