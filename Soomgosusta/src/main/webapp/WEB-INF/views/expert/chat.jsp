<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

        <!-- Web socket CDN -->

        <script type="text/javascript" src="/resources/js/socket.js"></script>




</head>
<body>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	
	<div id="data"></div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#sendBtn").click(function(){
			sendMessage();
			$('#message').val('')
		});
		
		
		 $("#message").keydown(function(key) {

             if (key.keyCode == 13) {// 엔터

                    sendMessage();

                    $('#message').val('')

             }

     });
		
	});
	
	let sock = new SockJS("<c:url value="/chating"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#message").val());
	}
	
	function onMessage(msg){
			var data = msg.data;
			$("#data").append(data + "<br/>");
	}
	
	function onClose(evt){
		$('#data').append("연결 끊킴");
	}

</script>


</html>