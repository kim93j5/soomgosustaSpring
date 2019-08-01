$(document).ready(function(){

/*	$('#bestPopular').css('display', 'none');
	
	$('#best_btn').click(function(){
		$('#bestPopular').css('display', 'block');
		$('#recommend').css('display', 'none');
		$('#recommendService').css('display', 'none');
		$('#best_btn').css('background-color','#A0AFFF');
		$('#best_btn').css('border-color','#A0AFFF');
		$('#recommend_btn').css('background-color','#4a7bf8');
		$('#recommend_btn').css('border-color','#4a7bf8');

	});
	
	$('#recommend_btn').click(function(){
		$('#bestPopular').css('display', 'none');
		$('#recommend').css('display', 'block');
		$('#recommendService').css('display', 'block');
		$('#best_btn').css('background-color','#4a7bf8');
		$('#best_btn').css('border-color','#4a7bf8');
		$('#recommend_btn').css('background-color','#A0AFFF');
		$('#recommend_btn').css('border-color','#A0AFFF');
	});*/
	
   $('#recommend').slick({
  	  slidesToShow: 4,
  	  slidesToScroll: 1,
/*  	  autoplay: true,*/
  	  pauseOnHover:true,
  /*	  autoplaySpeed: 2000,*/
  });
   
   $('#bestPopular').slick({
	  	  slidesToShow: 4,
	  	  slidesToScroll: 1,
/*	  	  autoplay: true,
	  	  autoplaySpeed: 2000,*/
	      pauseOnHover:true,
	  });
	
			
});



	



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