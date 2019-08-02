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
<script type="text/javascript" src="/resources/js/cookie.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script> 
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/plugin/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/plugin/slick/slick-theme.css"/>
<script type="text/javascript" src="/resources/plugin/slick/slick.js"></script>
<script type="text/javascript">


	partService.getPopular(function(list) {
		console.log(list);

		$('#searchcontents').empty();
		var str = "<ul class='nav nav-pills nav-stacked'>";
		for (var i = 0, len = 10; i < len; i++) {
			str += '<li class="nav-item"><a class="popularitems" href="#">'
					+ list[i] + '</a></li>';
		}
		str += '</ul>';

		$('#searchcontents').append(str);

		$(document).on("click", ".popularitems", function(e) {
			e.preventDefault();
			var data = $(this).html();

			location.href = "/request/listQNA/" + data;
		});
	});

	var divide = "${loginUser.user_Divide}";
	var id="";
	if(divide == 'member'){
		id = "${loginUser.m_Id}";
	}else if(divide == 'expert'){
		id = "${loginUser.e_Id}";
	}else{
		id="null";
		divide = "null";
	}
	partService.getRecommend({id:id, divide:divide}, function(list){
		console.log(list);
		var str = "";
		
		for(var i=0, len = list.length||0; i<len; i++){
			console.log(list[i]);
			str += '<div class="recommendService">';
			str += '<a href = "/request/listQNA/' + list[i].p_S_Word + '">';
			str += '<img class="rcm-img" src = "/resources/images/'+list[i].p_Image+'"><br></a>';
			str += '<div class="caption" style="margin-top: 3px;">';
			str += '<p>'+ list[i].p_S_Word + '</p>';
			str += '<p><img class="rc-img" src="/resources/images/saram.JPG">'+ list[i].pl_Register+'명 고수 활동 중</p>';
			str += '</div></div>';
		}
		$('.recommend').append(str);
		
		$('.recommend').slick({
			slidesToShow: 4,
			slidesToScroll: 1,
			autoplay: false,
			pauseOnHover: true,
		});
	});
	
	partService.getDistrict({id:id, divide:divide}, function(list){
		console.log(list);
		var str="";
		
		for(var i=0, len=list.length||0; i<len; i++){
			str += '<div class="districtService" data-id="'+ list[i].ef_Id+'">';
			str += '<div class="background" style="background-img: url(/resources/images/'+list[i].ef_Photo+')"></div>';
			str += '<div class="thumb" style="display:inline-block;"><img class="ex-img" src="/resources/images/'+list[i].ef_Photo+'"></div>';
			str += '<div class="ex-info"><div class="service-name">'+list[i].ef_OL+'</div>';
			str += '<div class="location">'+ list[i].ef_District + '</div>';
			str += '<div class="new-review-average"><img src="/resources/images/starpoint.JPG">';
			str += '<span class="star">'+list[i].ef_AvgStarpoint+ '</span>';
			str += '<span class="review">'+ list[i].ef_CntReview+ '</span>';
			str += '<div class="hire">('+ list[i].ef_RC+ '회)</div></div></div></div>';
		}
		
		$('.district').append(str);
		
	
		$('.district').slick({
			slidesToShow: 4,
			slidesToScroll: 1,		
		});
	});
	
	$(document).ready(
			function() {

				$('.largelist').hover(function() {
				$(this).css('border-style', 'groove');
				
				}, function() {
						$(this).css('border-style', 'outset');
					});

				$('.largelist').click(function(e) {
						e.preventDefault();

						var data = $(this).find(".img").data("alt");

						partService.getPart(data, function(list) {
								var str = "";
							
								$('.modal-header').empty();
								$('.modal-body').empty();
								$('.modal-footer').empty();

								$('.modal-header').append('<h4><strong>'+ data+ '</strong></h4>');
								for (var i = 0, len = list.length || 0; i < len; i++) {
								str += '<a href="/request/listQNA/'+list[i].p_S_Word+'">'+ list[i].p_S_Word + '</a>&nbsp;&nbsp;&nbsp;&nbsp;';
								
								if (i >= 4	&& (i + 1) % 5 == 0)
									str += '<br>';
						}
					
							$('.modal-body').append(str);
							$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');

							$('#modal').modal();
						
							});

						});

						$(document).on("click", ".part", function(event) {

							var data = $(this).html();
							location.href = "/request/listQNA/" + data;
						});

						$(document).ready(function() {
							var recent = new Array();
							$('#searchBtn').click(function() {
								var data = $('#searchKey').val();
								console.log(data);

								setCookie(data,data, 3);
								location.href = "/request/listQNA/"+ data;
							});

							$('#popular').click(function(e) {
								e.preventDefault();

								partService.getPopular(function(list) {
								$('#searchcontents').empty();
								
								var str = "<ul class='nav nav-pills nav-stacked'>";
								for (var i = 0, len = 10; i < len; i++) {
									str += '<li class="nav-item"><a class="popularitems" href="#">'+ list[i]+ '</a></li>';
									}
								
								str += '</ul>';

								$('#searchcontents').append(str);
								
								$(document).on("click",".popularitems",function(e) {
									e.preventDefault();
									
									var data = $(this).html();
					
									location.href = "/request/listQNA/"+ data;
								});
							});
						});

						$('#recent').click(function(e) {
							e.preventDefault();

							$('#searchcontents').empty();
							var recent = displayCookieList();
							console.log(recent);
								
							if (recent.length == 0) {
									
								$('#searchcontents').append("최근 검색한 분야가 없습니다!");
							} else {
								
								var str = "<ul class='nav nav-pills nav-stacked'>";
	
								for (var c = recent.length - 1, clen = 0; c >= clen; c--) {
									str += '<li class="nav-item"><a class="recentitems" href="#">'+ recent[c]+ '</a></li>';
								}

								str += '</ul>';
								$('#searchcontents').append(str);

								$(document).on("click",	".recentitems", function(e) {
																						
									e.preventDefault();
									
									var data = $(this).html();

									location.href = "/request/listQNA/"+ data;		
								});
							}
						});
					})
				});
