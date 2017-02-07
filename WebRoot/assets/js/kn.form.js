$(document).ready(function() {
	
	
	//新增
	$("#btn-add").click(function(){
		window.location = "knform/add";
	});

	//修改
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		window.location = "knform/edit/"+ids;
	 });
	
	doDel("#btn-del","knform/del");
	
	
	//保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {   
			$("#add-form span").text("");
		}
		, success: function(ret) {
			if(ret.isOk) {
				$.messager.confirm("提示","<strong>保存成功！！</strong><strong>确定</strong>返回上一页，<strong>取消</strong>继续添加？"
					,function(){
						window.location.href="/admin/knform";
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

