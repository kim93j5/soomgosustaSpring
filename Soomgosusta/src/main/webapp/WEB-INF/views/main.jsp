<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b>로그인 성공</b>
	<c:set var='expertVO' value="${expertVO}"/>
	${expertVO}
	<header>
		<jsp:include page="./includes/header.jsp"></jsp:include>
	</header>


	<c:choose>
		<c:when test="${loginUser.user_Divide =='expert'}">
		<a href="${path}/expert/profile?e_Id=${expertVO.e_Id}">프로필 이동</a>
		<a href="${path}/expert/profile" + e_Id>프로필 이동</a>
		</c:when>
		<c:otherwise>
		${loginUser.m_Id}
		</c:otherwise>
	</c:choose>
	
	
	
	
	
	
</body>
</html>