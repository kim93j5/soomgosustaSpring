<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header> <jsp:include page="../includes/header.jsp"></jsp:include>
</header>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/js/chatroom.js"></script>
<script type="text/javascript" src="/resources/js/link.js"></script>

<!-- Web socket CDN -->

<script type="text/javascript" src="/resources/js/socket.js"></script>

<style type="text/css">
.chat-room {
	height: calc(920px - 71px);
}

html, #app-body {
	height: 100%;
}

.container-fluid {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.chat-room-field {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.back-btn img {
	width: 35px;
	height: 35px;
}

.expert-info {
	overflow-y: scroll;
	overflow-x: hidden;
	z-index: 70;
}

.chat-header {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1;
	border: 1px solid #e1e1e1;
}

.chat-header-container {
	background-color: #fff;
	padding: 1.375rem 1.75rem 12px;
}

.chat-user-info {
	padding-bottom: 10px;
	padding-top: 10px;
}

.chating {
	border: 1px solid #e1e1e1;
	padding: 0px;
	position: relative;
	background-color: #f2f2f2;
	height: 100%;
}

.chat-user-info .user-profile {
	display: inline-block;
	float: left;
}

.chat-user-info  .user-profile-picture {
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

.chat-user-info .user-profile-picture img {
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

.chat-user-info .service-info {
	display: inline-block;
	float: none;
	margin-left: 10px;
}

.chat-user-info .service-info h5 {
	width: 100%;
	display: inline-block;
	margin-bottom: 2px;
	margin-top: 2px;
	font-weight: bold;
	font-size: 18px;
}

.chat-user-info .service-info p {
	font-size: 1.5rem;
	line-height: 1.625rem;
	max-height: 1.625rem;
	margin-bottom: 0;
	margin-top: 2px;
	color: black;
}

.chat-user-info .match_btn {
	float: right;
	vertical-align: middle;
}

.chat-user-info .match_btn #match-btn {
	display: inline-block;
	border-radius: 4px;
	font-size: 1.25rem;
	font-weight: bold;
	color: #00C7AE;
	line-height: 1.5;
	height: auto;
	padding: 1.05rem 4rem;
	cursor: pointer;
	border: .0625rem solid #00C7AE;
	box-sizing: border-box;
	line-height: 1.5
}

.chat-message {
	height: 100%;
	padding: 144px 0 60px;
	overflow-x: hidden;
}

.chat-message-body {
	overflow-y: scroll;
	overflow-x: hidden;
	height: 683px;
}

.chat-message-input {
	position: absolute;
	bottom: auto;
	left: 0;
	width: 100%;
	padding-top: 5px;
	padding-bottom: 5px;
	border: 1px solid #e1e1e1;
}

.chat-message-input .chat-message-input-body {
	position: relative;
	width: 100%;
	transition: transform .2s ease-out, -webkit-transform .2s ease-out;
}

.chat-input-itmes {
	background-color: #fff;
	height: auto;
	min-height: 60px;
}

.profile-img {
	font-size: .875rem;
	line-height: 1.3125rem;
	font-weight: 400;
	letter-spacing: -.0125rem;
}

.profile-img img {
	display: inline-block;
	width: 4rem;
	height: 4rem;
}

.chat-input-profilearea {
	padding: 0 .8rem;
	display: inline-block;
}

.chat-input-textandbtn {
	height: 40px;
	float: right;
}

.chat-input-textarea {
	display: inline-block;
	float: left;
	padding-top: 3px;
	padding-bottom: 3px;
}

.chat-input-textarea textarea {
	vertical-align: middle;
	background-color: rgba(0, 0, 0, 0);
	border: none;
	width: 100%;
	border-radius: 4px;
	font-size: 1.5rem;
	box-shadow: none;
	caret-color: #00c7ae;
	height: 34px;
	line-height: 27px;
	width: 1304px;
	margin-right: 10px;
	margin-top: 2px;
}

.chat-input-send-btn {
	float: right;
	font-size: .875rem;
	line-height: 1.3125rem;
	font-weight: 400;
	letter-spacing: -.0125rem;
	margin-right: 10px;
	margin-top: 4px;
}

#send-btn {
	padding: 0px;
}

.chat-input-send-btn img {
	display: inline-block;
	width: 3rem;
	height: 3rem;
	vertical-align: middle;
}

.data-li {
	list-style: none;
}

.chat-content {
	margin: 12px 0;
}

.chat-profile {
	display: inline-block;
	vertical-align: top;
	margin-right: .6rem;
}

.chat-user-profile {
	width: 2.5rem;
	height: 2.5rem;
}

.chat-user-profile-img img {
	width: 2.5rem;
	height: 2.5rem;
	border-radius: 50%;
}

.chat-name {
	display: inline-block;
}

.chat-user-name {
	display: inline-block;
	vertical-align: middle;
}

.chat-contents-frame {
	display: inline-block;
	vertical-align: middle;
	margin-left: 20px;
	border: solid 1px white;
	background-color: white;
	border-radius: 10px;
	max-width: 40%;
}

.chat-contents-frame-ar{
	display: inline-block;
	vertical-align: middle;
	margin-left: 20px;
	border: solid 1px white;
	background-color: white;
	border-radius: 10px;
	max-width: 40%;
	text-align: left;
	border-width: 20px;
}


.chat-contents {
	display: inline-block;
	padding: 10px;
	margin-bottom: 0px;
}

.data-li-sender {
	text-align: right;
	list-style: none;
}

.chat-profile-sender {
	vertical-align: top;
}

.chat-user-profile-sender {
	display:inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

.chat-user-profile-img-sender img {
	width: 4.5rem;
	height: 4.5rem;
	border-radius: 50%;
}


  .user-info{
     margin-top : 70px;
     padding-top : 10px;
    border-bottom: 1px solid #E0E0E0;
    }
    
    h4{
    font-weight:bold;
        display: inline-block;
    margin-right: .5rem;
    margin-bottom: 0;
    }
    
    h6{
    display: inline-block;
    margin-right: .5rem;
    margin-bottom: 0;
    }
    
   #user-pciture{
   	padding-right: 0px;
   	padding-top: 8px;
   
   }
    
 .user-profile-picture  {
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
}

 .user-profile-picture img
	{
	display: inline-block;
	width: 4.5rem;
	height: 4.5rem;
	border-radius: 50%;
}

h5{
  line-height: 2rem;
font-size: 1.5rem;
}
.request-list{
list-style: none;
padding-top : 20px;
padding-left : 10px;
}

.strongQ{
	font-weight: bold;
}

#request-info{
padding-top :45px;
	    overflow-y: scroll;
	height: 100%;
	padding-bottom: 35px;


}

h2{
margin-top: 10px;
color :  #00c7ae;
   
   margin-bottom: 20px;}
</style>

</head>
<body>
	<div id="app-body">
		<div class="chat-room container-fluid">
			<div class="chat-room-field">
				<section id="request-info" class="col-md-3"> </section>
				<section class="col-md-9 chating">
				<div class="chat-header">
					<div class="chat-header-container">
						<div class="chat-header-controller">
							<div class="back-btn">
								<a href="/expert/chatlist"> <img
									src="/resources/images/back_btn.png">
								</a>
							</div>
						</div>
						<div class="chat-user-info">
							
							
						</div>
					</div>
				</div>
				<div class="chat-message">
					<div class="chat-message-body">
						<ul id=data>
						</ul>
					</div>
				</div>
				<div class="chat-message-input">
					<div class="chat-message-input-body">
						<div class="chat-input-items">
							<div class="chat-input-profilearea">
								<div class="profile-img">
									<img src="/resources/images/default.jpg">
								</div>
							</div>
							<div class="chat-input-textandbtn">
								<div class="chat-input-textarea">
									<textarea name="message-input-textarea"
										placeholder="메시지를 입력하세요." wrap="soft" id="textform"></textarea>
								</div>
								<div class="chat-input-send-btn">
									<button id="send-btn">
										<img src="/resources/images/send.png">
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		
		
		var _crno = ${crno};
	
		
		chatroomService.getInfo(_crno,function(list) {
			console.log(list);
			
			var str = "";
			
			str += "<div class='user-profile'>"
			str += "<div class='user-profile-picture'>"
				if (list.member.m_Photo == 'null') {
					str += "<img src='/resources/images/default.jpg'/>"
				}else{
					str += "<img src='/upload/profile/" +list.member.m_Photo  + "'/>";
				} 
			str += "</div>"
			str += "</div>"
			str += "<div class='service-info'>"
			str += "<h5>" + list.member.m_Name +"</h5>"
			str += "<p>" + list.part.p_S_Word + " " + list.part.p_L_Word + "</p>"
			str += "</div>"
			
			
			$(".chat-user-info").html(str);
			
			
			$("#data").append(
					"<li class='data-li-sender'><div class='chat-content'>"
							+ "<div class='chat-contents-frame-ar'>"
							+ "<h2> 숨고 알리미 </h2>"
							+ "<span class=strongQ>"
							+ list.expert.e_Name +" 고수님의 예상금액이 도착했습니다." + "</span><br><br>"
							+ "<span>" + "서비스 : " + list.part.p_S_Word + " " + list.part.p_L_Word   + "</span><br>"
							+ "<span>" + "예상금액 : " + list.estimate.e_AmountPart + " " + list.estimate.e_Amount + "</span>" + "</div>"
						    + "</div>" + "</li>");
			
			$("#data").append(
					"<li class='data-li-sender'><div class='chat-content'>"
							+ "<div class='chat-contents-frame-ar'>"
							+ "<p class='chat-contents'>" + "<span>"
							+ list.estimate.e_Contents + "</span></p></div>"
							+ "<div>" + "<p>" + "<span>" + list.estimate.e_Date + "</span>"
							+ "</p>" + "</div>" + "</div>" + "</li>");
			
			
			
			var _seq = list.link.l_Seq;
			
			
			linkService.get(_seq, function(data) {
				console.log(data);

				
				var sttr = "";
				
				
				sttr += "<div id='user-name' class='col-md-9'>"
				sttr += "<div >"
				sttr += "<div>"
				sttr += "<h4>" + data.m_Name + "</h4>"
				sttr += "</div>"
				sttr += "<h6 class='part'>" + data.p_S_Word +  " " +data.p_L_Word + "</h6>"
				sttr += "</div>"
				sttr += "</div>"
				sttr += "<div id='user-pciture' class='col-md-3'>"
				sttr += "<div class='user-profile'>"
				sttr += "<div class='user-profile-picture'>"
				if (data.m_Photo == 'null') {
					sttr += "<img src='/resources/images/default.jpg'/>"
				}else{
					sttr += "<img src='/upload/profile/" +data.m_Photo  + "'/>";
				}
				sttr += "</div>"
				sttr += "</div>"
				sttr += "</div>"
				sttr += "<div class='user-info'>"
				sttr += "</div>"
				sttr += "<ul class='request-list'>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " + data.r_Q_01 + "</h5>"
				sttr += "<h5>" + data.r_A_01 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_02 + "</h5>"
				sttr += "<h5>" + data.r_A_02 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_03 + "</h5>"
				sttr += "<h5>" + data.r_A_03 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_04 + "</h5>"
				sttr += "<h5>" + data.r_A_04 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_05 + "</h5>"
				sttr += "<h5>" + data.r_A_05 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_06 + "</h5>"
				sttr += "<h5>" + data.r_A_06 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_07 + "</h5>"
				sttr += "<h5>" + data.r_A_07 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_08 + "</h5>"
				sttr += "<h5>" + data.r_A_08 + "</h5>"
				sttr += "</li>"
				sttr += "<li class='request-item'>"
				sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_09 + "</h5>"
				sttr += "<h5>" + data.r_A_09 + "</h5>"
				sttr += "</li>"
				if (data.r_Q_10 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_10 + "</h5>"
					sttr += "<h5>" + data.r_A_10 + "</h5>"
					sttr += "</li>"
				}
				if (data.r_Q_11 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_11 + "</h5>"
					sttr += "<h5>" + data.r_A_11 + "</h5>"
					sttr += "</li>"
				}
				if (data.r_Q_12 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_12 + "</h5>"
					sttr += "<h5>" + data.r_A_12 + "</h5>"
					sttr += "</li>"
				}
				if (data.r_Q_13 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_13 + "</h5>"
					sttr += "<h5>" + data.r_A_13 + "</h5>"
					sttr += "</li>"
				}
				if (data.r_Q_14 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_14 + "</h5>"
					sttr += "<h5>" + data.r_A_14 + "</h5>"
					sttr += "</li>"
				}
				if (data.r_Q_15 != "null") {
					sttr += "<li class='request-item'>"
					sttr += "<h5 class='strongQ'>" + "Q. " +  data.r_Q_15 + "</h5>"
					sttr += "<h5>" + data.r_A_15 + "</h5>"
					sttr += "</li>"
				}
				sttr += "</ul>"
				sttr += "</div>"
				sttr += "</div>"

					$("#request-info").html(sttr);
			});
		
			
			
			
		})
		
		
		

		$("#send-btn").click(function() {

			sendMessage();
			$('#textform').val('')
		});

		$("#textform").keydown(function(key) {

			if (key.keyCode == 13) {// 엔터

				key.preventDefault();

				sendMessage();

				$('#textform').val('')

			}

		});

	});

	connect();

	
  
	
	function getTimeStamp() {
		   var d = new Date();
			   if(leadingZeros(d.getHours(), 2) < 12){
			    	 var str = '오전';
			    	var s = str + leadingZeros(d.getHours(), 2) + ':' +
				     leadingZeros(d.getMinutes(), 2);
			    	 return s;
			    	 
			     } else{
			    	 var str ='오후';
			    	 var s = str + (leadingZeros(d.getHours(), 2)-12) + ':' +
				     leadingZeros(d.getMinutes(), 2);
			    	 return s;
			     }
		 }

		 function leadingZeros(n, digits) {
		   var zero = '';
		   n = n.toString();

		   if (n.length < digits) {
		     for (i = 0; i < digits - n.length; i++)
		       zero += '0';
		   }
		   return zero + n;
		 }
	
	 function connect() {
		    sock = new SockJS('/chating');
		    sock.onopen = function() {
		        console.log('open');
		    };
		    sock.onmessage = function(evt) {
	    	 var data = evt.data;
	    	   console.log(data)
	  		   var obj = JSON.parse(data)  	   
	    	   console.log(obj)
	    	   appendMessage(obj);
		    };
		    sock.onclose = function() {
		    	$("#data")
				.append("연결 종료");
		        console.log('close');
		    };
		}
	
	
	function sendMessage() {
		var msg = $("#textform").val();
		if (msg != "") {
			chat = {};
			chat.ch_Contents = $("#textform").val()
			chat.ch_Sender = '${loginUser.m_Name}'
			chat.crno = ${crno}
		}

		sock.send(JSON.stringify(chat));
		$("#message").val("");
	}

	function  appendMessage(msg) {

		if(msg == ''){
			 return false;
		 }else{
			 
		if(msg.ch_Sender ==  '${loginUser.m_Name}'){
		 var t = getTimeStamp();
		$("#data")
				.append(
						"<li class='data-li-sender'><div class='chat-content'>"
						+ "<div class='chat-contents-frame'>" 
						+ "<p class='chat-contents'>" + "<span>"
						+ msg.ch_Contents + "</span></p></div>"
						+ "<div>" 
						+ "<p>"
						+ "<span>"
						+ t 
						+ "</p>"
						+ "</span>"
						+ "</div>"
						+ "</div>"
						+ "</li>");

		var chatAreaHeight = $(".chat-message-body").height();
		var maxScroll = $("#data").height() - chatAreaHeight;
		$(".chat-message-body").scrollTop(maxScroll);
		}else {
			 var t = getTimeStamp();
			 $("#data").append("<li class='data-li'><div class='chat-content'>"
										+ "<div class='chat-profile-sender'>"
										+ "<div class='chat-user-profile-sender'>"
										+ "<div class='chat-user-profile-img-sender'>"
										+ "<img src='/resources/images/default.jpg'></div></div>"
										+ "<div class='chat-name'>"
										+ "<p class='chat-user-name'>"
										+ "<span>" + '${loginUser.m_Name}' + "</span>"
										+ "</p>"
										+ "</div>"
										+ "<div class='chat-contents-frame'>" 
										+ "<p class='chat-contents'>" + "<span>"
										+ msg.ch_Contents + "</span></p></div>"
										+ "<div>" 
										+ "<p>"
										+ "<span>"
										+ t 
										+ "</p>"
										+ "</span>"
										+ "</div>"
										+ "</div>"
										+ "</li>");

				var chatAreaHeight = $(".chat-message-body").height();
				var maxScroll = $("#data").height() - chatAreaHeight;
				$(".chat-message-body").scrollTop(maxScroll);
			
		}
	}
	}


</script>


</html>