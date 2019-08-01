var scheduleService = (function(){
	
	function insert(data, callback, error){
		console.log("insert schedule............");
		console.log(data);
		console.log("---------------------------");
		
	 	$.ajax({
	 		type: 'post',
	 		url: '/manageSchedule/insert',
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
	
	function getList(data, callback, error){
		console.log("list schedule.............");
		console.log(data);
		console.log("--------------------------");
		
		$.getJSON("/manageSchedule/list/"+ data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		})
	}

	function remove(data, callback, error){
		console.log("delete schedule...........");
		console.log(data);
		console.log("--------------------------");
		
		$.ajax({
			type: 'delete',
			url: '/manageSchedule/remove/'+data,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function get(data, callback, error){
		console.log("get schedule.........");
		console.log(data);
		console.log("---------------------");
		
		$.get("/manageSchedule/get/" + data + '.json', function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getCount(data,callback, error){
		
		$.get("/manageSchedule/getCount/" + data + '.json', function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function modify(schedule, callback, error){
		console.log("modify schedule..........");
		console.log(schedule.s_Seq);
		console.log("==========================");
		
		$.ajax({
			type: 'put',
			url: '/manageSchedule/modify/'+schedule.s_Seq,
			data: JSON.stringify(schedule),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
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
	
	function insertReply(data, callback, error){
		console.log("insert reply............");
		console.log(data);
		console.log("---------------------------");
		
	 	$.ajax({
	 		type: 'post',
	 		url: '/manageSchedule/insertReply',
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
	
	function modifyMatch(data, callback, error){
		console.log("modify Match..........");
		console.log(data);
		console.log("==========================");
		
		$.ajax({
			type: 'put',
			url: '/manageSchedule/modifyMatch/'+data.e_Id+'/'+data.m_Id+'/'+data.p_Seq,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return{
		insert:insert,
		getList:getList,
		remove:remove,
		get:get,
		getCount:getCount,
		modify:modify,
		getFaq:getFaq,
		insertReply:insertReply,
		modifyMatch:modifyMatch
	};
})();


