$(document).ready(function() {
	
	
	//新增
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
	
	doDel("#btn-del","knentry/del");
	
	
	
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
	
	//以下为对话框事件
	//打开查找相关文件对话框
	$(".rela-file-check").click(function(){
		var type = $(this).attr("value");
		$("#modal-type").val(type);
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
	var postUrl = "";
	if(type == "file")
		postUrl = "findRelaFile";
	else if(type == "form")
		postUrl = "findRelaForm";
	else if(type == "mole")
		postUrl = "findRelaMole";
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
        ,selectChange: function(selected, rowIndex, rowData, $row) {
        	//alert(rowIndex+"##"+rowData+"@@"+$row);
            //console.log(selected, rowIndex, rowData, $row);
          }
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
        ,selectChange: function(selected, rowIndex, rowData, $row) {
        	//alert(rowIndex+"##"+rowData+"@@"+$row);
            //console.log(selected, rowIndex, rowData, $row);
          }

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
        ,selectChange: function(selected, rowIndex, rowData, $row) {
        	//alert(rowIndex+"##"+rowData+"@@"+$row);
            //console.log(selected, rowIndex, rowData, $row);
        }
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
	$(obj).html(html);
}
