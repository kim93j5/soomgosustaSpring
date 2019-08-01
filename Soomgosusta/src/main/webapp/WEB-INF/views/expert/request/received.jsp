<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/link.js"></script>

<style>
* {
	font-family: Noto Sans KR, 맑은 고딕, Malgun Gothic, APPLE SD Gothic NEO,
		Roboto, sans-serif;
	-webkit-font-smoothing: antialiased;
}

#app-body #request-area .request-list {
	list-style: none;
}

#app-body #request-area .request-list .request-item {
	margin-bottom: 6px;
	margin-top: 6px;
	border-style: solid;
}

#app-body #request-area .request-list .request-item .request-info .name::after
	{
	content: "";
	margin-top: 7px;
	margin-left: 6px;
	position: absolute;
	width: .7rem;
	height: .7rem;
	background-color: #ff3131;
	border-radius: 50%;
}

#app-body .page-header {
	max-width: 928px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 75px;
	margin-bottom: 75px;
}

#app-body .page-header .page-header-container {
	max-width: 60.625rem;
}

#app-body .page-header .page-header-container .page-title {
	text-align: left;
}

#app-body .page-header .page-header-container .page-title h1 {
	font-weight: bold;
}

#app-body .page-body {
	min-height: -webkit-fill-available;
	background-color: #F7F7F7;
	padding: 2.25rem 0 9.6875rem;
}

#app-body .page-body #request-area .request-list {
	list-style: none;
	max-width: 1000px;
	margin-left: auto;
	margin-right: auto;
	cursor: pointer;
}

#app-body .page-body #request-area .request-list .request-item {
	position: relative;
	float: left;
	width: 100%;
	padding: 20px;
	margin-bottom: .5rem;
	background-color: #fff;
	border: .06rem solid #f2f2f2;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#app-body .page-body #request-area .request-list .request-item .profile-img
	{
	position: relative;
	float: left;
	margin-right: .75rem;
}

#app-body .page-body #request-area .request-list .request-item .profile-img .user-profile-picture .is-square img
	{
	display: inline-block;
	width: 6.5rem;
	height: 6.5rem;
}

#app-body .page-body #request-area .request-list .request-item .request-info
	{
	display: inline-block;
	height: 65px;
}

#app-body .page-body #request-area .request-list .request-item .request-info .name-read
	{
	width: 100%;
	display: inline-block;
	margin-bottom: 3px;
	margin-top: 0px;
	font-weight: bold;
}

#app-body .page-body #request-area .request-list .request-item .request-info .name
	{
	width: 100%;
	display: inline-block;
	margin-bottom: 3px;
	margin-top: 0px;
	font-weight: bold;
}

#app-body .page-body #request-area .request-list .request-item .date {
	position: relative;
	float: right;
	margin-right: .75rem;
}

#app-body #request-area .request-list .request-item .footer-container {
	margin-top: 10px;
}

#app-body #request-area .request-list .request-item .footer-container .footer-button-container
	{
	display: inline-block;
	position: absolute;
}

#app-body #request-area .request-list .request-item .footer-container .footer-button-container #delbtn
	{
	color: #999;
	border: .0625rem solid #e1e1e1;
	box-sizing: border-box;
	padding: .125rem .75rem;
	cursor: pointer;
	float: right;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 700px;
}

