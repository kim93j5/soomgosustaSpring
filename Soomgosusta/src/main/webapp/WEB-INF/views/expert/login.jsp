<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>

 <!-- <link href="/resources/css/register.css" rel="stylesheet">
 --> 
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
 <div class="login-box well">
 	<p class="login-box_msg">로그인 페이지 </p>
 	
 	<form id="form" action="${path}/expert/login" method="post">
 		
 		  <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input type="email" name="Id" class="form-control" placeholder="아이디">
          </div>
 		
 		 <div class="input-group">
    		<span class="input-group-addon"><i class="fa fa-lock"></i></span>
 			<input type="password" name="Password" class="form-control" placeholder="비밀번호">
 		</div>
 		<button type="" class="btn-login">로그인</button>
 	</form>
 	<a href="${path}/expert/register">회원가입</a>
 </div>
 
<footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer>
<script >
	$(document).ready(function(){
		
		
		$(".btn-login").click(function(){
			var id = $("input[name=Id]").val();		
			var pass = $("input[name=Password]").val();
			var loginResult = "${loginResult}";
			var loginDTO = "${loginDTO.success}"
			
			
		});
		
	});
</script>
</body>

</html>
