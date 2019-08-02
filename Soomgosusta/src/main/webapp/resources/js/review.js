console.log("Review Module");

var reviewService = (function(){
	
	
	
	function add(review, callback, error){
		console.log("add review.................................");
		
		$.ajax({
			type : 'post',
			url : '/review/new',
			data : JSON.stringify(review),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	function getList(param, callback, error){
		console.log("getList...............")
		var e_Id = param.e_Id;
		var page = param.page || 1;
		alert("getList e_Id "+ e_Id);
		
		$.getJSON("/review/pages/"+e_Id+"/"+page+".json",
				function(data){
			if(callback){
				callback(data.reviewCnt, data.list);
			}
		}).fail(function(xhr, status,err){
			if(error){
				error();
			}
		});
	}
	
	function get(re_Seq, callback, error){
		alert(re_Seq);
		$.get("/review/"+re_Seq+ ".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status, err){
			if(error){
				error();
			}
		});
		
	}
	
	function remove(re_Seq, callback, error){
		
		$.ajax({
			type: 'Delete',
			url : '/review/'+ re_Seq,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(review, callback, error){
		
		console.log("수정할 re_seq: "+ review.re_Seq);
		$.ajax({
			type:'PUT',
			url : '/review/'+review.re_Seq,
			data : JSON.stringify(review),
			contentType : "application/json; charset=utf-8",
			success : function(result ,status, xhr){
				
				if(callback){
					alert("review update 성공 ");	
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					
					error(er);
					ALERT('review update 실패');
				}
			}
		});
	}
	
	function findMatch(param, callback, error){
		
		var m_Id = param.m_Id;
		var e_Id = param.e_Id;
		$.getJSON("/review/match/"+m_Id+"/"+e_Id+".json",
			function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}

	function getMember(m_Id, callback, error){
		console.log("getMember.................................");
		alert(m_Id);
		$.getJSON("/review/writer/"+m_Id+".json",
				function (data){
			if(callback){
				callback(data);
				alert(data.m_Name);
			}
		}).fail(function(xhr, status,err){
			if(error){
				error();
			}
		});
	}
	
	return {
		add:add,
		getList : getList,
		remove: remove,
		update: update,
		findMatch: findMatch,
		getMember:getMember,
		get:get
	};
})();