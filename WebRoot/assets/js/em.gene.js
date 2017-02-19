$(document).ready(function() {
	
	//新增按钮
	$("#btn-add").click(function(){
		window.location = "emgene/add";
	});

	//修改
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		window.location = "emgene/edit/"+ids;
	 });
	
	//删除
	doDel("#btn-del","emgene/del");	
	
	//表单保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, success: function(ret) {
			if(ret.isOk) {
				$.messager.confirm("提示","<strong>保存成功！！</strong><strong>确定</strong>返回上一页，<strong>取消</strong>继续添加？"
					,function(){
					 	fromurl = document.referrer;
						window.location.href=fromurl;
						return ; 
				});
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
