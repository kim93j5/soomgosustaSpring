<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<body class="member_login">

 
 <div class="login_box">
 	<p class="login_box_msg">로그인 페이지 </p>
 	
 	<form action="${path}/member/login" method="post">
 		<div class="form-login">
 			<input type="email" name="Id" class="form-control" placeholder="아이디">
 			<span class="login-imgicon"></span>
 		</div>
 		
 		<div class="form-login">
 			<input type="password" name="Password" class="form-control" placeholder="비밀번호">
			<span class="login-imgicon"></span> 			
 		</div>
 		<button type="submit" class="btn-login">로그인</button>
 	</form>
 	<a href="${path}/member/register">회원가입</a>
 	
 </div>
 
</body>


