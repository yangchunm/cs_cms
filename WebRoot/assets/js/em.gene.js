$(document).ready(function() {
	
	//新增按钮
	$("#btn-add").click(function(){
		window.location = "emgene/add";
	});

	//修改
	$("#btn-mod").click(function(){
		var ids =getCheckIds();
		if(ids == "" || ids.split(",").length > 1){
			$.messager.alert("提示","请选中要修改的一条信息！");
			return ;
		}
		window.location = "emgene/edit/"+ids;
	 });
	
	//删除
	doDel("#btn-del","emgene/del");	
	
	//表单保存
	$("#add-form").ajaxForm({
		dataType: "json"
		, success: function(ret) {
			if(ret.isOk) {
				$("#geneId").val(ret.gene.id);
				$.messager.alert("提示","配方信息保存成功，请在右边添加配方的属性信息！<strong>添加期间，不能刷新页面！</strong>");
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
	
	//单个属性保存，当文本框失去焦点时执行
	$(".attr_add").blur(function(){
		var attrIds = $(this).attr("id");
		var attrId = attrIds.split("-")[2];
		var geneId = $("#geneId").val();
		var attrVal = $(this).val();
		if(geneId == 0){
			$.messager.alert("提示","不能保存属性信息，请先填写左边的配方信息，当配方信息保存成功后再编辑属性信息！");
			return false;
		}
		if(attrVal == ""){
			return false;
		}
		//开始保存
		$.post("saveAttr",
				{
					emge_id : geneId,
					emat_id : attrId,
					emga_value : attrVal
				},
				function(ret){
					if(ret.isOk){
						var obj = "#"+attrIds+"-msg";
						alert(obj);
						$(obj).addClass("display","inline-block");
					}
				});
		
	});
});
