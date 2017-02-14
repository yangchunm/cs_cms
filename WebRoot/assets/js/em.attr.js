$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid({
        initialState:"collapsed"
    });
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","emattr/getAttrById/");
	doDel("#btn-del","emattr/del");
	doSave("#add-form");
});


