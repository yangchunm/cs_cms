$(document).ready(function() {
	//新增dialog
	openAddDialog("#btn-add");
	openModDialog("#btn-mod","dmcate/getAlgoCateById/");
	doDel("#btn-del","dmcate/del");
	doSave("#add-form");
	
});


