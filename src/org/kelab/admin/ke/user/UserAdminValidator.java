package org.kelab.admin.ke.user;

import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.validate.Validator;
/**
 * 参数验证
 */
public class UserAdminValidator extends Validator {

	protected void validate(Controller c) {
		setShortCircuit(true);
		validateRequired("user_name", "userNameMsg", "邮箱不能为空");
		validateEmail("user_name", "userNameMsg", "邮箱格式不正确");
		int tmpUserId = c.getParaToInt("id",0);
		if(UserAdminService.me.isUserNameExists(c.getPara("user_name"),tmpUserId)) {
			addError("userNameMsg", "邮箱已被注册");
		}
		/*validateEmail("user_name","userNameMsg","用户名为EMail");
		if (SensitiveWordsKit.checkSensitiveWord(c.getPara("nickName")) != null) {
			addError("nickNameMsg", "昵称不能包含敏感词");
		}*/

		validateString("user_real_name", 1, 19, "userRealNameMsg", "2~19个字");
		String realName = c.getPara("user_real_name").trim();
		if (realName.contains("@") || realName.contains("＠")) { // 全角半角都要判断
			addError("userRealNameMsg", "姓名不能包含 \"@\" 字符");
		}
		if (realName.contains(" ") || realName.contains("　")) {
			addError("userRealNameMsg", "姓名不能包含空格");
		}
		Ret ret = validateNickName(realName);
		if (ret.isFail()) {
			addError("userRealNameMsg", ret.getStr("msg"));
		}

		

		validateString("user_passwd", 6, 100, "userPasswdMsg", "密码长度不能小于6");
	}

	protected void handleError(Controller c) {
		c.renderJson();
		
	}
	
	/**
	 * TODO 用正则来匹配这些不能使用的字符，而不是用这种 for + contains 这么土的办法
	 *    初始化的时候仍然用这个数组，然后用 StringBuilder 来个 for 循环拼成如下的形式：
	 *    regex = "( |`|~|!|......|\(|\)|=|\[|\]|\?|<|>\。|\,)"
	 *    直接在数组中添加转义字符
	 * 
	 * TODO 找时间将所有 nickName 的校验全部封装起来，供 Validattor 与 RegService 中重用，目前先只补下缺失的校验
	 * TODO RegService 中的 nickName 校验也要重用同一份代码，以免代码重复
	 */
	public static Ret validateNickName(String nickName) {
		if (StrKit.isBlank(nickName)) {
			return Ret.fail("msg", "昵称不能为空");
		}

		// 放开了 _-.  三个字符的限制
		String[] arr = {" ", "`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+",
							"[", "]", "{", "}", "\\", "|", ";", ":", "'", "\"", ",", "<", ">", "/", "?",
							"　", "＠", "＃", "＆", "，", "。", "《", "》", "？" };   // 全角字符
		for (String s : arr) {
			if (nickName.contains(s)) {
				return Ret.fail("msg", "昵称不能包含字符: \"" + s +"\"");
			}
		}

		return Ret.ok();
	}
}
