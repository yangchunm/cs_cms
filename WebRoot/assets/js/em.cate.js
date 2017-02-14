$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid();
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","emcate/getCateById/");
	doDel("#btn-del","emcate/del");
	doSave("#add-form");
});


