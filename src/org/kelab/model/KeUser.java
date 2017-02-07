package org.kelab.model;

import org.kelab.model.base.BaseKeUser;

@SuppressWarnings("serial")
public class KeUser extends BaseKeUser<KeUser> {
	public static final KeUser dao = new KeUser();
	
	public KeUser removeSensitiveInfo() {
		remove("password");
		return this;
	}
}
