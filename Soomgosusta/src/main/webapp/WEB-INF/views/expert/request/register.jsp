<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/link.js"></script>
</head>
<body>
	<div id="app-body">
		<aside id="estimate-container">
			<div class="estimate-register-body">
				<div><h2>견적서 보내기</h2></div>
				<div><p>요청서를 확인하고 견적서를 보내주세요.</p></div>
				<div>
					<form action="/expert/register/${seq }" method="post" id="estimate-form">
						
					</form>
				</div>
			</div>
		</aside>
	</div>
	
		<script type="text/javascript">
$(document).ready(function(){

	var _seq = ${seq};
	var _estimateForm = $("#estimate-form");
	
	linkService.get(_seq, function(data){
		console.log(data);
		
		var lSeq = "";
		
		lSeq += "<input type='hidden' name='member_Id' value='"+data.member_Id+"' >"
		lSeq += "<input type='hidden' name='expert_Id' value='"+data.expert_Id+"' >"
		lSeq += "<input type='hidden' name='l_Seq' value='"+data.l_Seq+"' >"
		lSeq += "<select name='e_Amountpart'>"
			lSeq += "<option selected='selected'>1시간당</option>"
			lSeq += "<option>1일당</option>"
			lSeq += "<option>1주일당</option>"	
		lSeq += "</select>"
		lSeq += "<input type='text' name='e_Amount'>원<br><br>"
		lSeq += "<textarea rows='6' cols='70' name='e_Contents' placeholder='메세지를 입력해주세요.'></textarea><br>"
		lSeq += "<input type='submit' value='견적서 보내기'>"
		
		_estimateForm.html(lSeq);
		

	})


});
</script>
	
</body>
</html>