.hoverbtn {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

</head>
<body>
	
	<div id="app-body">
		<div class="page-header"></div>
		<div class="page-body">
			<div id="request-area">
				<ul class="request-list">
				</ul>
			</div>
		</div>

		<!-- Modal  추가 -->
		<div class="modal fade" id="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" id="modalNoDelBtn" class="btn btn-default">취소</button>
						<button type="button" id="modalOkDelBtn" class="btn btn-primary">삭제</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var _modal = $("#modal");
							var _modalOkDelBtn = $("#modalOkDelBtn");
							var _modalNoDelBtn = $("#modalNoDelBtn");

							var _name = '${loginUser.e_Name}';

							var _pageHeader = $(".page-header");
							var _requestUL = $(".request-list");

							var header = "";

							header += "<div class='page-header-container'>"
							header += "<div class='page-title'>"
							header += "<h1>받은 요청</h1>"
							header += "</div>"
							header += "</div>"

							_pageHeader.html(header);

						

							function transferTime(time) {
								var now = new Date();
								var sYear = time.substring(0, 4);
								var sMonth = time.substring(4, 6) - 1;
								var sDate = time.substring(6, 8);
								var sHour = time.substring(8, 10);
								var sMin = time.substring(10, 12);
								var sSecond = time.substring(12, 14);
								var sc = 1000;

								var today = new Date(sYear, sMonth, sDate,
										sHour, sMin, sSecond);
								//지나간 초
								var pastSecond = parseInt((now - today) / sc,
										10);

								console.log(pastSecond);

								var date;
								var hour;
								var min;

								var str = "";

								if (pastSecond > 86400) {
									date = parseInt(pastSecond / 86400, 10);
									restSecond = pastSecond % 86400;
									str = date + "일 전 ";
								}

								if (pastSecond < 86400) {
									hour = parseInt(pastSecond / 3600, 10);
									str = hour + "시간 전 ";
								}

								if (pastSecond < 3600) {
									min = parseInt(pastSecond / 60, 10);
									str = min + "분 전"
								}

								if (pastSecond < 60) {
									str = "방금 전"
								}

								return str;
							}

							function replaceAll(str, searchStr, replaceStr) {
								return str.split(searchStr).join(replaceStr);
							}

							linkService
									.getList(
											_name,
											function(list) {
												console.log(list);

												var str = "";

												if (list == null
														|| list.length == 0) {

													str += "<div>"
													str += "<p>아직 받은 요청서가 없어요. 요청서를 기다리는동안 고수를 위한 팁을 확인해보세요.</p>"
													str += "</div>"
													str += "<li class='request-item'>"
													str += "<div>"
													str += "<h5>받은 요청이 없습니다</h5>"
													str += "</div>"
													str += "</li>"

													_requestUL.html(str);

													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													console.log(list[i])

													var dt = list[i].l_Date
													var conDt = replaceAll(dt,
															"-", "");
													var conDt = replaceAll(
															conDt, ":", "");
													var conDt = replaceAll(
															conDt, " ", "");

													str += "<li class='request-item' data-seq='"+list[i].l_Seq+"'>"
													str += "<div class='profile-img'>"
													str += "<div class='user-profile-picture'>"
													str += "<div data-name='image' class='is-square'>"
													if (list[i].member.m_Photo == 'null') {
														str += "<img src='/resources/images/default.jpg'/>"
													} else {

													}
													str += "</div>"
													str += "</div>"
													str += "</div>"
													str += "<div class='request-info'>"

													if (list[i].l_Enter != "not") {
														str += "<div class='name-read'>"
																+ list[i].member.m_Name
																+ "</div>"
													} else {
														str += "<div class='name'>"
																+ list[i].member.m_Name
																+ "</div>"
													}
													str += "<div class='status' data-status='"+list[i].l_Status+"'>"
													str += "</div>"
													str += "<div class='part'>"
															+ list[i].part.p_S_Word
															+ " "
															+ list[i].part.p_L_Word
															+ "</div>"
													str += "<div class='address'>"
															+ "주소" + "</div>"
													str += "</div>"

													str += "<div class='date'>"
													str += "<div class='date-execute'>"
															+ transferTime(conDt)
													str += "</div>"
													str += "</div>"
													str += "<div class='footer-container'>"
													str += "<span class='percent'>"
															+ list[i].l_Percent
															+ "% 일치하는 요청입니다. </span>"
													str += "<div class='footer-button-container'>"
													str += "</div>"
													str += "</div>"
													str += "</li>"

													_requestUL.html(str);

												}

											});//받은요청 리스트

							_requestUL.on('click', 'li', function() {

								var _status = $(this).find('.status').data(
										"status");

								if (_status == "NOT") {
									
									var _seq = $(this).data("seq");

									$.ajax({
										type : 'get',
										url : '/requests/receive/' + _seq,
										data : _seq,
										success : function() {

											linkService.updateEnter({
												l_Seq : _seq,
												l_Enter : "yes"
											}

											, function(result) {

											});//end l_Enter update

											location.href = "received/" + _seq;
										}
									}); //end AJAX

								} else if (_status == "write") {

									location.href = "/expert/chatlist";

								}

							});//end list Click

							_requestUL.on('mouseenter', 'li', function() {

								var str = "";

								str += "<span id='delbtn'>삭제</span>"

								$(this).find('.footer-button-container').html(
										str);

								$(this).children().find('#delbtn').on(
										'mouseenter', function() {

											$(this).addClass('hoverbtn');
											// 버튼 그림자 효과 적용
										});// hover in

								$(this).children().find('#delbtn').on(
										'mouseleave', function() {

											$(this).removeClass('hoverbtn');
											// 버튼 그림자 효과 제거
										});//hover out

							});//end mouseon

							_requestUL.on('mouseleave', 'li', function() {

								var str = "";

								$(this).find('.footer-button-container').html(
										str);

							});//end mouseout

							_requestUL
									.on(
											'click',
											'#delbtn',
											function(event) {
												event.stopPropagation();

												var _seq = $(this).parent()
														.parent().parent()
														.data("seq");
												var _sessionName = '${loginUser.e_Name}';
												console.log(_sessionName);

												var str = "";
												str += "<div class='modal-label'>해당요청을 거절하시겠습니까?</div>"
												str += "<div class='form-group'>"
												str += "<input class='form-control' id='l_seq' type='hidden' name='seq' value='" + _seq + "'>"
												str += "<input class='form-control' id='name' type='hidden' name='name' value='" + _sessionName + "'>"
												str += "</div>"

												$(".modal-body").html(str);

												$('#modal').modal();

											});//end click				

							_modalOkDelBtn
									.on(
											'click',
											function() {

												var _seq = $("#l_seq").val();
												var _name = $("#name").val();

												linkService
														.remove(
																_seq,
																function(result) {

																	linkService
																			.getList(
																					_name,
																					function(
																							list) {

																						var str = "";

																						if (list == null
																								|| list.length == 0) {

																							str += "<div>"
																							str += "<p>아직 받은 요청서가 없어요. 요청서를 기다리는동안 고수를 위한 팁을 확인해보세요.</p>"
																							str += "</div>"
																							str += "<li class='request-item'>"
																							str += "<div>"
																							str += "<h5>받은 요청이 없습니다</h5>"
																							str += "</div>"
																							str += "</li>"

																							_requestUL
																									.html(str);

																							return;
																						}

																						for (var i = 0, len = list.length || 0; i < len; i++) {
																							console
																									.log(list[i])

																							var dt = list[i].l_Date
													var conDt = replaceAll(dt,
															"-", "");
													var conDt = replaceAll(
															conDt, ":", "");
													var conDt = replaceAll(
															conDt, " ", "");

													str += "<li class='request-item' data-seq='"+list[i].l_Seq+"'>"
													str += "<div class='profile-img'>"
													str += "<div class='user-profile-picture'>"
													str += "<div data-name='image' class='is-square'>"
													if (list[i].member.m_Photo == 'null') {
														str += "<img src='/resources/images/default.jpg'/>"
													} else {

													}
													str += "</div>"
													str += "</div>"
													str += "</div>"
													str += "<div class='request-info'>"

													if (list[i].l_Enter != "not") {
														str += "<div class='name-read'>"
																+ list[i].member.m_Name
																+ "</div>"
													} else {
														str += "<div class='name'>"
																+ list[i].member.m_Name
																+ "</div>"
													}
													str += "<div class='status' data-status='"+list[i].l_Status+"'>"
													str += "</div>"
													str += "<div class='part'>"
															+ list[i].part.p_S_Word
															+ " "
															+ list[i].part.p_L_Word
															+ "</div>"
													str += "<div class='address'>"
															+ "주소" + "</div>"
													str += "</div>"

													str += "<div class='date'>"
													str += "<div class='date-execute'>"
															+ transferTime(conDt)
													str += "</div>"
													str += "</div>"
													str += "<div class='footer-container'>"
													str += "<span class='percent'>"
															+ list[i].l_Percent
															+ "% 일치하는 요청입니다. </span>"
													str += "<div class='footer-button-container'>"
													str += "</div>"
													str += "</div>"
													str += "</li>"

																							_requestUL
																									.html(str);

																						}
																					});//받은요청 리스트

																});//요청 삭제

												_modal.modal("hide");
											});//modal 삭제버튼 click

							_modalNoDelBtn.on('click', function() {

								_modal.modal("hide");

							})

						});
	</script>


</body>
</html>