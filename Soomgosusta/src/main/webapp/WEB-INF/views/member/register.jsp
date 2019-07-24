<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<body class="member_registerPage">
 <div class="logo">
 	<a href="${path}/">
 		<b>SoomgoSusta</b>&nbsp
 	</a>
 </div>
 
 <div class="register_box">
 	<p class="register_box_msg">회원가입 페이지 </p>
 	
 	<form action="${path}/member/register" method="post">
 		<div class="form-register">
 			<input type="email" name="m_Id" class="form-control" placeholder="아이디">
 			<span class="register-imgicon"></span>
 		</div>
 		
 		<div class="form-register">
 			<input type="password" name="m_Password" class="form-control" placeholder="비밀번호">
			<span class="register-imgicon"></span> 			
 		</div>
 		
 		<div class="form-register">
 			<input type="password" class="form-control" placeholder="비밀번호 확인">
			<span class="register-imgicon"></span> 			
 		</div>
 		
 		<div class="form-register">
 			<input type="text" name="m_Name" class="form-control" placeholder="이름">
 			<span class="register-imgicon"></span> 
 		</div>
 		
 		<button type="submit" class="btn-sign">가입</button>
 	</form>
 	<a href="${path}/member/login">로그인</a>
 	
 </div>
 
 	<script type="text/javascript">
 	$(function(){
 			$('.btn-sign').click(
 					alert("가입성공")
 					)
 	});
 	
 
 	
 	</script>
</body>


