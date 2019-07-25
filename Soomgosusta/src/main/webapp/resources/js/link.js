console.log("link Module");

var linkService = (function() {

	function getList(callback, error) {

		$.getJSON("/requests/receive" + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function get(seq, callback, error) {

		$.get("/requests/receive/" + seq + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function updateEnter(link, callback, error) {

		$.ajax({
			type : 'put',
			url : '/requests/receive/en/' + link.l_Seq,
			data : JSON.stringify(link),
			contentType : "application/json; charset = utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(seq, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/requests/receive/' +seq,
			success : function(deleteResult,status,xhr){
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
	
	return {
		getList : getList,
		get : get,
		updateEnter : updateEnter,
		remove : remove
	};

})();