$(document).ready(function() {
	//新增dialog
	$("#btn-add").click(function(){
		$("#frm_id").val(0);
		$("#add-form")[0].reset();
		editTable();
		$("#form-modal").modal("show");
	});
	
	//增加参数表格
	$("#argAdd").click(function(){
		var $editTable = $('#tableArg');
		$editTable.datagrid("insertRow",{row: {}});
	});
	
	//修改dialog
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		$("#add-form")[0].reset();
		$("#modal-title").text("修改");
		$.getJSON("dmalgo/getAlgoById/"+ids,
			function(rst) {
				var json = rst;
				$.each(json,function(key,value){
					var obj = "#frm_"+key;
					$(obj).val(value);
				})
				editTable(json.argL);
				$("#form-modal").modal("toggle");
		 	}
		 );
		 
	 });
	
	doDel("#btn-del","dmalgo/del");
	
	//保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {      
			var flag = true;
			$.each(formData,function(key,obj){
				if(obj.value == ""){
					var msgObj = "#"+obj.name+"_msg";
					flag = false;
					$.messager.alert("提示","每一项必须填写！");
					return false;
				}
				
				//alert(obj.name+"#"+obj.value);
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
	

	
});

/**
 * 提交前检查表单
 */
function checkForm(formData){
	$.each(formData,function(key,obj){
		alert(obj.name+"#"+obj.value);
		/*if(obj.name == "user_passwd" && tmp_userPasswd.length <32){
			obj.value=hex_md5(tmp_userPasswd);
		}*/
	})
}

/**
 * 参数表格
 * @param rows
 */
function editTable(rows){
	var $editTable = $('#tableArg');
    $editTable.datagrid({
      columns:[[
          {title: "参数", field: "dmaa_argu"}
        , {title: "英文名称", field: "dmaa_name_en"}
        , {title: "中文名称", field: "dmaa_name_zh"}
        , {title: "默认值", field: "dmaa_value"}
        , {title: "说明", field: "dmaa_desc"}
      ]]
      , edit: true
      , singleSelect:  true //false allow multi select
      , selectedClass: 'danger' //default: 'success'
      , selectChange: function(selected, rowIndex, rowData, $row) {
          //allow multi-select
          //console.log(selected, rowIndex, rowData, $row);
        }
    }).datagrid("loadData", {rows: rows});
}

//设置有效
function setStatus(algoId,isEnable){
	$.post("dmalgo/revStatus",{algoId:algoId,isEnable:isEnable},function(ret){
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
