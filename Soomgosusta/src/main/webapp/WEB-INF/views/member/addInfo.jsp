<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/memberAddInfo.js"></script>
<link rel="stylesheet" href="/resources/css/addInfo.css">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
$('document').ready(function() {
       $('#part_select2').css('display', 'none');
       $('#part_select3').css('display', 'none');
       
    $("#1_btn").on("click", function getMWordsList(){
       var LWord = $('input:radio[id="large1"]:checked').val();
       console.log(LWord);
       memberAddInfoService.getMWords(LWord, function(list){
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                       str+="<div id='first_select_MWord'>"
                       str += "<ul><li class ='listpart'><div class = 'radio_btn'><label><input name='medium1' id='medium1' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                      
                                 console.log(list[i]);
                 }
                str += "<br><button type='button' id='pre1_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' id='next2_btn'>다음</button>";
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
                str += "<br><button type='button' id='pre2_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' id='next3_btn'>두번 째 관심분야 선택하러 가기</button>";
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
                str += "<br><button type='button' id='pre3_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' id='next4_btn'>이후</button>";
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
                str += "<br><button type='button' id='pre4_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' id='next5_btn'>세번 째 관심분야 선택하러 가기</button>";
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
                str += "<br><button type='button' id='pre6_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                        str += "<button type='button' id='next7_btn'>이후</button>";
                        str += "</div>"
                $("#third_select_LWord").css('display','none');
                 $("#third_select_LWord").after(str);
           });
   });
  
   $("#part_select3").on("click","#next7_btn" ,function getSWordsList(){
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
                str += "<br><button type='button' id='pre7_btn'>이전</button>&nbsp;&nbsp;&nbsp;";
                 str+="<input type='submit' value='입력완료' id = 'hidden'>" 
                        str +="</div>";
                $("#third_select_MWord").css('display','none');
                 $("#third_select_MWord").after(str);
           });
   });
 
});

 
      
       </script>
       <form id="AddInfoForm" name="AddInfoForm" action="/request/sendRequest/${m_Id}" method="post">
             <div id="part_select1">
             <h2>관심있는 분야를 선택해주세요(최대 3개)</h2>
             <div id="first_select_LWord">
                    <c:forEach var="large" items="${large }">
             <input name="large1" id="large1" type="radio" value="${large }">${large }<br>
                    </c:forEach>
                    <br>
                    <button type="button" id="1_btn">다음</button>
             </div>
       </div>
      
        <div id="part_select2">
             <div id="second_select_LWord">
                    <c:forEach var="large" items="${large }">
             <input name="large2" id="large2" type="radio" value="${large }">${large }<br>
                    </c:forEach>
                    <button type="button" id="2_btn">다음</button>
             <br><br><br>
 </div>
       </div>
      
       <div id="part_select3">
                    <div id="third_select_LWord">
                    <c:forEach var="large" items="${large }">
             <input name="large3" id="large3" type="radio" value="${large }">${large }<br>
                    </c:forEach>
                    <button type="button" id="3_btn">다음</button>
             <br><br><br>
             </div>
       </div>		
       
       <!-- <div role="tabpanel" class="tab-pane" id="category">
			<h3>서비스 카테고리</h3>
			<div class="tag-container">

			</div>
			<p class="strong">관심있는 분야를 선택해주세요!</p>
			<div class="path">
				<span id="id_path_category1" class="hide"></span> <span
					id="id_path_category2" class="hide"></span> <span
					id="id_path_service" class="hide"></span>
			</div>
			<div id="id_list_category1">

				<div class="category1" data-category1="29" data-category1-label="레슨">
					레슨</div>

				<div class="category1" data-category1="30"
					data-category1-label="홈 리빙">홈/리빙</div>

				<div class="category1" data-category1="31"
					data-category1-label="이벤트">이벤트</div>



				<div class="category1" data-category1="33"
					data-category1-label="디자인/개발">디자인/개발</div>

				<div class="category1" data-category1="34"
					data-category1-label="건강/미용">건강/미용</div>

				<div class="category1" data-category1="36" data-category1-label="알바">
					알바</div>

				<div class="category1" data-category1="35" data-category1-label="기타">
					기타</div>

			</div>
			<ul id="id_list_category2" class="list-group hide"></ul>
			<ul id="id_list_service" class="list-group hide"></ul>
		</div><br><br><br> -->
       
       </form>
</body>
</html>