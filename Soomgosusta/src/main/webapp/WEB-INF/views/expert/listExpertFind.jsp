<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
   <jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/listExpertFind.js"></script>
<link rel="stylesheet" href="/resources/css/listExpertFind.css">
<script type="text/javascript">
function clickBtn(){
   console.log($(this).data("id"));
}

$('document').ready(function(){
   $('#getfilter').click(function(){
      $('.filter').toggle();
   });
   
   $('.f').change(function(){
      if($('input:checkbox[name=orderByEC]').is(':checked') == true){
         $('input:checkbox[name=orderByEC]').val("checked");
      }else{
         $('input:checkbox[name=orderByEC]').val("not");
      }

      if($('input:checkbox[name=orderByRevC]').is(':checked') == true){
         $('input:checkbox[name=orderByRevC]').val("checked");
      }else{
         $('input:checkbox[name=orderByRevC]').val("not");
      }
      
      if($('input:checkbox[name=orderBySP]').is(':checked') == true){
         $('input:checkbox[name=orderBySP]').val("checked");
      }else{
         $('input:checkbox[name=orderBySP]').val("not");
      }
      
      var sido = $('#sido').val();
      var gugun = $('#gugun').val();
      var service = $('#service').val();
      var serviceInfo = $('#serviceInfo').val();
      var orderByEC = $('input:checkbox[name=orderByEC]').val();
      var orderByRevC = $('input:checkbox[name=orderByRevC]').val();
      var orderBySP = $('input:checkbox[name=orderBySP]').val();
      
      expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo, orderByEC:orderByEC, orderByRevC:orderByRevC, orderBySP:orderBySP}, function(result){
         for(var i=0, len= result.length||0; i<len; i++){
            console.log(result[i]);
         }
         
         checkList(result);
      });
   });
   
   function checkList(list){
      $('#exlist').empty();
      
      var str="";
      console.log(list);
      for(var i=0, len=list.length||0; i<len; i++){
         str +=    '<div class="expertInfo" data-id = "' + list[i].ef_Id +'">';
         str += '<img class="profile" src="/upload/profile/' + list[i].ef_Photo + '">';
         str += '<div class="info"><h4>'+ list[i].ef_OL + '</a></h4>';
         str += '<div>'+list[i].ef_RC+'회 고용<strong>*</strong>'+ list[i].ef_District+'</div></div>';
         str +=   '<div><img class="star" src="/resources/images/starpoint.JPG">'+list[i].ef_AvgStarpoint+'('+list[i].ef_CntReview+'개)</div></div>';         
      }
            
      $('#exlist').append(str);
      
      $('.expertInfo').on("click", function(){
         alert($(this).data("id"));
         location.href='/expert/profile?e_Id='+$(this).data("id") ;
      });
      
   }
   
   
   expertFindService.getList({sido:"지역 전체", gugun:"전체", ser: "분야 전체", serviceInfo:"전체", orderByEC:"not", orderByRevC:"not", orderBySP:"not"}, function(result){
      checkList(result);
   });
   
   $('#service').change(function(){
      
      var sido = $('#sido').val();
      var gugun = $('#gugun').val();
      var service = $('#service').val();
      var serviceInfo = $('#serviceInfo').val();
      var orderByEC = $('input:checkbox[name=orderByEC]').val();
      var orderByRevC = $('input:checkbox[name=orderByRevC]').val();
      var orderBySP = $('input:checkbox[name=orderBySP]').val();
      
      expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo, orderByEC:orderByEC, orderByRevC:orderByRevC, orderBySP:orderBySP}, function(result){
         for(var i=0, len= result.length||0; i<len; i++){
            console.log(result[i]);
         }
         
         checkList(result);
      });
   })
   
   $('#serviceInfo').change(function(){
      
      var sido = $('#sido').val();
      var gugun = $('#gugun').val();
      var service = $('#service').val();
      var serviceInfo = $('#serviceInfo').val();
      var orderByEC = $('input:checkbox[name=orderByEC]').val();
      var orderByRevC = $('input:checkbox[name=orderByRevC]').val();
      var orderBySP = $('input:checkbox[name=orderBySP]').val();
      
      expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo, orderByEC:orderByEC, orderByRevC:orderByRevC, orderBySP:orderBySP}, function(result){
         for(var i=0, len= result.length||0; i<len; i++){
            console.log(result[i]);
         }
         
         checkList(result);
      });
   });
   
   $('#gugun').change(function(){

      var sido = $('#sido').val();
      var gugun = $('#gugun').val();
      var service = $('#service').val();
      var serviceInfo = $('#serviceInfo').val();
      var orderByEC = $('input:checkbox[name=orderByEC]').val();
      var orderByRevC = $('input:checkbox[name=orderByRevC]').val();
      var orderBySP = $('input:checkbox[name=orderBySP]').val();
      
      expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo, orderByEC:orderByEC, orderByRevC:orderByRevC, orderBySP:orderBySP}, function(result){
         for(var i=0, len= result.length||0; i<len; i++){
            console.log(result[i]);
         }
         
         checkList(result);

      });
      

   });
   
   $('#sido').change(function(){
      
      var sido = $('#sido').val();
      var gugun = $('#gugun').val();
      var service = $('#service').val();
      var serviceInfo = $('#serviceInfo').val();
      var orderByEC = $('input:checkbox[name=orderByEC]').val();
      var orderByRevC = $('input:checkbox[name=orderByRevC]').val();
      var orderBySP = $('input:checkbox[name=orderBySP]').val();
      
      expertFindService.getList({sido:sido, gugun:gugun, ser: service, serviceInfo:serviceInfo, orderByEC:orderByEC, orderByRevC:orderByRevC, orderBySP:orderBySP}, function(result){
         for(var i=0, len= result.length||0; i<len; i++){
            console.log(result[i]);
         }
         
         checkList(result);
      });
   });
});
   

</script>
<title>Insert title here</title>
</head>
<body>
   <div id="container">
      <div id="info">
         <h3>고수 찾기</h3>

         <div id="district_select">
               <h4>우리 지역의 숨은 고수는 누구일까요?</h4>
               <div id="sel_d">
                  지역 선택<br> 
                  <select name="sido" id="sido"></select> 
                  <select name="gugun" id="gugun" style="display: none"></select>
               </div>

               <div id="sel_s">
                  서비스 선택<br> 
                  <select name="service" id="service"></select> 
                  <select   name="serviceInfo" id="serviceInfo" style="display: none"></select>
               </div>
               
               <div id="sel_orderby">
                  <div id="getfilter">필터</div>
                  <ul class="filter" style="position: absolute; display: none;">
                     <li class="sort-item"><input type="checkbox" class="f" name="orderByEC" value="not">고용순</li>
                     <li class="sort-item"><input type="checkbox" class="f" name="orderByRevC" value="not">리뷰순</li>
                     <li class="sort-item"><input type="checkbox" class="f" name="orderBySP" value="not">별점순</li>
                  </ul>
               </div>
         </div>
      </div>

      <div id="exlist">

      </div>
   </div>
</body>
</html>