<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/detailRequest.css">
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
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