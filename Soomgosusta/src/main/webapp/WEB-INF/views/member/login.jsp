<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>

<head>
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <link href="/resources/css/login.css" rel="stylesheet">
</head>
<body >

 
 <div class="login-box well">
 	<p class="login_box_msg">로그인 페이지 </p>
 	
 	<form action="${path}/member/login" method="post">
 		<div class="input-group">
 			<span class="input-group-addon"><i class="fa fa-user"></i></span>
 			<input type="email" name="Id" class="form-control" placeholder="아이디">
 		</div>
 		
 		<div class="input-group">
 			<span class="input-group-addon"><i class="fa fa-lock"></i></span>
 			<input type="password" name="Password" class="form-control" placeholder="비밀번호">
 		</div>
 		<button type="submit" class="btn-login">로그인</button>
 	</form>
 	<a href="${path}/member/register">회원가입</a>
 </div>
</body>
<footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer>
</html>

