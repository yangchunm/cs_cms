$(document).ready(function() {
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","slide/getSlideById/");
	doDel("#btn-del","slide/del");
	doSave("#add-form");
	//调整顺序，增加
	$(".glyphicon-triangle-bottom").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],1,arr_val[1],"slide/reOrder")
	});
	//调整顺序，减少
	$(".glyphicon-triangle-top").click(function(){
		var arr_val = ($(this).attr("value")).split("-");
		reOrder(arr_val[0],-1,arr_val[1],"slide/reOrder")
	});
	
});


