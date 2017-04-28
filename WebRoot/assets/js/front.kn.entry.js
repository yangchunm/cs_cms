$(document).ready(function() {
	loadRelEmge();
});

//查找相关的配方
function loadRelEmge(){
	$("#relEmge").hide();
	var knWord = $("#knWord").val();
	$.post("../findEmgeByKnWord",{knWord:knWord,topN:10},function(ret){
		 if(ret.isOk){
			 var html = "";
			 $.each(ret.emgeL,function(key,obj){
				 html += "<li><a href=\"../../em/"+obj.id+"\" title=\""+obj.emge_zh_name+"\">"+obj.emge_abbr_name+"</a></li>";
			 });
			 //alert(html);
			 $("#relEmgeL").empty().append(html);
			 $("#relEmge").show();
			 return ;
		 }
	});
}
