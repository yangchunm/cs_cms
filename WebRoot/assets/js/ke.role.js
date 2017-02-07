$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid({
        initialState:"collapsed"
    });
	doTreeCheck("frm-");
	//新增dialog
	openAddDialog("#btn-add");
	doDel("#btn-del","role/del");
	doSave("#add-form");
	
	//修改dialog
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		$("#add-form")[0].reset();
		$("#modal-title").text("修改");
		$.getJSON("role/getRoleById/"+ids,
			function(rst) {
				var json = rst;
				$.each(json,function(key,value){
					var obj = "#frm_"+key;
					$(obj).val(value);
				})
				putChecbox(json.menuL);
				$("#form-modal").modal("toggle");
		 	}
		 );
		 
	 });
	
});

//修改时设置功能菜单
function putChecbox(json){
	$.each(json,function(n,e){
		var obj = "#frm-check-"+e.id;
		$(obj).attr("checked",true);
		$.each(e.subMenuL,function(sn,se){
			var sobj = "#frm-check-"+e.id+"-"+se.id;
			$(sobj).attr("checked",true);
		});
	});
}

