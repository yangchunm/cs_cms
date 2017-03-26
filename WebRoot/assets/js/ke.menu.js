$(document).ready(function() {
	//显示TreeGrid
	$(".menuTree").treegrid();
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","menu/getMenuById/");
	//修改
	$(".menu-mod").click(function(){
		menuId = $(this).attr("value");
	});
	doDel("#btn-del","menu/del");
	doSave("#add-form");
	//调整顺序，增加
	$(".glyphicon-triangle-bottom").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],1,arr_val[1],"menu/reOrder")
	});
	//调整顺序，减少
	$(".glyphicon-triangle-top").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],-1,arr_val[1],"menu/reOrder")
	});
	
});
