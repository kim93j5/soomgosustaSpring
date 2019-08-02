console.log("chatroom Module");

var chatroomService = (function() {

	function getList(name, callback, error) {

		$.getJSON("/requests/chatlist/" + name + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function getMemberChatList(name, callback, error) {

		$.getJSON("/requestStatus/chatlist/" + name + ".json", function(data) {
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
		getMemberChatList : getMemberChatList,
		get : get

	};

})();