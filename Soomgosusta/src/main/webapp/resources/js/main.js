var partService = (function(){
	function getPart(data, callback, error){
		console.log("getPart..............");
		
		$.getJSON("/part/listPart/"+data+".json", function(result){
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
		
		$.getJSON("/part/listPopular", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getRecommend(data, callback, error){
		console.log("getRecommend.........");
		
		$.getJSON("/part/listMyRecommend/"+ data.id + "/" + data.divide + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	function getDistrict(data, callback, error){
		console.log("getDistrict.........");
		
		$.getJSON("/part/listMyDistrict/"+ data.id + "/" + data.divide + ".json", function(result){
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
		getPopular:getPopular,
		getRecommend:getRecommend,
		getDistrict:getDistrict
	};
})();

$(document).ready(function(){
	$('#searchKey').on('focus', function(){
		$('#searchresults').show();
	})
	
	$('#divclose').on('click', function(){
		$('#searchresults').hide();
	})
	
	$('.recommend').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		autoplay: true,
		pauseOnHover: true,
		autoplaySpeed: 3000,
	});
})

