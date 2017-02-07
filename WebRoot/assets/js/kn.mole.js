$(document).ready(function() {
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","knmole/getKnMoleById/");
	doDel("#btn-del","knmole/del");
	$(".datepick").datetimepicker({
		language:'zh-CN',
		 autoclose: 1,
		format:'yyyy-mm-dd',
		todayBtn: 1,
		startView: 3,
	     minView:2,
	     pickerPosition: "bottom-left"
	});
	
	//保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {      
			var flag = true;
			$.each(formData,function(key,obj){
				if(obj.name != "knmo_file" && obj.value == ""){
					var msgObj = "#"+obj.name+"_msg";
					flag = false;
					$.messager.alert("提示","每一项必须填写！");
					return false;
				}
			});
			return flag;
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
	
	//下载
	$(".knmo-down").click(function(){
		var fileId = $(this).attr("value");
		$.get("knmole/fileDown/"+fileId,function(ret){
			if(ret.isOk){
				window.location.href=ret.msg;
				return ;
			}
			if (ret.isFail) {
				$.messager.alert("提示",ret.msg);
				return ;
			}
		});
	});
	
});

