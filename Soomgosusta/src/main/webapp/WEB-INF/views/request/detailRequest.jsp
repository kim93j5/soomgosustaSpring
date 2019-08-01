<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/detailRequest.css">
<title>Insert title here</title>
</head>
<body>
	<div id="info">
		<div id="ment">
			<c:if test="${size == 0}">
				<h3>요청이 완료되었습니다!</h3>
				<p>48시간 동안 매칭이 진행됩니다.</p>
			</c:if>
			<c:if test="${size != 0 }">
				<h3>이미 보낸 요청서가 있습니다.</h3>
				<p>48시간 후에 다시 요청해주세요!</p>
			</c:if>
		</div>
		<div id="btn">
			<a href="#">보낸 요청 확인하러 가기</a>
			<a href="/part/main">메인으로</a>
		</div>
	</div>
</body>
</html>