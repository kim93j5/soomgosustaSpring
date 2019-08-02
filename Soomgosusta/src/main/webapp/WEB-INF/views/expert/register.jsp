<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
 <link href="/resources/css/register.css" rel="stylesheet">
</head>
<body>

 
 <div class="register_box">
 	<p class="register_box_msg">고수가입 페이지 </p>
 	
 	<form action="${path}/expert/register" method="post" id="registerForm">
 		<div class="form-register">
 			<input type="email" name="e_Id" class="form-control" placeholder="아이디">
 			<span class="register-imgicon"></span>
 		</div>
 		
 		<div class="form-register">
 			<input type="password" name="e_Password" class="form-control" placeholder="비밀번호">
			<span class="register-imgicon"></span> 			
 		</div>
 		
 		<div class="form-register">
 			<input type="password" class="form-control" placeholder="비밀번호 확인">
			<span class="register-imgicon"></span> 			
 		</div>
 		
 		<div class="form-register">
 			<input type="text" name="e_Name" class="form-control" placeholder="이름">
 			<span class="register-imgicon"></span> 
 		</div>
 		
 		
 		<button type="submit" class="btn-sign">가입</button>
 	</form>
 	<a href="${path}/expert/login">로그인</a>
 	
 </div>
 

</body>
</html>
<footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer>
