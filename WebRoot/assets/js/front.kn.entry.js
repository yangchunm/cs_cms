$(document).ready(function() {
	loadRelEmge();
});

//查找相关的配方
function loadRelEmge(){
	var knWord = $("#knWord").val();
	$.post("../findEmgeByKnWord",{knWord:knWord,topN:10},function(ret){
		 if(ret.isOk){
			 //window.location.reload();
			 return ;
		 }
	});
}
