$(document).ready(function() {
	$("#frm_knen_text_plain").hide();
	
	//新增按钮
	$("#btn-add").click(function(){
		window.location = "knentry/add";
	});

	//修改
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		window.location = "knentry/edit/"+ids;
	 });
	//修改页面加载附加文件信息
	var entrId = $("#frm_id").val();
	if(entrId > 0){
		
	}
	
	//删除
	doDel("#btn-del","knentry/del");
	
	//编辑语法切换
	$("#frm_knen_text_type").change(function(){
		var textType =$("#frm_knen_text_type option:selected").val();
		if(textType == "HTML"){
			$("#frm_knen_text_plain").hide();
			$("#frm_knen_text").show();
		}else{
			$("#frm_knen_text_plain").show();
			$("#frm_knen_text").hide();
		}
	});
	
	//显示历史文本
	$("#frm_knen_history").change(function(){
		var knehId =$("#frm_knen_history option:selected").val();
		if(knehId > 0){
			$.get("../../knhistory/findByKnehId/"+knehId,function(ret){
				 if(ret.isOk){
					 var ue = UE.getEditor("frm_knen_text");
					 ue.setContent(ret.kneh.kneh_text);
					 //$("#frm_knen_text").empty().text(ret.kneh.kneh_text);
					 $("#frm_knen_text_plain").empty().text(ret.kneh.kneh_text);
					 return ;
				 }
				  });
			}
	});
	
	//词条表单保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {   
			$("#add-form span").text("");
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
	
	//以下为上传对话框事件
	$("#modal-file-add").click(function(){
		$("#frm_knfi_ename").val($("#frm_knen_name").val());
		$("#frm_knfi_kntr_id").val($("#frm_knen_kntr_id").val());
		$("#frm_knfi_tag").val($("#frm_knen_tag").val());
		$("#form-modal-file-add").modal("show");
	});
	$("#modal-mole-add").click(function(){
		$("#frm_knmo_ename").val($("#frm_knmo_name").val());
		$("#frm_knmo_kntr_id").val($("#frm_knmo_kntr_id").val());
		$("#frm_knmo_tag").val($("#frm_knmo_tag").val());
		$("#form-modal-mole-add").modal("show");
	});
	
	//上传文件表单保存
	$("#file-add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) { 
			var flag = true;
			$.each(formData,function(key,obj){
				if(obj.name != "knfi_file" && obj.value == ""){
					flag = false;
					$.messager.alert("提示","每一项必须填写！");
					return false;
				}
			});
			return flag;
		}
		, success: function(ret) {
			if(ret.isOk) {
				renderCheckList("file",ret.file);
				$("#form-modal-file-add").modal("hide");
			}
			if (ret.isFail) {
				$.messager.alert("提示",ret.msg);
				return ;
			}
		}
	});
	
	//添加分子式表单保存
	$("#mole-add-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {      
			var flag = true;
			$.each(formData,function(key,obj){
				if(obj.name != "knmo_file" && obj.value == ""){
					flag = false;
					$.messager.alert("提示","每一项必须填写！");
					return false;
				}
			});
			return flag;
		}
		, success: function(ret) {
			if(ret.isOk) {
				renderCheckList("mole",ret.file);
				$("#form-modal-mole-add").modal("hide");
			}
			if (ret.isFail) {
				$.messager.alert("提示",ret.msg);
				return ;
			}
		}
	});
	
	//以下为选择对话框事件
	//打开查找相关文件对话框
	$(".rela-file-check").click(function(){
		var type = $(this).attr("value");
		$("#modal-type").val(type);
		$("#frm_knfi_keyword").val($("#frm_knen_tag").val());
		var postUrl = checkType(type);
		findRelaFile("#frm_knen_tag",postUrl,1,5,type);
		$("#file-list-modal").modal("show");
	});
	$("#frm-rela-file-btn").click(function(){
		var type = $("#modal-type").val();
		var postUrl = checkType(type);
		findRelaFile("#frm_knfi_keyword",postUrl,1,5,type);
	});	
	
	//上一页、下一页
	$(document).on("click","#pagePre",function(){
		var page = $(this).attr("value");
		var type = $("#modal-type").val();
		var postUrl = checkType(type);
		findRelaFile("#frm_knfi_keyword",postUrl,page,5,type);
	});
	$(document).on("click","#pageNext",function(){
		var page = $(this).attr("value");
		var type = $("#modal-type").val();
		var postUrl = checkType(type);
		findRelaFile("#frm_knfi_keyword",postUrl,page,5,type);
	});
	
	//显示选择的内容
	$("#file-check-down").click(function(){
		var type = $("#modal-type").val();
		var $table = $("#file-list");
		var checkList = $table.datagrid("getSelections");
		if(checkList == ""){
			$.messager.alert("提示","请点击选择要使用的文件。");
			return false;
		}else
			renderCheckList(type,checkList)
	});
	
});

