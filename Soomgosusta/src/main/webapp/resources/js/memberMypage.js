var mypageService = (function(){
	function checkPW(m_Id,nowPassword,callback,error){
		console.log(m_Id);
		console.log(nowPassword);
		var data = {m_Id : m_Id,nowPassword : nowPassword};
		$.ajax({
			type:'PUT',
			url: '/member/mypage',
			contentType:"json",
			data: data,
			success: function(result){
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
		
	}
	return {
		checkPW : checkPW
	};
})();