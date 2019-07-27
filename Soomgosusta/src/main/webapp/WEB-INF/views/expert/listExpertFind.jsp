<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/listExpertFind.js"></script>
<link rel="stylesheet" href="/resources/css/listExpertFind.css">
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
function clickBtn(){
	console.log($(this).data("id"));
}

$('document').ready(function(){
	
	function checkList(result){
		$('#exlist').empty();
		
		var str="";
		
		$(result).each(function(i, list){
			str += 	'<div class="expertInfo" data-id = "' + list.ef_Id +'">';
			str += '<img src="/resources/images/' + list.ef_Photo + '">';
			str += '<h3><a href="/main/mainPage" data-id="'+list.ef_Id+'">'+ list.ef_OL + '</a></h3>';
			str += '<div>'+list.ef_RC+'회 고용<strong>*</strong>'+ list.ef_District+'</div>';
			str +=	'<div>'+list.ef_AvgStarpoint+'('+list.ef_CntReview+'개)</div><br><br><br><br>';
				
		})
		$('#exlist').append(str);
	}
	
	
	expertFindService.getList({sido:"지역 전체", gugun:"전체", ser: "분야 전체", serviceInfo:"전체"}, function(result){
		checkList(result);
	});
	
	$('#service').change(function(){
		
		var sido = $('#sido').val();
		var gugun = $('#gugun').val();
		var service = $('#service').val();
		var serviceInfo = $('#serviceInfo').val();
		
		expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo}, function(result){
			for(var i=0, len= result.length||0; i<len; i++){
				console.log(result[i]);
			}
			
			checkList(result);
		});
	})
	
	$('#serviceInfo').change(function(){
		
		var sido = $('#sido').val();
		var gugun = $('#gugun').val();
		var service = $('#service').val();
		var serviceInfo = $('#serviceInfo').val();
		
		expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo}, function(result){
			for(var i=0, len= result.length||0; i<len; i++){
				console.log(result[i]);
			}
			
			checkList(result);
		});
	});
	
	$('#gugun').change(function(){

		var sido = $('#sido').val();
		var gugun = $('#gugun').val();
		var service = $('#service').val();
		var serviceInfo = $('#serviceInfo').val();
		
		expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo}, function(result){
			for(var i=0, len= result.length||0; i<len; i++){
				console.log(result[i]);
			}
			
			checkList(result);

		});
		

	});
	
	$('#sido').change(function(){
		
		var sido = $('#sido').val();
		var gugun = $('#gugun').val();
		var service = $('#service').val();
		var serviceInfo = $('#serviceInfo').val();
		
		expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo}, function(result){
			for(var i=0, len= result.length||0; i<len; i++){
				console.log(result[i]);
			}
			
			checkList(result);
		});
	});
});
	

</script>
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="info">
			<h2>고수 찾기</h2>

			<div id="district_select">
					<h3>우리 지역의 숨은 고수는 누구일까요?</h3>
					<div id="sel_d">
						지역 선택<br> 
						<select name="sido" id="sido"></select> 
						<select name="gugun" id="gugun" style="display: none"></select>
					</div>

					<div id="sel_s">
						서비스 선택<br> 
						<select name="service" id="service"></select> 
						<select	name="serviceInfo" id="serviceInfo" style="display: none"></select>
					</div>
			</div>
		</div>

		<div id="exlist">

		</div>
	</div>
</body>
</html>