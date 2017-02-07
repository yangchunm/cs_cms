$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid();
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","organ/getOrganById/");
	doDel("#btn-del","organ/del");
	doSave("#add-form");
});


