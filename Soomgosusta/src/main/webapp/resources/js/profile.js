console.log("Profile Module");

var profileService = (function(){
	
	
	function getProfile(param, callback, error){
		
		var e_Id = param.e_Id;
		$.getJSON("/expert/profile/"+e_Id+".json",function(data){
			if(callback){
				callback(data);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	function getFileList(param, callback, error){
		var e_Id= param.e_Id;
		$.getJSON("/expert/profile/files/"+e_Id+".json",function(data){
			if(callback){
				callback(data);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
		
	}
	function update(profile, callback, error){
		
		console.log("e_Id" + profile.e_Id);
		console.log(JSON.stringify(profile));
		$.ajax({
			type:'PUT',
			url : '/expert/profile/' + profile.e_Id,
			data : JSON.stringify(profile),
			contentType : "application/json; charset=utf-8",
			success : function(result ,status, xhr){
				
				$("#profileForm").load(" #profileForm");
				$("#profile-Dl").load(" #profile-Dl");
				$("#profile-Ol").load(" #profile-Ol");
				if(callback){
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
		getProfile : getProfile,
		update: update,
		getFileList:getFileList
	};
})();

