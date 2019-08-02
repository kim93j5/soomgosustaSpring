<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="/resources/js/link.js"></script>




<style>


html, body{
height: 100%;
}

#detail-request{
    border-right: 1px solid #f2f2f2;
    overflow-y: scroll;
	height: 100%;
	padding: 24px;
      

    }
    
  #send-estimate{
    height:100%;
    padding: 48px 24px;

  }
  
  .title{
      margin-bottom: 2.5rem;
  }
  
  .title .first-message{
  text-align: center;
    margin-bottom: .625rem;
  	  
  }
  .title .second-message{
      text-align: center;
    color: #999;
    margin: 0;
  }
  
  .send-form{
  position: relative;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
   
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
   
     width: 500px;
    margin: 0 auto;
    border: 1px solid #e1e1e1;
    box-shadow: none;
  
  }
  .card-body{
  
  -webkit-box-flex: 1;
    flex: 1 1 auto;
    padding: 2rem;
    }
    .custom-select{
    
    padding-top: 6px;
    padding-bottom: 10px;
    padding-left: 4px;
    padding-right: 4px;
    
    }
  
  #amountpart-group{
  margin-bottom: 1rem;
  
  }  
    .input-group{
        position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-align: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
    width: 100%;
    
    }
    
    #amount-group{
    margin-bottom: 1rem;
}
.cost-input{
height: auto;
width:280px;
    text-align: center;
    font-size: 2.5rem;
    font-weight: 400;
    padding: 0;
    border-top: none;
    border-right: none;
    border-left: none;
    margin-right: .5rem;
    }
    
    .cost-append{
    border: none;
    background-color: rgba(0,0,0,0);
    padding: 0;
    -webkit-box-align: end;
    -ms-flex-align: end;
    align-items: flex-end;
    font-size: 1.75rem;
    font-weight: 400;
    display: inline-block;
	vertical-align:middle

    }
    #text-group{
    margin-bottom: 25px;
    }
    
    .estimate-send{
    
        width: 100%;
    border-radius: 4px;
    font-weight: 500;
    background: #00C7AE;
    color: white;
    padding-bottom: 10px;
    padding-top: 10px;
    
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
</style>


</head>
<body>
		<div id="detail-request" class="col-md-3">
			
		
		</div>
		<div id="send-estimate" class="col-md-9">
			<div class="send-estimate-form">
				<div class="title">
					<h1 class="first-message"> 첫 메세지 보내기 </h1>
					<p class="second-message"> 상세 요청서를 확인하고 견적서를 작성해주세요! <br>
					 	 	견적서를 보낸후 채팅으로 이어집니다.
					</p>
				</div>
				<form action="/expert/register/${seq }" method="post" class="send-form">
						
				</form>
					
					
						

			
			</div>	
		</div>
<script type="text/javascript">
		$(document).ready(
				function() {

					
					
					var _seq = ${seq};
					
					var _sendEstimate= $(".send-form");
					var _detailRequest = $("#detail-request");

					
					linkService.get(_seq, function(data){
						console.log(data);
						
						var lSeq = "";
						
						lSeq += "<input type='hidden' name='l_Seq' value='"+data.l_Seq+"' >"
						lSeq += "<div class='card-body'>"
						lSeq += "<div id='amountpart-group' class='col-md-3 col-6'>"
						lSeq += "<select class='custom-select' id='amountpart' name='e_AmountPart'>"
							lSeq += "<option selected='selected'>1시간당</option>"
							lSeq += "<option>1일당</option>"
							lSeq += "<option>1주일당</option>"
							lSeq += "<option>총</option>"
						lSeq += "</select>"
						lSeq += "</div>"
						lSeq += "<div id='amount-group' class='col-md-9 col-6'>"
						lSeq += "<div class='input-group'>"
						lSeq += "<input name='e_Amount' type='tel' placeholder='0' class='cost-input'>"
						lSeq += "<div class='cost-append'>원</div>"
						lSeq += "</div>"
						lSeq += "</div>"
						lSeq += "<div id='text-group' class='col-12'>"
						lSeq += "<textarea name='e_Contents' placeholder='메세지를 입력해주세요' wrap='soft' class='form-control is-invalid' maxlength='2000' id='__BVID__34' style='resize: none; overflow-y: scroll; height: 110px;' aria-invalid='true'>"
						lSeq += "</textarea>"
						lSeq += "</div>"
						lSeq += "<div  class='col-12'>" 
				 		lSeq += "<button type='submit' class='estimate-send' >"
				 		lSeq += "<span >첫 메세지 보내기</span>"
				 		lSeq += "</button>"
				 		lSeq += "</div>"
						
							_sendEstimate.html(lSeq);
					});
					
					
					
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

							_detailRequest.html(sttr);
					});

				});
	</script>



</body>
</html>