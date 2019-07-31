<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>

<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
  <head>
 <link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="/resources/css/register.css" rel="stylesheet"> -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>

 

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
 
<script >
	$(document).ready(function(){
		
		$(".btn-login").click(function(){
			var id = $("input[name=Id]").val();		
			var pass = $("input[name=Password]").val();
			var loginResult = "${loginResult}";
			
			if(id==""){
				alert("ID를 입력하세요.");
			}else if(pass==""){
				alert("비밀번호를 입력하세요.");
			}else if(loginResult=="login fail"){
				alert("다시 로그인 해주세요.");
			}
			
			
		})
		
	})
</script>

</body>
 <footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer>
</html>

