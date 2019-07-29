<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/listQNA.js"></script>
<link rel="stylesheet" href="/resources/css/listQNA.css">
<script type="text/javascript">
$(document).ready(function(){
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

		for(var i=0, len=list.listQ.length||0; i<len; i++){
			str += '<input type=hidden name="listQ_seq" value="'+ list.listQ[i].q_Seq+'">';
			str += '<div class="requestList">';
			str += '<h4>'+ list.listQ[i].q_Contents + '</h4>';
			str += '<ul>';
			for(var j=0, len2=list.listA.length||0; j<len2; j++){
				if(list.listQ[i].q_Seq == list.listA[j].q_Seq){
					str += '<li class="answer"><input type="checkbox" name="listA_seq" value="'+ list.listA[j].a_Seq + '">';
					str += list.listA[j].a_Contents+'</li>';
					str += '<br>';
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
</head>
<body>

		<div id="container">
			<div id="dimmed"></div>
			<div id="listForm">
				<form id="form" action="/request/detailRequest" method="post">
					<div class="slide">
						<div class="requestList">
							5개 남았습니다!
							<h3>희망하는 시간대는 언제인가요?</h3>
							<ul>
								<li><input type="checkbox" name="time" value="아침(9시 이전)">아침 (9시 이전)</li>
								<li><input type="checkbox" name="time" value="오전(9시-12시)">오전 (9시-12시)</li>
								<li><input type="checkbox" name="time" value="이른 오후(12시-3시)">이른 오후 (12시-3시)</li>
								<li><input type="checkbox" name="time" value="오후(3시-6시)">오후 (3시-6시)</li>
								<li><input type="checkbox" name="time" value="저녁(6시-9시)">저녁 (6시-9시)</li>
								<li><input type="checkbox" name="time" value="늦은 저녁(9시 이후)">늦은 저녁 (9시 이후)</li>
							</ul>
								
							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#"
									class="next">다음</a>
							</div>

						</div>


						<div class="requestList">
							4개 남았습니다!
							<h3>언제부터 시작하기 원하시나요?</h3>
							<ul>
								<li><input type="radio" name="date" value="협의 가능해요">협의 가능해요</li>
								<li><input type="radio" name="date" value="일주일 이내면 돼요">일주일 이내면 돼요</li>
								<li><input type="radio" name="date" value="가능한 빨리 하고 싶어요">가능한 빨리 하고 싶어요</li>
								<li><input type="radio" name="date" value="원하는 날짜가 있어요">원하는 날짜가 있어요</li>
							</ul>

							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; 
								<a href="#"	class="next">다음</a>
							</div>

						</div>

						<div class="requestList">
							3개 남았습니다!
							<h3>선호하는 고수 성별이 있나요?</h3>
							<ul>
								<li><input type="radio" name="gen" value="남자">남자</li>
								<br>
								<li><input type="radio" name="gen" value="여자">여자</li>
								<br>
								<li><input type="radio" name="gen" value="무관">무관</li>
							</ul>

							<div class="btn">
								<a href="#" class="prev">이전</a>&nbsp;&nbsp; <a href="#"
									class="next">다음</a>
							</div>

						</div>

						<div class="requestList">
							2개 남았습니다!
							<h3>선호 지역을 선택하세요</h3>
							<div id="dist1">
								<select name="sido" id="sido1">
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
							마지막 질문입니다!
							<h3>전화번호를 입력하세요</h3>
							<c:choose>
								<c:when test="${loginUser.user_Divide != null }">
									<c:if test="${loginUser.user_Divide =='expert'}">
										<div id="submit_btn">
											<h5>회원으로 로그인 시 요청 가능합니다!</h5>
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
								</c:otherwise>	
							</c:choose>
						</div>
					</div> 
				</div>

			</form>		
			</div>
			<div id="notice">
				<h4>숨고 사용 팁</h4>
				<p>다음 몇가지 질문에 답변해주시면, 고수님이 요청에 적합한 맞춤 견적서를 보내드려요.</p>
				<p>견적서에는 가격은 물론 프로필, 자격증, 연락처, 사진, 이용 후기를 볼 수 있어요. 견적을 비교하고 본인과 가장 적합한 분을 선택하시면 돼요.</p>
			</div>
		</div>

</body>
</html>