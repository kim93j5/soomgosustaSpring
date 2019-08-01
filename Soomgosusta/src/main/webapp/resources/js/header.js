var headerService= (function(){
	function getList(data, callback, error){
		console.log("getList........");
		
		$.getJSON("/part/listMExpert/"+ data.id+ ".json", function(result){
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
		getList:getList
	};
})();