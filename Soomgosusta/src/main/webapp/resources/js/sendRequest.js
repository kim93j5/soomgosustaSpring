var requestService = (function(){
	function cancel(r_Seq, callback, error){
		$.ajax({
			type : 'get',
			url : '/requestStatus/cancel/' + r_Seq,
			success : function(cancelResult, status, xhr){
				if(callback){
					callback(cancelResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getList(m_Id, callback, error){
		$.getJSON("/requestStatus/getList/" + m_Id + ".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return {
	  getList : getList,
	  cancel : cancel
	};
})();