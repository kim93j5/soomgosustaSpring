<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>

 <!-- <link href="/resources/css/register.css" rel="stylesheet">
 --> 
 <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
 <link href="/resources/css/login.css" rel="stylesheet">
</head>

<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<body>
 <div class="login-box well">
 	<p class="login-box-msg">로그인 페이지 </p>
 	
 	<form id="form" action="${path}/expert/login" method="post">
 		
 		  <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input type="email" name="Id" class="form-control" placeholder="아이디">
          </div>
 		<br>
 		 <div class="input-group">
    		<span class="input-group-addon"><i class="fa fa-lock"></i></span>
 			<input type="password" name="Password" class="form-control" placeholder="비밀번호">
 		</div>
 		<button type="submit" class="btn-login">로그인</button>
 	</form>
 	<a href="${path}/expert/register">회원가입</a>
 </div>
  
</body>
<footer>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</footer>
<script>
	$(document).ready(function(){
		
		
		$(".btn-login").click(function(){
			
			var id = $("input[name=Id]").val();		
			var pass = $("input[name=Password]").val();
			if(id==""){
				alert("아이디를 입력하세요.");
				return false;
			}else if(pass==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
		});
		
		
	});
</script>


</html>
