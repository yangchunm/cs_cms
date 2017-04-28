$(document).ready(function() {
	loadRelEmge();
});

//查找相关的配方
function loadRelEmge(){
	var knWord = $("#knWord").val();
	var currUrl = location.pathname;
	var urlPre = "";
	if(currUrl.indexOf("entry/")>=0)
		urlPre ="../";
	$.post(urlPre+"findEmgeByKnWord",{knWord:knWord,topN:10},function(ret){
		 if(ret.isOk){
			 var html = "";
			 $.each(ret.emgeL,function(key,obj){
				 html += "<li><a href=\"../../em/"+obj.id+"\" title=\""+obj.emge_zh_name+"\">"+obj.emge_abbr_name+"</a></li>";
			 });
			 //alert(html);
			 $("#relEmgeL").empty().append(html);
			 return ;
		 }else{
			 $("#relEmgeL").empty().append("未找到相关配方信息！");
		 }
	});
}
