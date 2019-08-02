<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <header>
   <jsp:include page="../includes/header.jsp"></jsp:include>
</header> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/expertInfo.js"></script>
<link rel="stylesheet" href="/resources/css/expertInfo.css" target="text/css">
<link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

p{
    margin-bottom: 30px;
    line-height: 1.7;
}

h1 {
    display: block;
    font-size: 24px;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    font-family: 'Nanum Gothic Coding', monospace;
}

label{
  height: 21px;
  font-size: 16px;
  font-family: 'Nanum Gothic Coding', monospace;
  margin: 0px, 0px, -6px;
  margin-left: 2px;
}


li {
    text-align: -webkit-match-parent;
}


</style>
</head>
<body style="background-color: #FAFAFA">

   <!----------------------- 활동가능 지역 ------------------------>
   <script type="text/javascript">
$(document).ready(function() {
   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구",     "북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성구"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 // 시/도 선택 박스 초기화

   $("select[name^=sido]").each(function() {
     $selsido = $(this);
     $.each(eval(area0), function() {
     $selsido.append("<option value='"+this+"'>"+this+"</option>");
    });
     $selsido.next().append("<option value=''>구/군 선택</option>");
   });

 // 시/도 선택시 구/군 설정

   $("select[name^=sido]").change(function() {
       var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
       var $gugun = $(this).next(); // 선택영역 군구 객체
       $("option",$gugun).remove(); // 구군 초기화

       if(area == "area0")
        $gugun.append("<option value=''>구/군 선택</option>");
       else {
        $.each(eval(area), function() {
         $gugun.append("<option value='"+this+"'>"+this+"</option>");
        });
       }
      });

});


$(document).on("click", ".next1", function getMWordsList(){
   
       var LWord = $('input:radio[id="large"]:checked').val();
       console.log(LWord);
       expertInfoService.getMWords(LWord, function(list){
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                       str +="<div id='first_select_MWord'>"
                       str += "<ul><li class = 'listpart'><div class = 'radio_btn'><label><input name='medium' id='medium' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
     
                   
                                 console.log(list[i]);
                 }
                     str += "<br><button type='button' id='prev1'>< 이전</button>&nbsp;";
                     str += "<button type='button' id='next2'>다음 ></button>";
                     str += "</div>"
                 $("#first_select_LWord").css('display','none');
                 $(".part").css('display','none'); 
                 $("#detailPart1").css('display','block'); 
                 $(".detailPart1").css('display','block'); 
                 $("#part_select1").append(str);
        });       

    $("#part_select1").on("click","#next2" ,function getSWordsList(){
       var MWord = $('input:radio[id="medium"]:checked').val();
       var LWord = $('input:radio[id="large"]:checked').val();
       console.log(MWord);
       console.log(LWord);
       expertInfoService.getSWords(LWord,MWord, function(list){
             console.log(MWord);
             console.log(LWord);
             var str = "";
                 for(var i = 0, len = list.length||0;i<len;i++){
                      str+="<div id='first_select_SWord'>"
                      str += "<ul><li class = 'listpart'><div class = 'radio_btn'><label><input name='small' id='small' type = 'radio' value='"+list[i]+"'>"+list[i]+"<br></label></div></li></ul>";
                   
                              console.log(list[i]);
                 }
                 str += "<br><button type='button' id='prev2'>< 이전</button>&nbsp;";
                 str += "<button type='button' id='next3'>다음 ></button>";
                 str +="</div>";
                 $("#first_select_MWord").css('display','none');
                 $("#first_select_MWord").after(str);
                 $("#detailPart1").css('display','none'); 
                 $("#detailPart2").css('display','block'); 
                 $(".detailPart1").css('display','none'); 
                 $(".detailPart2").css('display','block'); 
                 
        });
    });

    $("#part_select1").on("click","#next3" ,function getSecondSelect(){
        $("#first_select_SWord").css('display','none');     
        $(".part").css('display','none');
        $('#select_Question').css('display', 'block');
        $('#select_Answer').css('display', 'block');
        $("#detailPart2").css('display','none'); 
        $(".detailPart2").css('display','none'); 
        $('#hidden').css('display', 'none');
     
       var MWord = $('input:radio[id="medium"]:checked').val();
       var LWord = $('input:radio[id="large"]:checked').val();
       var SWord = $('input:radio[id="small"]:checked').val();
    
    });
});

