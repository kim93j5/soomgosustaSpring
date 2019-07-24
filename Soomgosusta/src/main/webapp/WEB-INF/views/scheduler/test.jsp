<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/test.js"></script>
<script type="text/javascript">

service.getList("nano125@naver.com", function(list){
	var str = "";
	console.log(list);
	for(var i=0, len=list.length||0; i<len; i++){
		str+= '<a href="/scheduler/memberScheduler/'+list[i]+'">고수 일정페이지</a><br>';		
	}
	$('#list').append(str);
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="list">
	
	</div>
</body>
</html>