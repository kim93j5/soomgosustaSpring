console.log("Review Module");

var reviewService = (function(){
	
	
	
	function add(review, callback, error){
		console.log("add review.................................");
		
		$.ajax({
			type : 'post',
			url : '/review/new',
			data : JSON.stringify(review),
			contentType: "application/json; charset=utf-8",
			seccess: function(result, status, xht){
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
		
		var e_Id = param.e_Id;
		var page = param.page || 1;
		alert("getList e_Id "+ e_Id);
		
		$.getJSON("/review/pages/"+e_Id+"/"+page+".json",
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status,err){
			if(error){
				error();
			}
		});
	}
	
	
	function remove(re_seq, callback, error){
		
		$.ajax({
			type: 'delete',
			url : '/review/'+ re_seq,
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
	
	return {
		add:add,
		getList : getList,
		remove: remove,
		update: update
		
	};
})();