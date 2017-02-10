
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

/**
 *  textarea 不要设置 margin 值，否则 IE 下的 scrollHeight 会包含该值，用外部嵌套div来布局
 * @param ele 必须是 textarea，并且在外部需要将 overflow 设置为 hidden
 * @param minHeight 最小高度值
 */
function autoHeight(ele, minHeight) {
	minHeight = minHeight || 16;
	// ele.style.height = minHeight + "px";
	if (ele.style.height) {
		ele.style.height = (parseInt(ele.style.height) - minHeight ) + "px";
	}
	ele.style.height = ele.scrollHeight + "px";

	// 返回了: 29  30 30，后两个始终比前一个大一个 px，经测试前都就是少了一个px的border-bottom
	// alert(ele.clientHeight + " : " +ele.scrollHeight + " : " + ele.offsetHeight);
	// 或许这个 currHeight 留着有点用
	// ele.currHeight = ele.style.height;
}

// 来自 git.oschina.net 项目首页，只支持自动增高，不支持减高
// textarea 自动调整高度，绑定 onkeyup="textAreaAdjustHeight(this);"
// git.oschina.net 的 issue 回复实现减高功能，但找不到代码
function textareaAdjustHeightOsc(textarea) {
	var adjustedHeight = textarea.clientHeight;
	adjustedHeight = Math.max(textarea.scrollHeight, adjustedHeight);
	if (adjustedHeight > textarea.clientHeight) {
		textarea.style.height = adjustedHeight + 'px';
	}
}



/**
 * ajax GET 请求封装，提供了一些默认参数
 */
function ajaxGet(url, options) {
	var defaultOptions = {
		type: "GET"
		, cache: false      // 经测试设置为 false 时，ajax 请求会自动追加一个参数 "&_=nnnnnnnnnnn"
		, dataType: "json"  // "json" "text" "html" "jsonp"，如果设置为"html"，其中的script会被执行
		// , data: {}
		// , timeout: 9000     // 毫秒
		// , beforeSend: function(XHR) {}
		, success: function(ret){
			if (ret.isOk) {
				alert(ret.msg ? ret.msg : "操作成功");
			} else {
				alert("操作失败：" + (ret.msg ? ret.msg : "请告知管理员！"));
			}
		}
		, error: function(XHR, msg) {
			showReplyErrorMsg(msg); // 默认调用
		}
		// , complete: function(XHR, msg){} // 请求成功与失败都调用
	};
	// 用户自定义参数覆盖掉默认参数
	for(var o in options) {
		defaultOptions[o] = options[o];
	}

	$.ajax(url, defaultOptions);
}

/**
 * 确认对话框层，点击确定才真正操作
 * @param msg 对话框的提示文字
 * @param actionUrl 点击确认后请求到的目标 url
 * @param options jquery $.ajax(...) 方法的 options 参数
 */
function confirmAjaxGet(msg, actionUrl, options) {
	layer.confirm(msg, {
		icon: 0
		, title:''                                      // 设置为空串时，title消失，并自动切换关闭按钮样式，比较好的体验
		, shade: 0.4
		, offset: "139px"
	}, function(index) {                                // 只有点确定后才会回调该方法
		// location.href = operationUrl;                // 操作是一个 GET 链接请求，并非 ajax
		// 替换上面的 location.href 操作，改造成 ajax 请求。后端用 renderJson 更方便，不需要知道 redirect 到哪里
		ajaxGet(actionUrl, options);
		layer.close(index);                             // 需要调用 layer.close(index) 才能关闭对话框
	});
}


