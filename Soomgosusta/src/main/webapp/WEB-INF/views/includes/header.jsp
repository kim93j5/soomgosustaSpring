<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var='expert' value="${expert}" scope="request" />
	<c:set var='member' value="${member}" scope="request" />

	<div class="banner">
		<c:choose>
			<c:when test="${loginUser.user_Divide =='expert'}">
				<div class="left_">
					<div>
						<a href="/main/mainPage"> <img
							src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
							alt="숨고, 숨은고수">
						</a>
					</div>
					<div>
						<a href="/expert/request/received"> <span>받은
								요청</span>
						</a>
					</div>
					<div>
						<a href="/expert/profile?e_Id=${loginUser.e_Id}"><span>프로필</span></a>
					</div>
					<div>
						<a href="/scheduler/expertScheduler"> <span>일정</span>
						</a>
					</div>
					<div>
						<a href="/expert/chatlist"> <span>채팅</span>
						</a>
					</div>
				</div>
				<div class="right_">
					<div>
						<span>"${loginUser.e_Name}"고수님</span>
					</div>
					<div>
						<a id="logout" href="/main/logout"><span>로그아웃</span></a>
					</div>
				</div>
			</c:when>


			<c:when test="${loginUser.user_Divide =='member'}">
				<div class="left_">
					<div>
						<a href="/main/mainPage"> <img
							src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
							alt="숨고, 숨은고수">
						</a>
					</div>
					<div>
						<a href="/request/sendRequest/${loginUser.m_Id}"> <span>보낸
								요청</span>
						</a>
					</div>
					<div>
						<a href="memberMyPage.do?member_Id=${id }"><span>프로필</span></a>
					</div>
					<div>
						<a href="/expert/listExpertFind"> <span>고수 찾기</span>
						</a>
					</div>
					<div>
						<a href=""> <span>채팅</span>
						</a>
					</div>
				</div>
				<div class="right_">
					<div>
						<span>"${loginUser.m_Name}"고객님</span>
					</div>
					<div>
						<a id="logout" href="/main/logout"><span>로그아웃</span></a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="left_">
					<div>
						<a href="/main/mainPage"> <img
							src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
							alt="숨고, 숨은고수">
						</a>
					</div>
					<div>
						<a href="/expert/listExpertFind"> <span>고수 찾기</span>
						</a>
					</div>
				</div>
				<div class="right_">
					<div>
						<a href="/main/regist">회원가입</a>
					</div>
					<div>
						<div class="select">
							<select name="" id="loginState">
								<option value="member">회원</option>
								<option value="expert">고수</option>
							</select> <a id="login" href="#">로그인</a> <a id="loginteg"></a>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</body>

</html>