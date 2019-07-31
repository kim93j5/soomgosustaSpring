<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/cookie.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript">

partService.getPopular(function(list){
	console.log(list);
	
	$('#searchcontents').empty();
	var str = "<ul class='nav nav-pills nav-stacked'>";
	for(var i=0, len=10; i<len; i++){
		str += '<li class="nav-item"><a class="popularitems" href="#">'+list[i]+'</a></li>';
	}
	str += '</ul>';
	
	$('#searchcontents').append(str);
	
	$(document).on("click", ".popularitems", function(e){
		e.preventDefault();
		var data = $(this).html();
		
		location.href= "/request/listQNA/"+data;
	});
});

$(document).ready(function(){

	$('.largelist').hover(function(){
		$(this).css('border-style', 'groove');
	}, function(){
		$(this).css('border-style', 'outset');
	});
	
	$('.largelist').click(function(e){
		e.preventDefault();

		var data= $(this).find(".img").data("alt");
		
		partService.getPart(data, function(list){
			var str="";
			
			$('.modal-header').empty();
    	  	$('.modal-body').empty();
    	  	$('.modal-footer').empty();
			
    	  	$('.modal-header').append('<h4><strong>'+data+'</strong></h4>');
 			for(var i=0, len=list.length||0; i<len; i++){
		 		str += '<a href="/request/listQNA/'+list[i].p_S_Word+'">'+ list[i].p_S_Word + '</a>&nbsp;&nbsp;&nbsp;&nbsp;';
		 		if(i >=4 && (i+1) % 5 ==0) str+= '<br>';
		 	} 
			$('.modal-body').append(str);
			$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
			
			$('#modal').modal();
		});
		
	});
	
	$(document).on("click", ".part", function(event){

		var data = $(this).html();
		location.href= "/request/listQNA/"+data;			
	});
	
	$(document).ready(function(){
		var recent = new Array();
		$('#searchBtn').click(function(){
			var data = $('#searchKey').val();
			console.log(data);
			
 			setCookie(data, data, 3);
			location.href= "/request/listQNA/"+data;
		});

		$('#popular').click(function(e){
			e.preventDefault();
			
			partService.getPopular(function(list){
				
				$('#searchcontents').empty();
				var str = "<ul class='nav nav-pills nav-stacked'>";
				for(var i=0, len=10; i<len; i++){
					str += '<li class="nav-item"><a class="popularitems" href="#">'+list[i]+'</a></li>';
				}
				str += '</ul>';
				
				$('#searchcontents').append(str);
				
				$(document).on("click", ".popularitems", function(e){
					e.preventDefault();
					var data = $(this).html();
					
					location.href= "/request/listQNA/"+data;
				});
			});
		});
		
		$('#recent').click(function(e){
			e.preventDefault();
			
			$('#searchcontents').empty();
 			var recent = displayCookieList(); 
 			console.log(recent);
 			if(recent.length == 0){
				$('#searchcontents').append("최근 검색한 분야가 없습니다!");
			}else{
				var str = "<ul class='nav nav-pills nav-stacked'>";
				
				for(var c=recent.length-1, clen= 0; c>=clen; c--){
					str += '<li class="nav-item"><a class="recentitems" href="#">'+recent[c]+'</a></li>';
				}
				
				str += '</ul>';
				$('#searchcontents').append(str);
				
				$(document).on("click", ".recentitems", function(e){
					e.preventDefault();
					var data = $(this).html();
					
					location.href= "/request/listQNA/"+data;
				});
			}
 			
		});
		
		
	})
});


</script>


<title>Insert title here</title>
</head>
<body>

	<div id="search">
	 		<div id="mainImage" style="position: absolute; z-index: 1;">
				<img alt="메인1" src="/resources/images/photographer.jpg">
				<img alt="메인2" src="/resources/images/vocal.jpg">
				<img alt="메인3" src="/resources/images/teacher.jpg">
			</div>
	
		<div id="semi" style="padding-top: 60px;"><h2>딱! 맞는 고수를<br>소개해드립니다</h2>
 			<form id="searchform" method="get">
				<input id="searchKey" type="text" name="searchKey" size="30">
				<input id="searchBtn" type="button" value="고수 검색">
 			</form>
 			<div id="searchresults" style="display: none; z-index: 3;">
 				<div>
 					<ul role="tablist" class="nav nav-tabs" id="search-ul">
 						<li role="presentation" class="nav-item">
 							<a role="tab" aria-setsize="1" aria-posinset="1" target="_self" href="#"
 							 class="nav-link" id="popular">인기 키워드</a>
 						</li>
 						<li role="presentation" class="nav-item">
 							<a role="tab" tabindex="-1" aria-setsize="1" aria-posinset="2" target="_self" href="#"
 							 class="nav-link" id="recent">최근 검색한 서비스</a>
 						</li>
 					</ul>
 					<div id="searchcontents" style="height:220px; background: white; overflow-y: scroll;">
 					
 					</div>
 					<div id="footer">
 						<button id="divclose" type="button" class="btn btn-default" style="margin-left: 200px;">닫기</button>
 					</div>
 				</div>
 			</div>
 			

 			
 		</div>
 		
 		<div id="group" style="z-index: 2; position: absolute;">
				<div class="largelist"><img class="img" data-alt="레슨" src="/resources/images/lesson.JPG"><a class="part">레슨</a></div>
				<div class="largelist"><img class="img" data-alt="홈 리빙" src="/resources/images/homeliving.JPG"><a class="part">홈/리빙</a></div>
				<div class="largelist"><img class="img" data-alt="이벤트" src="/resources/images/event.JPG"><a class="part">이벤트</a></div>
				<div class="largelist"><img class="img" data-alt="디자인 개발" src="/resources/images/design.JPG"><a class="part">디자인/개발</a></div>
				<div class="largelist"><img class="img" data-alt="건강 미용" src="/resources/images/health.JPG"><a class="part">건강/미용</a></div>
			</div>
	</div>
	

	<div class="modal fade" id="modal">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header"></div>
            
            <div class="modal-body"></div>
            
            <div class="modal-footer">
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->


</body>
<%-- <footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer> --%>

</html>