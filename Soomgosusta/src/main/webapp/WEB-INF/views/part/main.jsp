<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
<script type="text/javascript">
$(document).ready(function(){
	$('.largelist').hover(function(){
		$(this).css('border-style', 'groove');
	}, function(){
		$(this).css('border-style', 'outset');
	});
	
	$('.largelist').click(function(e){
		e.preventDefault();

		var data= $(this).find("a").html();
		
		partService.getPart(data, function(list){
			var str="";
			
			$('.modal-header').empty();
    	  	$('.modal-body').empty();
    	  	$('.modal-footer').empty();
			
    	  	$('.modal-header').append('<h4><strong>'+data+'</strong></h4>');
 			for(var i=0, len=list.length||0; i<len; i++){
		 		str += '<a href="/part/listQNA/'+list[i].p_S_Word+'">'+ list[i].p_S_Word + '</a>&nbsp;&nbsp;&nbsp;&nbsp;';
		 		if(i >=4 && (i+1) % 5 ==0) str+= '<br>';
		 	} 
			$('.modal-body').append(str);
			$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
			
			$('#modal').modal();
		});
		
	});
	
	$(document).on("click", ".part", function(event){

		var data = $(this).html();
		location.href= "/part/listQNA/"+data;			
	});
	
	$(document).ready(function(){
		$('#searchBtn').click(function(){
			var data = $('#searchKey').val();
			location.href= "/part/listQNA/"+data;
		});
	})
});
/*     	$('document').ready(function(){
		var keylist = new Array();
		
		<c:forEach items= "${list}" var="list">
			keylist.push("${list.p_S_Word}");
		</c:forEach>
	
		$('#searchKey').autocomplete({
			source: keylist
		});	

	});

 */ 
</script>	

<title>Insert title here</title>
</head>
<body>
	<div id="search">
		<h2>딱! 맞는 고수를<br>소개해드립니다</h2>
 			<form method="get">
				<input id="searchKey" type="text" name="searchKey" size="30">
				<input id="searchBtn" type="button" value="고수 검색">
 			</form>
	</div>

	<div id="group">
		<div class="largelist"><img class="img" alt="레슨" src="/resources/images/lesson.JPG"><a class="part">레슨</a></div>
		<div class="largelist"><img class="img" alt="홈 리빙" src="/resources/images/homeliving.JPG"><a class="part">홈/리빙</a></div>
		<div class="largelist"><img class="img" alt="이벤트" src="/resources/images/event.JPG"><a class="part">이벤트</a></div>
		<div class="largelist"><img class="img" alt="디자인 개발" src="/resources/images/design.JPG"><a class="part">디자인/개발</a></div>
		<div class="largelist"><img class="img" alt="건강 미용" src="/resources/images/health.JPG"><a class="part">건강/미용</a></div>
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
<a href="/expertFind/listExpertFind">고수 찾기</a>
</body>
</html>