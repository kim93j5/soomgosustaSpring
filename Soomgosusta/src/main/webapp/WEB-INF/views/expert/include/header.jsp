<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/socket.js"></script> -->
<link rel="stylesheet" href="/resources/css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
   <script type="text/javascript">
   
   var ws = new WebSocket("ws://localhost:8081/alarm/websocket");
   
   $(document).ready(function(){
      
      send_message();
      //$('#count').css('display','none');
      
       $("#alarm").on("click","#count" ,function getAlarmList(){
          
          $('#getAlarmList').toggle();
       });

   });
   
   function send_message() {
      
      ws.onopen = function(evt) {
           onOpen(evt);
       };
       ws.onmessage = function(evt) {
           onMessage(evt);
       };
       ws.onerror = function(evt) {
           onError(evt);
       };
       ws.onclose = function(evt) {
          onClose(evt);
       };
   }
   function onOpen(evt) 
   {
      console.log("아아");
      ws.send("안녕하세요........");
   }
   function onMessage(msg){
      var data = msg.data;
      $("#alarm").append( msg.data);
}

function onClose(evt){
   console.log("안녕");
}

    </script>

<title>Insert title here</title>
   <script type="text/javascript">
   
   var ws = new WebSocket("ws://localhost:8081/alarm/websocket");
   
   $(document).ready(function(){
      
      send_message();
      //$('#count').css('display','none');
      
       $("#alarm").on("click","#count" ,function getAlarmList(){
          
          $('#getAlarmList').toggle();
       });
   });
   
   function send_message() {
      
      ws.onopen = function(evt) {
           onOpen(evt);
       };
       ws.onmessage = function(evt) {
           onMessage(evt);
       };
       ws.onerror = function(evt) {
           onError(evt);
       };
       ws.onclose = function(evt) {
          onClose(evt);
       };
   }
   function onOpen(evt) 
   {
      console.log("아아");
      ws.send("안녕하세요........");
   }
   function onMessage(msg){
      var data = msg.data;
      $("#alarm").append( msg.data);
}

function onClose(evt){
   console.log("안녕");
   $('#getAlarm').append("연결 끊김");
}

    </script>
</head>
<body>
   <c:set var='expert' value="${expert}" scope="request" />
   <c:set var='member' value="${member}" scope="request" />

   <div class="banner">
      <c:choose>
         <c:when test="${loginUser.user_Divide =='expert'}">
            <div class="left_">
               <div>
                  <a href="/main/mainPage"> <img
                     src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
                     alt="숨고, 숨은고수">
                  </a>
               </div>
               <div>
                  <a href="/expert/request/received"> <span>받은
                        요청</span>
                  </a>
               </div>
               <div>
                  <a href="/expert/profile?e_Id=${loginUser.e_Id}"><span>프로필</span></a>
               </div>
               <div>
                  <a href="/scheduler/expertScheduler"> <span>일정</span>
                  </a>
               </div>
               <div>
                  <a href="/expert/chatlist"> <span>채팅</span>
                  </a>
               </div>
            </div>
            <div class="right_">
            <div id="alarm">
                    알림
               </div>
               <div>
                  <span>"${loginUser.e_Name}"고수님</span>
               </div>
               <div>
                  <a id="logout" href="/main/logout"><span>로그아웃</span></a>
               </div>
            </div>
         </c:when>


         <c:when test="${loginUser.user_Divide =='member'}">
            <div class="left_">
               <div>
                  <a href="/main/mainPage"> <img
                     src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
                     alt="숨고, 숨은고수">
                  </a>
               </div>
               <div>
                  <a href="/request/sendRequest/${loginUser.m_Id}"> <span>보낸
                        요청</span>
                  </a>
               </div>
                <div>
                  <a href="/member/mypage/${loginUser.m_Id }"><span>프로필</span></a>
               </div>
               <div>
                  <a href="/member/addInfo/${loginUser.m_Id }"><span>부가정보 입력</span></a>
               </div>
               <div>
                  <a href="/expert/listExpertFind"> <span>고수 찾기</span>
                  </a>
               </div>
               <div>
                  <a href=""> <span>채팅</span>
                  </a>
               </div>
            </div>
            <div class="right_">
            <div id="alarm">
                    알림
               </div>
               <div>
                  <span>"${loginUser.m_Name}"고객님</span>
               </div>
               <div>
                  <a id="logout" href="/main/logout"><span>로그아웃</span></a>
               </div>
            </div>
         </c:when>
         <c:otherwise>
            <div class="left_">
            
               <div>
                  <a href="/main/mainPage"> <img
                     src="https://dmmj3ljielax6.cloudfront.net/static/img/home/index_soomgo_logo.svg"
                     alt="숨고, 숨은고수">
                  </a>
               </div>
               <div>
                  <a href="/expert/listExpertFind"> <span>고수 찾기</span>
                  </a>
               </div>
            </div>
            <div class="right_">
               <div>
                  <a href="/main/regist">회원가입</a>
               </div>
               <div>
                  <div class="select">
                     <select name="" id="loginState">
                        <option value="member">회원</option>
                        <option value="expert">고수</option>
                     </select> <a id="loginteg" >로그인</a>
                  </div>
               </div>
            </div>
         </c:otherwise>
      </c:choose>
   </div>

</body>
 <script>
 $(document).ready(function(){
   $("#loginState").click(function(){
            var state = $("#loginState option:selected").val();
            if (state == "member") {
               var str = '<a href="' + "/member/login" + '">로그인</a>';
               $('#loginteg').html(str); 

            } else if (state == "expert") {
               var str = '<a href="' + "/expert/login" + '">로그인</a>';
               $('#loginteg').html(str); 

            }

         });
      });
      


 
 </script>
</html>