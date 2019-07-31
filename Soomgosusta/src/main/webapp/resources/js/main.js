var partService = (function(){
	function getPart(data, callback, error){
		console.log("getPart..............");
		
		$.getJSON("/partAJAX/listPart/"+data+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
		
	function getPopular(callback, error){
		console.log("getPopular..........");
		
		$.getJSON("/partAJAX/listPopular", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	return{
		getPart:getPart,
		getPopular:getPopular
	};
})();

$(document).ready(function(){
	$('#searchKey').on('focus', function(){
		$('#searchresults').show();
	})
	
	$('#divclose').on('click', function(){
		$('#searchresults').hide();
	})
})

