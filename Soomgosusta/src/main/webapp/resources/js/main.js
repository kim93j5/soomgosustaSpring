var partService = (function(){
	function getPart(data, callback, error){
		console.log("getPart..............");
		
		$.getJSON("/partAJAX/listPart/"+data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
		
	return{
		getPart:getPart
	};
})();

