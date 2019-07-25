<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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

<nav>
	<div>
		<c:choose>
			<c:when test="${loginUser.user_Divide =='member'}">
				<div class="left_">
					<ul class="nav navbar-nav">
						<li><a href="main.do"> <img src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg" alt="숨고, 숨은고수">
							</a></li>
						<li><a href="requestInfoForm.do?member_Id=${id }"> <span>보낸 요청</span>
						</a></li>
						<li><a href="memberMyPage.do?member_Id=${id }"><span>프로필</span></a>
						<li><a href="findExpertForm.do"> <span>고수 찾기</span>
						</a></li>
						<li><a href=""> <span>채팅</span>
						</a></li>
					</ul>
					
				</div>
 				<div class="right_">
					<ul class="nav navbar-nav navbar-right">
						<li><span>${id} 고객님</span></li>
						<li><a href="logout.do"><span>로그아웃</span></a></li>
					</ul>

				</div>
				<form action="memberAddInfo.do?member_Id=${id}" method="get">
						<input type="hidden" name="member_Id" value="${id}"/>
						<input type="submit" value="이용자 부가 정보 입력"/>
				</form>	
			</c:when>
			<c:when test="${loginUser.user_Divide =='expert'}">

				<div class="left_">
					<ul>
						<li><a href="main.do"> <img src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg" alt="숨고, 숨은고수">
							</a></li>
						<li><a href="expertMain.do"> <span>받은 요청</span>
						</a></li>
						<li><a href="${path}/expert/profile?e_Id=${loginUser.e_Id}"> <span>프로필</span>
						</a></li>
						<li><a href=""> <span>일정</span>
						</a></li>
						<li><a href=""> <span>채팅</span>
						</a></li>
					</ul>
				</div>
				<div class="right_">
					<ul>
						<li><span>${id } 고수님</span></li>
						<li><a href = "logout"><span>로그아웃</span></a>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="left_">
					<a href="/part/main"> <img
						src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
						alt="숨고, 숨은고수">
					</a>
				</div>
				<div class="right_">
					<ul class="nav navtab">
						<li><a href="regist">회원가입</a></li>
						<li>
							<div class="select">
								<select name="" id="loginState">
									<option value="member">회원</option>
									<option value="expert">고수</option>
								</select> <a id="login" href="loginAction.do">로그인</a> <a id="loginteg"></a>
							</div>
						</li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</nav>
</body>

</html>