function checkType(type){
	var enId = $("#frm_id").val();
	var strPre = "";
	if(enId >0)
		strPre ="../";
	var postUrl = "";
	if(type == "file")
		postUrl = strPre+"findRelaFile";
	else if(type == "form")
		postUrl = strPre+"findRelaForm";
	else if(type == "mole")
		postUrl = strPre+"findRelaMole";
	return postUrl;
}

function findRelaFile(enTagsObj,postUrl,page,pageSize,type){
	var enTags = $(enTagsObj).val();
	var page = page;
	var pageSize = pageSize;
	$.post(postUrl,{
		kntrId : 0 ,
		enTags : enTags ,
		page : page ,
		pageSize : pageSize
	},function(ret){
		if(type == "file")
			renderFileTable(ret.list);
		else if(type == "form")
			renderFormTable(ret.list);
		else if(type == "mole")
			renderMoleTable(ret.list);
		var pObj = "#file-paginate";
		miniPaginate(ret.totalRow,ret.totalPage,ret.pageNumber,postUrl,pObj);
	});
}

//渲染文件表格
function renderFileTable(rows){
	var $table = $("#file-list");
	$table.empty();
	$table .datagrid({
        columns:[[
                  {title: "id", field: "id"},
                  {title: "文件名", field: "knfi_ename"},
                  {title: "类型", field: "knfi_type"}
                  ]]
		,singleSelect:  false //false allow multi select
        ,selectedClass: 'danger' //default: 'success'
    }).datagrid("loadData", {rows: rows});
}

//渲染公式表格
function renderFormTable(rows){
	var $table = $("#file-list");
	$table.empty();
	$table .datagrid({
        columns:[[
                  {title: "id", field: "id"},
                  {title: "文件名", field: "knfo_name"},
                  {title: "标签", field: "knfo_tag"}
                  ]]
		,singleSelect:  false //false allow multi select
        ,selectedClass: 'danger' //default: 'success'
    }).datagrid("loadData", {rows: rows});
}

//渲染分子式表格
function renderMoleTable(rows){
	var $table = $("#file-list");
	$table.empty();
	$table.datagrid({
        columns:[[
                  {title: "id", field: "id"},
                  {title: "名称", field: "knmo_name"},
                  {title: "标签", field: "knmo_tag"}
                  ]]
		,singleSelect:  false //false allow multi select
        ,selectedClass: 'danger' //default: 'success'
    }).datagrid("loadData", {rows: rows});
}

//显示已选择的内容
function renderCheckList(type,checkList){
	var html = "";
	var nameStr = "";
	var checkListId = "";
	if(type == "file")
		nameStr = "knfi_ename";
	if(type == "form")
		nameStr = "knfo_name";
	if(type == "mole")
		nameStr = "knmo_name";
	$.each(checkList,function(index,entry){
		html += "<input type=\"checkbox\" checked name=\"kn_"+type+"_list\"";
		var valuestr = "";
		var checkText = "";
		$.each(entry,function(key,value){
			if(key == "id")
				valuestr = " value=\""+value+"\">";
			if(key == nameStr)
				checkText = value + "<br />";
		});
		html += valuestr + checkText;
	});
	var obj = "#knen_"+type+"_list";
	$(obj).append(html);
}

//设置状态
function setEntryStatus(entrId,currStatus){
	$.post("knentry/setEntryStatus",{entrId:entrId,entrStatus:currStatus},function(ret){
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
