var memberAddInfoService = (function(){
	function getMWords(LWord, callback,error){
		/*$.getJSON("/member/addInfo/"+LWord+".json",function(data){
			if(callback){
				callback(data);
			}
		});*/
		 
		console.log("mmmmmmmmmmmm"+LWord);
		$.ajax({
			type : 'get',
			url : '/member/addInfo/'+LWord,
			data : JSON.stringify(LWord),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
		
	}
	
	function getSWords(LWord, MWord, callback,error){
		console.log(LWord);
		console.log(MWord);
		$.ajax({
			type : 'get',
			url : '/member/addInfo/'+LWord+"/"+MWord,
			data : JSON.stringify(MWord),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
		
	}
	
	return {
		getMWords : getMWords,
		getSWords : getSWords
	};
})();