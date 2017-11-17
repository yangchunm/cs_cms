$(document).ready(function() {
	//显示TreeGrid
	$(".naviTree").treegrid();
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","navi/getNaviById/");
	doDel("#btn-del","navi/del");
	doSave("#add-form");
	//调整顺序，增加
	$(".glyphicon-triangle-bottom").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],1,arr_val[1],"navi/reOrder")
	});
	//调整顺序，减少
	$(".glyphicon-triangle-top").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],-1,arr_val[1],"navi/reOrder")
	});
	
});

//设置显示
function setIsShow(naviId,isShow){
	$.post("navi/revIsShow",{naviId:naviId,isShow:isShow},function(ret){
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

//设置后台
function setIsOut(naviId,isOut){
	$.post("navi/revIsOut",{naviId:naviId,isOut:isOut},function(ret){
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
