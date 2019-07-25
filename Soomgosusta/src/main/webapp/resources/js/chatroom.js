console.log("chatroom Module");

var chatroomService = (function() {

	function getList(callback, error) {

		$.getJSON("/requests/chatlist" + ".json", function(data) {
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

		$.get("/requests/chatlist/" + seq + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	

	return {
		getList : getList,
		get : get

	};

})();