</script>
<div id="container">
<form name=form method="post" id="form" action="/expert/request/received/${loginUser.e_Id }">

   <!----------------------- 분야 대/중/소 ------------------------>
   <div id="part_select1">
      <h1 class="part">전문가로 활동하시는 분야를 선택해주세요.</h1>
      
      <div id="detailPart1"><h1 class="detailPart1">고수님 반갑습니다.<p>어떤 서비스를 제공하실 수 있나요?</p></h1>
      <p class="detailPart1">전문적으로 하시는 일을 알려주시면 서비스를 필요로 하는 고객을 연결시켜 드립니다.</p>
      </div>
      
      <div id="detailPart2"><h1 class="detailPart2">구체적으로 어떤 서비스를 제공할 수 있나요?</h1>
      <p class="detailPart2">진행하고자 하는 서비스에 대해 알려주세요. 딱!맞는 분을 연결시켜 드릴게요.</p>
      </div>
     
     <div id="first_select_LWord">
      <c:forEach var="large" items="${large}">
        <ul>        
          <li class="listpart">
            <div class="radio_btn">
              <label><input id="large" name="large" type="radio" value="${large}">${large}<br></label>
            </div>
          </li> 
        </ul>
      </c:forEach>
      <br>
      <div id="next1">
      <button type="button" class="next1">다음 ></button>
      </div>
     </div>
   </div>

   <!-------------------- 시간대/시작날짜/성별 -------------------->
   <div id="select_Question">
       <c:forEach var="listQuestion" items="${listQuestion}">
            <input type="hidden" name="q_Seq" value="${listQuestion.q_Seq}">
         <div id="select_Answer" style="display: block;">
            <h1 class="question">${listQuestion.q_Contents}</h1>
            <ul class="addInfo">
               <c:forEach var="listAnswer" items="${listAnswer}">
                    <c:if test="${listAnswer.q_Seq == listQuestion.q_Seq}">
                     <li class="answer">
                          <div class="radio_btn">
                             <label><input type="checkbox" name="a_Seq" value="${listAnswer.a_Seq}">
                                   ${listAnswer.a_Contents }</label>
                         </div>
                     </li>
                  </c:if>
               </c:forEach>
            </ul>
         </div>

      </c:forEach>
           <button type="button" id="prev4"> < 이전  </button>         
           <button type="button" id="next4"> 다음 > </button>
      
   </div>

   <!----------------------- 활동가능 지역 ------------------------>
   <div id="select_District">
      <div id="detailPart3"><h1 class="detailPart3">활동 가능한 지역을 선택해주세요(최대3개)</h1>
      <p>위치를 알려주세요. 근처의 고객을 찾는데 도움이 됩니다.</p></div>
      <div id="district_select1">
         <select name="sido" id="sido"></select> 
         <select name="sigungu" id="sigungu"></select> <br>
         <button type="button" id="addDistrict1"> + </button>
      </div>

      <div id="district_select2">
         <select name="sido" id="sido"></select> 
         <select name="sigungu" id="sigungu"></select> <br>
         <button type="button" id="addDistrict2"> + </button>
      </div>

      <div id="district_select3">
         <select name="sido" id="sido"></select> 
         <select name="sigungu"id="sigungu"></select> <br>
      </div>
      
      <button type="button" id="prev5"> < 이전 </button>
      <input type="submit" value="회원가입완료" id="hidden">
   </div>
</form>
</div>
</body>
</html>