$(document).ready(function() {
	
	//新增按钮
	$("#btn-add").click(function(){
		window.location = "news/add";
	});

	//修改
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		window.location = "news/edit/"+ids;
	 });
	//修改页面加载附加文件信息
	var entrId = $("#frm_id").val();
	if(entrId > 0){
		
	}
	
	//删除
	doDel("#btn-del","news/del");
	
	
	//词条表单保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {   
			//$("#add-form span").text("");
		}
		, success: function(ret) {
			if(ret.isOk) {
				$.messager.confirm("提示","<strong>保存成功！！</strong><strong>确定</strong>返回上一页，<strong>取消</strong>继续添加？"
					,function(){
					 	fromurl = document.referrer;
						window.location.href=fromurl;
						return ; 
				});
				//window.location.reload();
				//return ;
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

//设置置顶
function setIsTop(newsId,isTop){
	$.post("news/revIsTop",{newsId:newsId,isTop:isTop},function(ret){
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

//设置内部
function setIsRestrict(newsId,isRestrict){
	$.post("news/revIsRestrict",{newsId:newsId,isRestrict:isRestrict},function(ret){
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
