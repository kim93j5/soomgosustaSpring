var service = (function(){
	function getList(data, callback, error){
		console.log("list schedule.............");
		console.log(data);
		console.log("--------------------------");
		
		$.getJSON("/memberSchedule/listExpert/"+ data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		})
	}
	return{
		getList:getList
	};
	
})();