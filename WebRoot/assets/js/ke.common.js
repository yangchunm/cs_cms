
$(document).ready(function() {
	postPage();
	doSearch();
	$('.collapse').collapse();
});

/**
 *  采用问号挂参的方式，为 a 链接追加 returnUrl 参数
 */
function appendReturnUrl(target) {
	var returnUrl;
	var currentUrl = location.pathname;
	if (currentUrl.indexOf("/login") != 0 && currentUrl.indexOf("/reg") != 0) {
		returnUrl = "?returnUrl=" + currentUrl;
		var link = $(target);
		link.attr("href", link.attr("href") + returnUrl);
	}
}

/**
 * 退出登录
 */
function logout() {
	$.messager.confirm("确认提示", "确定要退出登录？", function() { 
		location.href = '/logout';
      });
}

/**
 * 得到所有的checkids
 * checkbox 的id 为check-开始
 */
function getCheckIds(){
	var ids =""; 
	$("input[id^='check-']").each(function() { 
		if($(this).is(":checked") == true)
			ids = ids + $(this).val()+",";
	});
	ids = ids.substr(0,ids.length-1);
	return ids;
}

/**
 * 显示树形结构，并进行选择
 * @returns
 */
function doTreeGrid(obj,attrPre){
	$(obj).treegrid({
        initialState:"collapsed"
    });
}

/**
 * 树形结构选择
 */
function doTreeCheck(attrPre){
	$("input[id^='"+attrPre+"check-']").click(function(){
		var arr_id = $(this).attr("id").split("-");
		var parentId = 0;
		if(arr_id.length == 2)
			parentId = arr_id[1];
		else if(arr_id.length == 3)
			parentId = arr_id[2];
		checkChild(parentId,attrPre);
	});
	
}

/**
 * 树形结构选择子项
 */
function checkChild(parentId,attrPre){
	$("input[id^='"+attrPre+"check-"+parentId+"-']").each(function(){
		if($(this).is(":checked"))
			$(this).prop("checked",false);
		else
			$(this).prop("checked",true);
		parentId = $(this).val();
		checkChild(parentId,attrPre);
	});
}

/**
 * 新增dialog
 */
function openAddDialog(obj){
	$(obj).click(function(){
		$("#frm_id").val(0);
		$("#add-form")[0].reset();
		$("#form-modal").modal("show");
	});
}

/**
 *修改dialog 
 */
function openModDialog(obj,getUrl){
	$(obj).click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		$("#modal-title").text("修改");
		$("#add-form")[0].reset();
		$.getJSON(getUrl+ids,
			function(rst) {
				var menu = rst;
				$.each(menu,function(key,value){
					var obj = "#frm_"+key;
					$(obj).val(value);
				})
				 $("#form-modal").modal("toggle");
		 	}
		 );
		 
	 });
}

/**
 * 删除
 */
function doDel(obj,delUrl){
	$(obj).click(function(){
		var ids =getCheckIds(); 
		if(ids == ""){
			$.messager.alert("提示","请选中要删除的记录！");
			return false;
		}else{
			 $.messager.confirm("提示","确定要删除该信息吗，删除后将不能恢复！",function(){
	    		 $.post(delUrl,{ids:ids},function(ret){
	    			 if(ret.isOk){
	    				 window.location.reload();
	    				 return ;
	    			 }
	    			 if(ret.isFail){
	    				 $.messager.alert("提示",ret.msg);
	    				 window.location.reload();
	    			 }
	    			  });
			 });
		}
	 });
}

/**
 * 保存表单
 */
function doSave(obj){
	$(obj).ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {      
			$("#add-form span").text("");
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
}

/**
 * 调整顺序
 * @param id
 * @param way
 * @param order
 */
function reOrder(id,way,order,url){
	$.post(url,{id:id,way:way,order:order},function(ret){
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

/**
 * 查询
 */
function doSearch(){
	$("#btn-search").click(function(){
		$("#page").val(1);
		$("#search-form").submit();
	});
}

/**
 * 分页链接以post方式提交
 */
function postPage(){
	$(".pagination > li > a").click(function(){
		$("#page").val($(this).attr("value"));
		$("#search-form").submit();
	});
}

/**
 * 对话框中的分页
 * @param totalRow
 * @param totalPage
 * @param page
 * @param url
 */
function miniPaginate(totalRow,totalPage,page,url,objId){
	var html = "<nav aria-label=\"...\">" +
			"<ul class=\"pager\">" +
			"<li>共计"+totalRow+"条，"+totalPage+"页，当前第"+page+"页</li>";
	if(totalPage >1 && page > 1)
		html +="<li><a href=\"#\" id=\"pagePre\" value=\""+(page-1)+"\">上一页</a></li>";
	if(totalPage != page && totalPage > 0)
		html += "<li><a href=\"#\" id=\"pageNext\" value=\""+(page+1)+"\">下一页</a></li>" ;
	html +="</ul></nav>";
	$(objId).empty().html(html);
}


