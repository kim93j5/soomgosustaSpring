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
		<aside id="request-body">
		
		</aside>
	</div>
	
	<script type="text/javascript">
$(document).ready(function(){

	var _seq = ${seq};
	var _requestBody = $("#request-body");
	
	linkService.get(_seq, function(data){
		console.log(data);
		
		
		var str = "";
	
		str += "<div>"
			str += "<div class ='map'>"
				str += "<img>"
			str += "</div>"
			str += "<div>"
				str += "<div>"
					str += "<div>"
						str += "<div>"
							str += "<h4 class='name'>"+ data.m_Name +"</h4>"
						str += "</div>"
						str += "<h5 calss='part'>" + data.p_F_Word+"/"+data.p_S_Word+"/"+data.p_T_Word + "</h5>"
					str += "</div>"
				str += "</div>"
				str += "<div>"
					str += "<div>"
						str += "<div class='uer-profile-picture'>"
							str += "<div>"
								str += "<img>"
							str += "</div>"
						str += "</div>"
					str += "</div>"
				str += "</div>"
			str += "</div>"
			str += "<div>"
				str += "<div>"
					str += "<div class='address'>"
						str += "<img>"
						str += "<span>" + data.m_Address + "</span>"
					str += "</div>"
				str += "</div>"
				str += "<ul class='request-list'>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_01 + "</h5>"
						str += "<h5>"+ data.r_A_01 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_02 + "</h5>"
						str += "<h5>"+ data.r_A_02 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_03 + "</h5>"
						str += "<h5>"+ data.r_A_03 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_04 + "</h5>"
						str += "<h5>"+ data.r_A_04 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_05 + "</h5>"
						str += "<h5>"+ data.r_A_05 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_06 + "</h5>"
						str += "<h5>"+ data.r_A_06 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_07 + "</h5>"
						str += "<h5>"+ data.r_A_07 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_08 + "</h5>"
						str += "<h5>"+ data.r_A_08 + "</h5>"
					str += "</li>"
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_09 + "</h5>"
						str += "<h5>"+ data.r_A_09 + "</h5>"
					str += "</li>"
					if(data.r_Q_10 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_10 + "</h5>"
						str += "<h5>"+ data.r_A_10 + "</h5>"
					str += "</li>"
					}
					if(data.r_Q_11 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_11 + "</h5>"
						str += "<h5>"+ data.r_A_11 + "</h5>"
					str += "</li>"
					}
					if(data.r_Q_12 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_12 + "</h5>"
						str += "<h5>"+ data.r_A_12 + "</h5>"
					str += "</li>"
					}
					if(data.r_Q_13 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_13 + "</h5>"
						str += "<h5>"+ data.r_A_13 + "</h5>"
					str += "</li>"
					}
					if(data.r_Q_14 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_14 + "</h5>"
						str += "<h5>"+ data.r_A_14 + "</h5>"
					str += "</li>"
					}	
					if(data.r_Q_15 != "null"){
					str += "<li class='request-item'>"
						str += "<h5>"+ data.r_Q_15 + "</h5>"
						str += "<h5>"+ data.r_A_15 + "</h5>"
					str += "</li>"
					}
				str += "</ul>"
			str += "</div>"
		str+= "</div>"
	
					
		 _requestBody.html(str);
	})


});
</script>
	
</body>
</html>