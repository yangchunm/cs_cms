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
				$("#frm_id").val(ret.currId);
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
	
	//运行程序
	$("#form-run").click(function(){
		var knfo_code = $("#frm_knfo_code").val();
		var knfo_lang = $("#frm_knfo_lang").val();
		var knfo_input = $("#frm_knfo_input").val();
		if(knfo_code == "" || knfo_lang == "" || knfo_input == ""){
			$.messager.alert("提示","程序、语言和数据样例必须填写！！");
			return ;
		}
		$.post("../runFormProg",{
				knfo_code : knfo_code,
				knfo_lang : knfo_lang,
				knfo_input : knfo_input
			},function(ret){
			$.messager.alert("共耗时："+ret.timeUser+"ms",ret.msg);
			return ;
		});
		
	});
});