</script>


<title>Main Page</title>
</head>
<body>

	<div id="search">
		<div id="mainImage" style="position: absolute; z-index: 1;">
			<img alt="메인1" src="/resources/images/photographer.jpg"> <img
				alt="메인2" src="/resources/images/vocal.jpg"> <img alt="메인3"
				src="/resources/images/teacher.jpg">
		</div>

		<div id="semi" style="padding-top: 60px;">
			<h1>
				딱! 맞는 고수를<br>소개해드립니다
			</h1>
			<form id="searchform" method="get">
				<input id="searchKey" type="text" name="searchKey" size="40">
				<input id="searchBtn" type="button" value="고수 검색">
			</form>
			<div id="searchresults" style="display: none; z-index: 3;">
				<div>
					<ul role="tablist" class="nav nav-tabs" id="search-ul">
						<li role="presentation" class="nav-item"><a role="tab"
							aria-setsize="1" aria-posinset="1" target="_self" href="#"
							class="nav-link" id="popular">인기 키워드</a></li>
						<li role="presentation" class="nav-item"><a role="tab"
							tabindex="-1" aria-setsize="1" aria-posinset="2" target="_self"
							href="#" class="nav-link" id="recent">최근 검색한 서비스</a></li>
					</ul>
					<div id="searchcontents"
						style="height: 220px; background: white; overflow-y: scroll;">

					</div>
					<div id="footer">
						<button id="divclose" type="button" class="btn btn-default"
							style="margin-left: 270px;">닫기</button>
					</div>
				</div>
			</div>



		</div>

		<div id="group" style="z-index: 2; position: absolute;">
			<div class="largelist">
				<img class="img" data-alt="레슨" src="/resources/images/lesson.JPG"><a
					class="part">레슨</a>
			</div>
			<div class="largelist">
				<img class="img" data-alt="홈 리빙"
					src="/resources/images/homeliving.JPG"><a class="part">홈/리빙</a>
			</div>
			<div class="largelist">
				<img class="img" data-alt="이벤트" src="/resources/images/event.JPG"><a
					class="part">이벤트</a>
			</div>
			<div class="largelist">
				<img class="img" data-alt="디자인 개발"
					src="/resources/images/design.JPG"><a class="part">디자인/개발</a>
			</div>
			<div class="largelist">
				<img class="img" data-alt="건강 미용" src="/resources/images/health.JPG"><a
					class="part">건강/미용</a>
			</div>
		</div>
	</div>
	
	
	
	<!-- 추천서비스 -->
	
	<div class="recommendInfo">
		<h2>이런 서비스는 어떠세요?</h2>
	</div>
	
		<div class="recommend">
		</div>
	

	<div class="districtInfo">
		<h2>우리 지역 고수를 찾아볼까요?</h2>
	</div>
	<div class="district">
		</div>

	<section id="main-introduce" style="background-color: #e7e7e7">
	<div id="p1" style="display: inline-block;">
		<h3><b>더 많은 고객을 만날 기회!</b><br>
		가입 직후 <b>내 조건서에 맞는 요청서</b>를<br>
		무료로 받아보고 만나고 싶은<br>
		고객과 연락해보세요.
		</h3>
	</div>
	<div id="p2" style="display: inline-block; width: 500px;">
		<div class="p2-s"><img src="/resources/images/receive-request.png">
			<h5>고객의 요청서가 도착해요</h5>
			<p>전문 활동 분야를 등록하면<br>고객의 도움이 필요한 서비스에 대해<br>작성한 요청서가 도착해요</p>
		</div>
		<div class="p2-s"><img src="/resources/images/send-quote.png">
			<h5>고수님의 견적서를 발송하세요</h5>
			<p>답변 보낼 고객을 선택하고<br>견적서를 보낸 후 고용 기회를 잡아보세요</p>
		</div>
		<div class="p2-s"><img src="/resources/images/contact-user.png">
			<h5>고객과 연락하세요</h5>
			<p>견적서를 보낸 고객과<br>채팅 및 전화(안심번호)를 통해<br>의뢰를 진행하세요</p>
		</div>
		<div class="p2-s"><img src="/resources/images/handshake.png">
			<h5>거래가 완료되었어요</h5>
			<p>거래를 통해 서로 도움을<br>주고 받고 이제 나도 숨은 고수!</p>
		</div>
	</div>
	</section>

	<div class="modal fade" id="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>

				<div class="modal-body"></div>

				<div class="modal-footer"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	
</body>
</html>