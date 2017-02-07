$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid({
        initialState:"collapsed"
    });
	doTreeCheck("");
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","kntree/getTreeById/");
	doDel("#btn-del","kntree/del");
	doSave("#add-form");
});


