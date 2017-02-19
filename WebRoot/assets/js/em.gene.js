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
				//$("#frm_id").val(ret.gene.id);
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
		var postUrl = "saveAttr";
		var isMod = $("#frm_id").val();
		if(isMod > 0)
			postUrl = "../"+postUrl;
		$.post(postUrl,
				{
					emge_id : geneId,
					emat_id : attrId,
					emga_value : attrVal
				},
				function(ret){
					if(ret.isOk){
						var obj = "#"+attrIds+"-msg";
						$(obj).empty().text("v");
					}
				});
	});
	
	//图片数据文件上传对话框
	$(".attr_add_modal").click(function(){
		var attrIds = $(this).attr("value").split("-");
		var attrVal = $(this).attr("data");
		var attrId = attrIds[0];
		var attrType = attrIds[1];
		var emgaId = 0;
		if(attrIds.length == 3)
			emgaId = attrIds[2];
		if(emgaId == "")
			emgaId = 0;
		var geneId = $("#geneId").val();
		if(geneId == 0){
			$.messager.alert("提示","请先填写左边的配方信息，当配方信息保存成功后再编辑属性信息！");
			return false;
		}
		$("#geat_emge_id").val(geneId);
		$("#geat_emat_id").val(attrId);
		$("#geat_id").val(emgaId);
		$("#attr-data").val(attrVal);
		$("#modal-type").val(attrType);
		if(attrType == 3){
			$("#attr-data").hide();
			$("#attr-file").show();
		}else{
			$("#attr-data").show();
			$("#attr-file").hide();
		}
		$("#file-text-modal").modal("show");
	});
	
	//属性对话框保存
	$("#file-add-form").ajaxForm({
		dataType: "json"
		, success: function(ret) {
			if(ret.isOk) {
				var obj = "#em-attr-"+ret.emga.emat_id+"-msg";
				//alert(obj);
				$(obj).text(ret.emga.emga_value);
				$("#file-text-modal").modal("hide");
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
	
	//导入对话框
	$("#btn-import").click(function(){
		$("#load-img").hide();
		$("#file-import-modal").modal("show");
	});
	//下载样例
	$("#downsample").click(function(){
		$.get("emgene/sampledown",function(ret){
			if(ret.isOk){
				window.location.href=ret.msg;
				return ;
			}
			if (ret.isFail) {
				$.messager.alert("提示",ret.msg);
				return ;
			}
		});
	});
	
	//配方数据导入保存
	$("#file-import-form").ajaxForm({
		dataType: "json"
		, beforeSubmit: function(formData, jqForm, options) {   
			$("#load-img").show();
		}
		, success: function(ret) {
			if(ret.isOk) {
				$("#load-img").hide();
				var html = "";
				$.each(ret.msg,function(key,val){
					html += val+"<br>";
				});
				$("#import-msg").empty().append(html);
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
});
