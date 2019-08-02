<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/memberAddInfo.js"></script>
<link rel="stylesheet" href="/resources/css/addInfo.css">
<script type="text/javascript">
$('document').ready(function() {
       $('#part_select2').css('display', 'none');
       $('#part_select3').css('display', 'none');
       
    $("#1_btn").on("click", function getMWordsList(){
       var LWord = $('input:radio[id="large1"]:checked').val();
       /* var m_Id = "<c:out value ='${loginUser.m_Id}'/>"; */
       console.log(LWord);
       memberAddInfoService.getMWords(LWord, function(list){
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                       str+="<div id='first_select_MWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='medium1' id='medium1' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                                // console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre1_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' class='next' id='next2_btn'>다음</button></div>";
                        str += "</div>"
                $("#first_select_LWord").css('display','none');
                 $("#part_select1").append(str);
           });
       
       
    });
   
    $("#part_select1").on("click","#next2_btn" ,function getSWordsList(){
       var MWord = $('input:radio[id="medium1"]:checked').val();
       var LWord = $('input:radio[id="large1"]:checked').val();
       console.log(MWord);
       console.log(LWord);
       memberAddInfoService.getSWords(LWord,MWord, function(list){
             console.log(MWord);
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                      str+="<div id='first_select_SWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='small1' id='small1' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre2_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button'class='next' id='next3_btn'>두번 째 관심분야 선택하러 가기</button></div>";
                        str +="</div>";
                $("#first_select_MWord").css('display','none');
                 $("#first_select_MWord").after(str);
           });
    });
   
    $("#part_select1").on("click","#next3_btn" ,function getSecondSelect(){
        $("#first_select_SWord").css('display','none');     
       $("#part_select2").css('display','block');
       var MWord = $('input:radio[id="medium1"]:checked').val();
       var LWord = $('input:radio[id="large1"]:checked').val();
       var SWord = $('input:radio[id="small1"]:checked').val();
       
    });
    $("#2_btn").on("click", function getMWordsList(){
       var LWord = $('input:radio[id="large2"]:checked').val();
       console.log(LWord);
       memberAddInfoService.getMWords(LWord, function(list){
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                       str+="<div id='second_select_MWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='medium2' id='medium2' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre3_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' class='next' id='next4_btn'>다음</button></div>";
                        str += "</div>"
                $("#second_select_LWord").css('display','none');
                 $("#second_select_LWord").after(str);
           });
    });
   
    $("#part_select2").on("click","#next4_btn" ,function getSWordsList(){
       var MWord = $('input:radio[name="medium2"]:checked').val();
       var LWord = $('input:radio[id="large2"]:checked').val();
       console.log(MWord);
       console.log(LWord);
       memberAddInfoService.getSWords(LWord,MWord, function(list){
             console.log(MWord);
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                      str+="<div id='second_select_SWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='small2' id='small2' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre4_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' class='next' id='next5_btn'>세번 째 관심분야 선택하러 가기</button></div>";
                        str +="</div>";
                $("#second_select_MWord").css('display','none');
                 $("#second_select_MWord").after(str);
           });
    });
    $("#part_select2").on("click","#next5_btn" ,function getThirdSelect(){
        $("#second_select_SWord").css('display','none');    
       $("#part_select3").css('display','block');
   });
   $("#3_btn").on("click", function getMWordsList(){
       var LWord = $('input:radio[id="large3"]:checked').val();
       console.log(LWord);
       memberAddInfoService.getMWords(LWord, function(list){
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                       str+="<div id='third_select_MWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='medium3' id='medium3' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre6_5tn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' class='next' id='next6_btn'>다음</button></div>";
                        str += "</div>"
                $("#third_select_LWord").css('display','none');
                 $("#third_select_LWord").after(str);
           });
   });
  
   $("#part_select3").on("click","#next6_btn" ,function getSWordsList(){
       var MWord = $('input:radio[id="medium3"]:checked').val();
       var LWord = $('input:radio[id="large3"]:checked').val();
       console.log(MWord);
       console.log(LWord);
       memberAddInfoService.getSWords(LWord,MWord, function(list){
             console.log(MWord);
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                      str+="<div id='third_select_SWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='small3' id='small3' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><div class='btn'><button type='button' class='pre' id='pre6_btn'>이전</button>";
                 str+="<input type='submit' class='next' value='입력완료' ></div>" 
                        str +="</div>";
                $("#third_select_MWord").css('display','none');
                 $("#third_select_MWord").after(str);
           });
   });
}); 
</script>
<title>Insert title here</title>

</head>
<body style="background-color: #FAFAFA">
  <form id="AddInfoForm" name="AddInfoForm" action="/request/sendRequest/${loginUser.m_Id}" method="post">
             <div id="part_select1">
             <h2>관심있는 분야를 선택해주세요(최대 3개)</h2>
             <div id="first_select_LWord">
                    <c:forEach var="large" items="${large }">
             <ul><li class ='listpart'><div class = 'radio_btn'><label><input name="large1" id="large1" type="radio" value="${large }">${large }<br></label></div></li></ul>
                    </c:forEach>
                    <br>
                    <div id="11_btn">
                    <button type="button" class="next" id="1_btn">다음</button>
                    </div>
             </div>
       </div>
      
        <div id="part_select2">
             <div id="second_select_LWord">
                    <c:forEach var="large" items="${large }">
             <ul><li class ='listpart'><div class = 'radio_btn'><label><input name="large2" id="large2" type="radio" value="${large }">${large }<br></label></div></li></ul>
                    </c:forEach>
                    <button type="button" class='next' id="2_btn">다음</button>
             <br><br><br>
 </div>
       </div>
      
       <div id="part_select3">
                    <div id="third_select_LWord">
                    <c:forEach var="large" items="${large }">
            <ul><li class ='listpart'><div class = 'radio_btn'><label><input name="large3" id="large3" type="radio" value="${large }">${large }<br></label></div></li></ul>
                    </c:forEach>
                    <button type="button" class='next' id="3_btn">다음</button>
             <br><br><br>
             </div>
       </div>		
       

       </form>
</body>

</html>