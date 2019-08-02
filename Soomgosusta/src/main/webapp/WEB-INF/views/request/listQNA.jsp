<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/plugin/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/plugin/jquery-ui-1.12.1.custom/jquery-ui.css">
<script type="text/javascript" src="/resources/js/listQNA.js"></script>
<link rel="stylesheet" href="/resources/css/listQNA.css">
<script type="text/javascript">
$(document).ready(function(){
	 $('#date').datepicker({
		 dateFormat: "yy-mm-dd",
		 language: "kr",
		 onSelect: function(dateText, inst){
			 $('#pick').val($(this).val());
		 }
	 }); 
	
	 
	$("input:radio[name=date]").change(function(){

		if($("input:radio[id=selectDay]").is(':checked') == true){
			$('#pick').val("");
			$('#date').show();
			$('#pick').attr("disabled", false);
		}else{
			$('#date').hide();
			$('#pick').val("날짜를 선택하세요");
			$('#pick').attr("disabled", true);
		}
	});
	
	$(document).on("click", ".prev", function(event){
		event.preventDefault();
		
		$('.slide').animate({
			marginLeft : parseInt($('.slide').css('marginLeft'))  + 460
		}, 'slow');

	});
	
	$(document).on("click", ".next", function(event){
		event.preventDefault();
		
		$('.slide').animate({
			marginLeft : parseInt($('.slide').css('marginLeft'))  - 460
		}, 'slow');
	});
})

var data= '<c:out value="${searchKey}"/>';
partService.getQNA(data, function(list){
	console.log(list);
	if(list.size == 0){
		$('#container').empty();
		$('#container').append("검색 결과가 없습니다.");
	}else{
		$('#dimmed').css({'background': 'url(/resources/images/eventbn.JPG)'});
		var dim="";
		dim += '<h1>' + list.searchPart.p_S_Word + '</h1>';
		dim += '<p>요청서 작성에 단 1분! 지금 바로 고수님을 찾아드려요.</p>';
		$('#dimmed').append(dim);
		
		var str="";

		str += '<input type="hidden" name="p_Seq" value="'+ list.searchPart.p_Seq + '">';
		str += '<input type="hidden" name="p_S_Word" value="'+ list.searchPart.p_S_Word +'">';
		str += '<div class="requestList"><h2>"'+ list.searchPart.p_S_Word + '"<br>고수를 소개받기 위한<br>몇가지 질문에 답해주세요!</h2>';
	      str += '<div class="btn"><a href="#" class="next">다음</a></div></div>';
		for(var i=0, len=list.listQ.length||0; i<len; i++){
			str += '<input type=hidden name="listQ_seq" value="'+ list.listQ[i].q_Seq+'">';
			str += '<div class="requestList">';
			str += '<div class="h"><h4>'+ list.listQ[i].q_Contents + '</h4></div>';
			str += '<ul>';
			for(var j=0, len2=list.listA.length||0; j<len2; j++){
				if(list.listQ[i].q_Seq == list.listA[j].q_Seq){
					str += '<li class="answer"><div class="b"><label><input type="checkbox" name="listA_seq" value="'+ list.listA[j].a_Seq + '">';
					str += list.listA[j].a_Contents+'</label></div></li>';
				}
			}
			str += '</ul>';
			str += '<div class="btn"><a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#" class="next">다음</a></div>';
			str += '</div>';

		}
			
		$('.slide').prepend(str);
	}
})

</script>
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
label{
  height: 21px;
  font-size: 15px;
/*   margin: 0px, 0px, -6px; */
  margin-left: 2px;
  font-family: 'Nanum Gothic Coding', monospace;
}


.h h4{
	padding-bottom: 10px;
	font-family: 'Nanum Gothic Coding', monospace;
}

