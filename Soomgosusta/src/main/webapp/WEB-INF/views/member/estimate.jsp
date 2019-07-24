<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/estimate.js"></script>
<link rel="stylesheet" href="/resources/css/estimateList.css"
	target="text/css">
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style type="text/css">
h3{
 font-weight: bold;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div class="h2"><h2>받은 견적서 내역</h2></div>
	<c:forEach var="list" items="${listEstimate }">

		<div id="estimate">
			<div id="e_Photo">
				<img src="/resources/images/${list.e_Photo }">
			</div>
			<div id="estimateInfo">
				<h3>${list.e_Name } 고수의 
				${list.p_S_Word }&nbsp;${list.p_L_Word }</h3>
				<h6>활동지역 : ${list.ei_District}</h6>
				<div class="expectation">예상금액 : ${list.e_AmountPart}&nbsp;${list.e_Amount }</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>