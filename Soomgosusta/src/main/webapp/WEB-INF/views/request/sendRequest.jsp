<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/sendRequest.js"></script>
<link rel="stylesheet" href="/resources/css/memberMain.css"
   target="text/css">
<link rel="stylesheet"
   href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>


<style type="text/css">
h3 {
   margin-top: 0px;
   text-align: center;
}

h5 {
   font-weight: bold;
   font-size: 13px;
   color: blue;
}
</style>

<title>Insert title here</title>
</head>

<script type="text/javascript">

   $(document).on("click", ".cancelRequest", function(){
      //e.preventDefault();

      var r_Seq = $(this).val();

      //console.log(r_Seq);
      requestService.cancel(r_Seq, function(result){
    	console.log(result);  
    	
    	$('#sendRequestForm').empty();
    	   requestService.getList("nano124",
                   function(list) {

                      var str = "";
                      
                    if (list.size != 0){
                      for (var i = 0, len = list.size || 0; i < len; i++){ 

                            str += '<div class="sendOneRequest">';
                            str += '<div id = "sendPart"><br>';
                            str += '<h3>' + list.requestDTO[i].p_S_Word
                                  + '</h3>';
                            str += '<p>요청시간<br><' + list.requestDTO[i].requestTime +'></p></div>';
                            str += '<div id = "sendTime"><br>';
                            
                            if(list.requestDTO[i].nowTime > list.requestDTO[i].endTime && list.request[i].r_Status == 'ING') {
                               str += '<p style = "color:red">만료된 요청서입니다.</p>';
                               str += '<p>이 요청서는<br><b><' + list.requestDTO[i].endTime+'></b>에 종료되었습니다.</p>';
                               str += '</div><br>'
                               str += '<button class="cancelRequest" value = "' +list.requestDTO[i].r_Seq+ '">요청 취소하기</button><br>';
                               str += '<button class="btn-btn-default" data-num="'+i+'"'+ 'data-value="'+list.requestDTO[i].p_S_Word+'"' + 'id="detailButton' + i + '">요청서 보기</button>';
                            }else if (list.requestDTO[i].nowTime < list.requestDTO[i].endTime && list.request[i].r_Status == 'ING') {
                               
                               str += '<p>진행 중인 요청서입니다.</p>';
                               str += '<p>이 요청서는<br><b><' + list.requestDTO[i].endTime+'></b>에 종료됩니다.</p>';
                               str += '</div><br>'
                               str += '<button class="cancelRequest" value = "' +list.requestDTO[i].r_Seq+ '">요청 취소하기</button><br>';
                               str += '<button class="btn-btn-default" data-num="'+i+'"'+ 'data-value="'+list.requestDTO[i].p_S_Word+'"' + 'id="detailButton' + i + '">요청서 보기</button>';    
                           
                            }else if(list.request[i].r_Status == 'Cancel'){
                            	str += '<p>취소된 요청서입니다.</p>'
                            }



     
                          $(document).on("click", "#detailButton" + i, function(){
                          var word = $(this).data("value");  
                          var num = $(this).data("num");
                          //alert(num);
                          $('.modal-header').empty();
                          $('.modal-body').empty();
                          $('.modal-footer').empty();
                          //alert(word);  
                          
                          var html="";
                          //$('#modal').modal();
                          
                          console.log(list.requestDetailDTO[num]);
                          
                          $('.modal-header').append('<div id="detailPart"><h3>' + word + '</h3></div>');
                          
                          html += '<div class="detailRequest">';
                         
                                 if(list.requestDetailDTO[num].q01 != null) {
                                    html += '<div style = "display:block">' + list.requestDetailDTO[num].q01 + '<h5>' + list.requestDetailDTO[num].a01 + '</h5></div>';
                                 } 
                                 
                                 if(list.requestDetailDTO[num].q02 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q02 + '<h5>' + list.requestDetailDTO[num].a02 + '</h5></div>';
                                  } 
                                 
                                 if(list.requestDetailDTO[num].q03 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q03 + '<h5>' + list.requestDetailDTO[num].a03 + '</h5></div>';
                                  } 
                                 
                                 if(list.requestDetailDTO[num].q04 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q04 + '<h5>' + list.requestDetailDTO[num].a04 + '</h5></div>';
                                  } 
                                 
                                 if(list.requestDetailDTO[num].q05 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q05 + '<h5>' + list.requestDetailDTO[num].a05 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q06 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q06 + '<h5>' + list.requestDetailDTO[num].a06 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q07 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q07 + '<h5>' + list.requestDetailDTO[num].a07 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q08 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q08 + '<h5>' + list.requestDetailDTO[num].a08 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q09 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q09 + '<h5>' + list.requestDetailDTO[num].a09 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q10 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q10 + '<h5>' + list.requestDetailDTO[num].a10 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q11 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q11 + '<h5>' + list.requestDetailDTO[num].a11 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q12 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q12 + '<h5>' + list.requestDetailDTO[num].a12 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q13 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q13 + '<h5>' + list.requestDetailDTO[num].a13 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q14 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q14 + '<h5>' + list.requestDetailDTO[num].a14 + '</h5></div>';
                                  } 
                                 
                                 if (list.requestDetailDTO[num].q15 != null) {
                                     html += '<div style = "display:block">' + list.requestDetailDTO[num].q15 + '<h5>' + list.requestDetailDTO[num].a15 + '</h5></div>';
                                  } 
                                 
                                 
                                html+= '</div>';
                                $('.modal-body').append(html);
                            
                                $('.modal-footer').append('<button type = "button" class="btn btn-default" data-dismiss="modal">Close</button>');
                            
                               $('#modal').modal();
                            });
                          
                          if(list.request[i].r_Status != 'Cancel'){
                            str += '<button class = "btn-btn-default" onclick = ' + '"location.href='+ "'/member/estimate/" + list.requestDTO[i].r_Seq+ "'" + '">견적서보기</button>';
                            str += '</div>'; 
                          }
                      }
                      
                    }else if(list.size == 0){
                         str += '<h3>보낸 요청이 없습니다.</h3>';
                         }
                       
                      
                      str += '</div>'
                      
                      $('#sendRequestForm').append(str);

                   });
    	  
      });
   });

   requestService.getList("nano124",
               function(list) {

                  var str = "";
                  
                if (list.size != 0){
                  for (var i = 0, len = list.size || 0; i < len; i++){ 

                        str += '<div class="sendOneRequest">';
                        str += '<div id = "sendPart"><br>';
                        str += '<h3>' + list.requestDTO[i].p_S_Word
                              + '</h3>';
                        str += '<p>요청시간<br><' + list.requestDTO[i].requestTime +'></p></div>';
                        str += '<div id = "sendTime"><br>';
                        
                        if(list.requestDTO[i].nowTime > list.requestDTO[i].endTime && list.request[i].r_Status == 'ING') {
                           str += '<p style = "color:red">만료된 요청서입니다.</p>';
                           str += '<p>이 요청서는<br><b><' + list.requestDTO[i].endTime+'></b>에 종료되었습니다.</p>';
                           str += '</div><br>'
                           str += '<button class="cancelRequest" value = "' +list.requestDTO[i].r_Seq+ '">요청 취소하기</button><br>';
                           str += '<button class="btn-btn-default" data-num="'+i+'"'+ 'data-value="'+list.requestDTO[i].p_S_Word+'"' + 'id="detailButton' + i + '">요청서 보기</button>';
                           
                        }else if (list.requestDTO[i].nowTime < list.requestDTO[i].endTime && list.request[i].r_Status == 'ING') {
                           
                           str += '<p>진행 중인 요청서입니다.</p>';
                           str += '<p>이 요청서는<br><b><' + list.requestDTO[i].endTime+'></b>에 종료됩니다.</p>';
                           str += '</div><br>'
                           str += '<button class="cancelRequest" value = "' +list.requestDTO[i].r_Seq+ '">요청 취소하기</button><br>';
                           str += '<button class="btn-btn-default" data-num="'+i+'"'+ 'data-value="'+list.requestDTO[i].p_S_Word+'"' + 'id="detailButton' + i + '">요청서 보기</button>';
                           
                        }else if(list.request[i].r_Status == 'Cancel'){
                        
                        	str += '<p>취소된 요청서입니다.</p>'
                        }

 
                      $(document).on("click", "#detailButton" + i, function(){
                      var word = $(this).data("value");  
                      var num = $(this).data("num");
                      //alert(num);
                      $('.modal-header').empty();
                      $('.modal-body').empty();
                      $('.modal-footer').empty();
                      //alert(word);  
                      
                      var html="";
                      //$('#modal').modal();
                      
                      console.log(list.requestDetailDTO[num]);
                      
                      $('.modal-header').append('<div id="detailPart"><h3>' + word + '</h3></div>');
                      
                      html += '<div class="detailRequest">';
                     
                             if(list.requestDetailDTO[num].q01 != null) {
                                html += '<div style = "display:block">' + list.requestDetailDTO[num].q01 + '<h5>' + list.requestDetailDTO[num].a01 + '</h5></div>';
                             } 
                             
                             if(list.requestDetailDTO[num].q02 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q02 + '<h5>' + list.requestDetailDTO[num].a02 + '</h5></div>';
                              } 
                             
                             if(list.requestDetailDTO[num].q03 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q03 + '<h5>' + list.requestDetailDTO[num].a03 + '</h5></div>';
                              } 
                             
                             if(list.requestDetailDTO[num].q04 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q04 + '<h5>' + list.requestDetailDTO[num].a04 + '</h5></div>';
                              } 
                             
                             if(list.requestDetailDTO[num].q05 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q05 + '<h5>' + list.requestDetailDTO[num].a05 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q06 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q06 + '<h5>' + list.requestDetailDTO[num].a06 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q07 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q07 + '<h5>' + list.requestDetailDTO[num].a07 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q08 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q08 + '<h5>' + list.requestDetailDTO[num].a08 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q09 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q09 + '<h5>' + list.requestDetailDTO[num].a09 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q10 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q10 + '<h5>' + list.requestDetailDTO[num].a10 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q11 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q11 + '<h5>' + list.requestDetailDTO[num].a11 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q12 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q12 + '<h5>' + list.requestDetailDTO[num].a12 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q13 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q13 + '<h5>' + list.requestDetailDTO[num].a13 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q14 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q14 + '<h5>' + list.requestDetailDTO[num].a14 + '</h5></div>';
                              } 
                             
                             if (list.requestDetailDTO[num].q15 != null) {
                                 html += '<div style = "display:block">' + list.requestDetailDTO[num].q15 + '<h5>' + list.requestDetailDTO[num].a15 + '</h5></div>';
                              } 
                             
                             
                            html+= '</div>';
                            $('.modal-body').append(html);
                        
                            $('.modal-footer').append('<button type = "button" class="btn btn-default" data-dismiss="modal">Close</button>');
                        
                           $('#modal').modal();
                        }); 
                      
                      if(list.request[i].r_Status != 'Cancel'){
                          str += '<button class = "btn-btn-default" onclick = ' + '"location.href='+ "'/member/estimate/" + list.requestDTO[i].r_Seq+ "'" + '">견적서보기</button>';
                          str += '</div>'; 
                        }

                  }
                  
                }else if(list.size == 0){
                     str += '<h3>보낸 요청이 없습니다.</h3>';
                     }
                   
                  
                  str += '</div>'
                  
                  $('#sendRequestForm').append(str);

               });
</script>

<body>
   <div class="h1">
      <h1>보낸 요청</h1>
   </div>
   <div id="sendRequestForm"></div>
   <div class="modal fade" id="modal">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header"></div>
            
            <div class="modal-body"></div>
            
            <div class="modal-footer">
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->

</body>
</html>