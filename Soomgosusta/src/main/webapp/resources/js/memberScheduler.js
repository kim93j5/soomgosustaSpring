var scheduleService = (function(){
	
	function getList(data, callback, error){
		console.log("list schedule.............");
		console.log(data);
		console.log("--------------------------");
		
		$.getJSON("/memberSchedule/list/"+ data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		})
	}
	
	function get(data, callback, error){
		console.log("get schedule..........");
		console.log(data);
		console.log("----------------------");
		
		$.getJSON("/memberSchedule/detail/"+ data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		})
	}
	
	function register(data, callback, error){
		console.log("register faq..........");
		console.log(data);
		console.log("----------------------");
		
		$.ajax({
	 		type: 'post',
	 		url: '/memberSchedule/insert',
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				 if(callback){
					 callback(result);
				 }
		 	},
		 	error: function(result, status, xhr){
		 		if(error){
		 			error(er);
		 		}
		 	}
		});
	}
	function getFaq(data, callback, error){
		console.log("getFaq...........");
		console.log("data");
		console.log("=================");
		
		$.getJSON("/manageSchedule/getFaq/"+ data+".json", function(result){
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
		getList:getList,
		get:get,
		register:register,
		getFaq:getFaq
	}
})();