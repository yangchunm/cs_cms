$(document).ready(function() {
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","user/getUserById/");
	doDel("#btn-del","user/del");
	
	//保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {      
			$("#add-form span").text("");
			tmp_userPasswd = $("#frm_user_passwd").val();
			$.each(formData,function(key,obj){
				if(obj.name == "user_passwd" && tmp_userPasswd.length <32){
					obj.value=hex_md5(tmp_userPasswd);
				}
			})
		}
		, success: function(ret) {
			if(ret.isOk) {
				window.location.reload();
				return ;
			}
			if (ret.isFail) {
				$.messager.alert("提示",ret.msg);
				return ;
			}
			$.each(ret,function(key,value){
				var obj = "#"+key;
				$(obj).text(value);
			})
		}
		, error: function(ret) { }             
		, complete: function(ret) { }       
	});
	

	
});
//设置有效
function setIsEnable(userId,isEnable){
	$.post("user/revIsEnable",{userId:userId,isEnable:isEnable},function(ret){
	 if(ret.isOk){
		 window.location.reload();
		 return ;
	 }
	 if(ret.isFail){
		 $.messager.alert("提示",ret.msg);
		 window.location.reload();
	 }
	  });
}

//设置后台
function setIsSuper(userId,isSuper){
	$.post("user/revIsSuper",{userId:userId,isSuper:isSuper},function(ret){
	 if(ret.isOk){
		 window.location.reload();
		 return ;
	 }
	 if(ret.isFail){
		 $.messager.alert("提示",ret.msg);
		 window.location.reload();
	 }
	  });
}
