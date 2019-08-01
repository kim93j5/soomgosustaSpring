<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/chatroom.js"></script>
<style>
* {
	font-family: Noto Sans KR, 맑은 고딕, Malgun Gothic, APPLE SD Gothic NEO,
		Roboto, sans-serif;
}

.chatlist-item .provider {
	cursor: pointer;
	padding: 1.5rem 1.75rem 1rem;
	background-color: #fff;
	margin-bottom: .5rem;
	border: .06rem solid black;
	box-sizing: border-box;
}

#app-body .page-title {
	max-width: 928px;
	margin-left: auto;
	margin-right: auto;
}

#app-body .page-title .page-section {
	margin-bottom: 3.875rem;
}

#app-body .page-title .page-section h2 {
	font-weight: bold;
}

#app-body #chatlist-area {
	min-height: -webkit-fill-available;
	background-color: #F7F7F7;
	padding: 2.25rem 0 9.6875rem;
}

#app-body #chatlist-area .chat-list .chatlist-item section .service-info
	{
	display: inline-block;
	float: right;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: relative;
	top: -.25rem;
	font-size: 0;
	margin-bottom: 4px;
	overflow: hidden;
	margin-right: 600px;
	margin-left: 10px;
}

#app-body #chatlist-area .chat-list .chatlist-item section div {
	display: inline-block;
	padding-right: 0;
	padding-left: 0;
}

#app-body #chatlist-area .chat-list .chatlist-item section .user-profile-picture
	{
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

#app-body #chatlist-area .chat-list .chatlist-item section .user-profile-picture img
	{
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

#app-body #chatlist-area .chat-list .chatlist-item section .service-info h5
	{
	width: 100%;
	display: inline-block;
	margin-bottom: 3px;
	margin-top: 0px;
	font-weight: bold;
}

#app-body #chatlist-area .chat-list .chatlist-item section .service-info p
	{
	font-size: 1rem;
	line-height: 1.625rem;
	max-height: 1.625rem;
	margin-bottom: 0;
	color: #b5b5b5;
}

#app-body #chatlist-area .chat-list .chatlist-item {
	margin-bottom: 6px;
	margin-top: 6px;
}

#app-body #chatlist-area .chat-list {
	list-style: none;
	max-width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

#app-body #chatlist-area .chat-list .chatlist-item .message-area {
	margin-top: 10px;
	padding: 0;
}

#app-body #chatlist-area .chat-list .chatlist-item .message-area p {
	overflow: hidden;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
	width: 100%;
	max-width: none;
	margin: 0;
}

#app-body #chatlist-area .chat-list .chatlist-item .price-area span {
	margin-left: 0px;
	border: .06rem solid black;
	color: #737373;
	height: 1.5rem;
	padding: .125rem .25rem;
	position: relative;
}

#app-body #chatlist-area .chat-list .chatlist-item section {
	display: inline-block;
	height: 4.5rem;
	position: relative;
}

#app-body #chatlist-area .chat-list .chatlist-item .price-area p {
	display: inline;
}

#app-body #chatlist-area .chat-list .chatlist-item .price-area p label {
	display: inline-block;
	margin-left: 6px;
	margin-right: 6px;
	color: #999;
	margin-right: .5rem;
	margin-bottom: 0;
}

#app-body #chatlist-area .chat-list .chatlist-item .divider {
	height: .1rem;
	background-color: black;
	margin: .75rem 0;
}
</style>
</head>
<body>
	<div id="app-body">
		<div class="page-header"></div>
		<div id="chatlist-area">
			<div class="not-chat-list"></div>
			<ul class="chat-list">
			</ul>
		</div>
	</div>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var _pageHeader = $(".page-header");
							var _chatlistUL = $(".chat-list");
							var _notchatlist = $(".not-chat-list");
	
							var _name = '${loginUser.e_Name}';
							
							var header = "";

							header += "<div class='page-header-container'>"
							header += "<div class='page-title'>"
							header += "<section class='page-section'>"
							header += "<h2>채팅</h2>"
							header += "</section>"
							header += "</div>"
							header += "</div>"

							_pageHeader.html(header);

							chatroomService
									.getList(_name , function(list) {

								
										var str = "";

										if (list == null || list.length == 0) {

											str += "<div>"
											str += "<p>현재 진행중인 대화가 없습니다.</p><br>"
											str += "<p>요청자에게 첫 메세지를 보내보세요.</p><br>"
											str += "</div>"
											str += "<div>"
											str += "<button id='sendBtn'>메세지 보내기</button>"
											str += "</div>"

											_notchatlist.html(str);

											return;
										}

										for (var i = 0, len = list.length || 0; i < len; i++) {
											console.log(list[i])

											str += "<li class='chatlist-item' data-crno='"+list[i].crno+"'>"
											str += "<div class='provider'>"
											str += "<section class='user-info'>"
											str += "<div>"
											str += "<div class='user-profile-picture'>"
											if (list[i].member.m_Photo == 'null') {
												str += "<img src='/resources/images/default.jpg'/>"
											}
											str += "</div>"
											str += "</div>"
											str += "<div class='service-info'>"
											str += "<h5>"
													+ list[i].member.m_Name
													+ "</h5>"
											str += "<p>"
													+ list[i].part.p_L_Word
													+ "/"
													+ list[i].part.p_M_Word
													+ "/"
													+ list[i].part.p_S_Word
													+ "</p>"
											str += "<p>"
													+ "주소"
													+ "</p>"
											str += "</div>"

											str += "</section>"
											str += "<div class='message-area'>"
											str += "</div>"
											str += "<div class='divider'></div>"
											str += "<div class='price-area'>"
											str += "<span class='expectaion'>예상금액</span>"
											str += "<p>"
											str += "<label>"
													+ list[i].estimate.e_AmountPart
													+ "</label>"
													+ list[i].estimate.e_Amount
													+ "원</p>"
											str += "</div>"

											_chatlistUL.html(str);

										}

									});//채팅방 리스트

							_chatlistUL.on('click', 'li', function() {

								var _crno = $(this).data("crno");

								$.ajax({
									type : 'get',
									url : '/requests/chat/' + _crno,
									data : _crno,
									success : function() {

										alert("성공");

										location.href = "chats/" + _crno;

									}
								}); //end AJAX

							});//end list Click

						});
	</script>


</body>
</html>