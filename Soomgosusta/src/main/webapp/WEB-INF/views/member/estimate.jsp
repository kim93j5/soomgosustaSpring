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
<script type="text/javascript" src="/resources/js/estimate.js"></script>
<link rel="stylesheet" href="/resources/css/estimateList.css"
	target="text/css">
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
h3{
 font-weight: bold;
 font-family: 'Nanum Gothic Coding', monospace;
}

h5{
 font-size: 16px;
 font-family: 'Nanum Gothic Coding', monospace;
}

</style>
<title>Insert title here</title>
</head>
<body style="background-color: PowderBlue">

<%-- var m_Id = '<c:out value="${loginUser.m_Id}"/>'; --%>

<div class="h2"><h2 style="margin-bottom: 30px; margin-left: 150px;">받은 견적서 내역</h2></div>
	<c:forEach var="list" items="${listEstimate }">
      <ul>
          <li>
		      <div id="estimate">
			      <div id="e_Photo">
				     <img src="/resources/images/${list.e_Photo }">
			      </div>
			      <div id="estimateInfo">
				      <h5 style="font-weight: bold; font-size: 17px;">${list.e_Name } 고수의 
				          ${list.p_S_Word }&nbsp;${list.p_L_Word }</h5>
				    <div class="district"><h5 style="color: #999999">활동지역 : ${list.ei_District}</h5></div>
				    <div class="expectation"><p style="font-size: 16px; margin-top: 10px;">예상금액 :&nbsp; ${list.e_AmountPart}&nbsp;
				    <b style="font-size: 16px">${list.e_Amount }</b></p>
				    </div>
				    
			      </div>
			   </div>
		  </li>
	  </ul>
		</div>
	</c:forEach>
	
	
	
<!--  <form action="/member/estimate" method="post">
    <input type="submit" value="매칭완료" id="match"></button>
</form> -->
<br><br>
<button type="button" onclick="location.href='/member/estimate/match'">매칭완료</button>

</body>
</html>