.h{
	margin-left: 50px;
}
li{
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 15px;
    color: #4d4d4d;
    border-left: 0;
    border-right: 0;
    padding-left: 0px;
    list-style: none;
     width: 300px;
    border: 1px solid #ddd;
    position: relative;
    display: block;
    margin-bottom: 0px;
    background-color: #fff;
}
.b{
	width: 300px;
	padding: 10px;
}
</style>
</head>
<body style="background-color: #fafafa;">

		<div id="container">
			<div id="dimmed"></div>
			<div id="listForm">
				<form id="form" action="/request/detailRequest" method="post">
					<c:if test="${loginUser.user_Divide == 'member'}">
						<input type="hidden" name="id" value="${loginUser.m_Id }">				
					</c:if>
					<div class="slide">
						<div class="requestList">
							&nbsp;&nbsp;5개 남았습니다!
							<div class="h"><h4>희망하는 시간대는 언제인가요?</h4></div>
							<ul>
								<li><div class="b"><label><input type="checkbox" name="time" value="아침(9시 이전)">아침 (9시 이전)</label></div></li>
								<li><div class="b"><label><input type="checkbox" name="time" value="오전(9시-12시)">오전 (9시-12시)</label></div></li>
								<li><div class="b"><label><input type="checkbox" name="time" value="이른 오후(12시-3시)">이른 오후 (12시-3시)</label></div></li>
								<li><div class="b"><label><input type="checkbox" name="time" value="오후(3시-6시)">오후 (3시-6시)</label></div></li>
								<li><div class="b"><label><input type="checkbox" name="time" value="저녁(6시-9시)">저녁 (6시-9시)</label></div></li>
								<li><div class="b"><label><input type="checkbox" name="time" value="늦은 저녁(9시 이후)">늦은 저녁 (9시 이후)</label></div></li>
							</ul>
								
							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#"
									class="next">다음</a>
							</div>

						</div>


						<div class="requestList">
							&nbsp;&nbsp;4개 남았습니다!
							<div class="h"><h4>언제부터 시작하기 원하시나요?</h4></div>
							<ul>
								<li><div class="b"><label><input type="radio" name="date" value="협의 가능해요">협의 가능해요</label></div></li>
								<li><div class="b"><label><input type="radio" name="date" value="일주일 이내면 돼요">일주일 이내면 돼요</label></div></li>
								<li><div class="b"><label><input type="radio" name="date" value="가능한 빨리 하고 싶어요">가능한 빨리 하고 싶어요</label></div></li>
								<li><div class="b"><label><input type="radio" name="date" id="selectDay" value="원하는 날짜가 있어요">원하는 날짜가 있어요</label><br>
									<input type="text" name="selday" id="pick" size="20" value="날짜를 선택하세요" style="margin-left: 10px; font-size: 10px;" disabled>
									<div id="date" style="display:none;"></div></div>
								</li>
							</ul>

							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; 
								<a href="#"	class="next">다음</a>
							</div>

						</div>

						<div class="requestList">
							&nbsp;&nbsp;3개 남았습니다!
							<div class="h"><h4>선호하는 고수 성별이 있나요?</h4></div>
							<ul>
								<li><div class="b"><label><input type="radio" name="gen" value="남자">남자</label></div></li>
								<li><div class="b"><label><input type="radio" name="gen" value="여자">여자</label></div></li>
								<li><div class="b"><label><input type="radio" name="gen" value="무관">무관</label></div></li>
							</ul>

							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#"
									class="next">다음</a>
							</div>

						</div>

						<div class="requestList">
							&nbsp;&nbsp;2개 남았습니다!
							<div class="h"><h4>선호 지역을 선택하세요</h4></div>
							<div id="dist1">
								&nbsp;&nbsp;<select name="sido" id="sido1">
								</select> <select name="gugun" id="gugun1">
									<option>군/구 선택</option>
								</select> <br>

							</div>
							<div id="dist2" style="display: none">
								<select name="sido" id="sido2">
								</select> <select name="gugun" id="gugun2">
									<option>군/구 선택</option>
								</select> <br>
							</div>
							<div id="dist3" style="display: none">
								<select name="sido" id="sido3">
								</select> <select name="gugun" id="gugun3">
									<option>군/구 선택</option>
								</select> <br>
							</div>
							<br> <a id="plus" href="">추가 선택</a> <a id="minus" href="">삭제</a>

							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#"
									class="next">다음</a>
							</div>

						</div>
						<div class="requestList">
							&nbsp;&nbsp;마지막 질문입니다!
							<div class="h"><h4>전화번호를 입력하세요<br></h4></div>
							<c:choose>
								<c:when test="${loginUser.user_Divide != null }">
									<c:if test="${loginUser.user_Divide =='expert'}">
										<div id="submit_btn">
											<h5>회원으로 로그인 시 요청 가능합니다!</h5>
											<a href="#" class="prev">이전</a>&nbsp;&nbsp; 
											<input type="submit" id="go" value="매칭요청" disabled>
										</div>
									</c:if>
												
									<c:if test="${loginUser.user_Divide =='member'}">
										<div id="submit_btn">
											<input type="text" id="telForm" name="phoneNum" size="30" style="padding:5px;"><br>
											<a href="#" class="prev">이전</a>&nbsp;&nbsp; 
											<input type="submit" id="submitbtn" value="매칭요청">
										</div>
 									</c:if>
								</c:when>
								<c:otherwise>
										<h5>로그인 시 요청 가능합니다!</h5>
										<a href="#" class="prev">이전</a>&nbsp;&nbsp; 
								</c:otherwise>	
							</c:choose>
						</div>
					</div> 
			</form>		
			</div>
			<div id="notice">
				<h3>숨고 사용 팁</h3>
				<p style="font-size: 15px;">다음 몇가지 질문에 답변해주시면, 고수님이 요청에 적합한 맞춤 견적서를 보내드려요.</p>
				<p style="font-size: 15px;">견적서에는 가격은 물론 프로필, 자격증, 연락처, 사진, 이용 후기를 볼 수 있어요. 견적을 비교하고 본인과 가장 적합한 분을 선택하시면 돼요.</p>
			</div>
		</div>

</body>

</html>