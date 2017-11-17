$(document).ready(function() {
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","file/getFileById/");
	doDel("#btn-del","knfile/del");
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
	$(".file-down").click(function(){
		var fileId = $(this).attr("value");
		$.get("file/fileDown/"+fileId,function(ret){
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

