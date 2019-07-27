<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/memberMypage.js"></script>
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#image{
	float: left;
	width: 200px;
	height: 200px;
	border-radius: 100px;
	margin: 60px;
}
#memberInfo{
	padding-top: 45px;
}
.mypage{
	margin-top : 150px;
	margin-left : 430px;
}
#plusimage{
	width: 20px;
	height: 20px;
	border-radius: 10px;
	padding-top: 6px;
}
</style>


<title>Insert title here</title>
</head>
<script type="text/javascript">
/* $(document).on("click",".changeBtn",function(){
	$('#modal').modal('show');
})
 */

	$('document').ready(function(){
		
		$(".changeBtn").on("click", function(e){
			$(".modal-header").empty();
			$(".modal-body").empty();
			$('#modal').modal('show');
			var str="";
			$(".modal-header").append('<div id = "updatePW"><h3>비밀번호 변경</h3></div>');
			str+='<div class = "updateCheckPW">';
			str+='현재 비밀번호 : <input type="text" name="nowPassword" id = "nowPassword"><input type="button" id="checkPW" value="비밀번호 확인"><br>';
			
			$(".modal-body").on("click","#checkPW", function(e){
				var nowPassword=$("input[name='nowPassword']");
				mypageService.checkPW(m_Id,nowPassword,function(message){
					alert(message);
				});
			});
			
			$(".modal-body").append(str);
	    });

		
		var regex = new RegExp("(.*?)\.(png|jpg|bmp)$");
		var maxSize = 2242880; //
			function checkExtention(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				if(!regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
			return true;
			}
					
		$(".updateBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile=$("input[name='updateFile']");
			var m_Id = "<c:out value ='${mypageInfo.m_Id }'/>"
			//alert(m_Id);
			var file = inputFile[0].files;
				if(!checkExtention(file[0].name, file[0].size)){
					return false;
				}
				//alert(file[0].name);
				formData.append("m_Id",m_Id);
				formData.append("uploadFile",file[0]);
				//mypageService.imageUpdate(formData);
				
				$.ajax({
					url: '/member/mypage',
					processData:false,
					contentType:false,
					data: formData,
					dataType:'json',
					type:'POST',
					success: function(result){
						alert("수정완료");
						$("#myImage").load(" #myImage img"); 
						console.log(result);
					}
				});
				
			});
		});
	</script>
<body>


	
	<div class = "ChangePassWord">
<div class="modal fade" id="modal">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header"></div>
            
            <div class="modal-body"></div>
            
            <div class="modal-footer">
            <button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
</div>
<div class="mypage">
<div id = "myImage">
<img id="image" src="/upload/member/${mypageInfo.m_Photo}">

	<input type="file" name="updateFile"/>
</div>
<button class="updateBtn">수정</button>
	<div id="memberInfo">
		<h3>아이디 : ${mypageInfo.m_Id }<br></h3>
		<h3>이름 : ${mypageInfo.m_Name }<br></h3>
		<h3>비밀번호 &nbsp;&nbsp;<button class="changeBtn">수정</button><br></h3>
		<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form>
		<h3>관심 분야 : ${myPart1 }&nbsp;&nbsp;
		<c:choose>
			<c:when test="${myPart2 ne '추가' && myPart3 eq '추가'}">
				${myPart2 }&nbsp;&nbsp;
				<img id="plusimage" src="/resources/images/plus.png">
			</c:when>
			<c:when test="${myPart2 eq '추가' && myPart3 ne '추가'}">
				${myPart3 }&nbsp;&nbsp;
				<img id="plusimage" src="/resources/images/plus.png">
			</c:when>
			<c:when test="${myPart2 eq '추가' && myPart3 eq '추가'}">
				<img id="plusimage" src="/resources/images/plus.png">&nbsp;&nbsp;
				<img id="plusimage" src="/resources/images/plus.png">
			</c:when>
			<c:otherwise>
				${myPart2 }&nbsp;&nbsp;${myPart3 }&nbsp;&nbsp;
			</c:otherwise>
		</c:choose></h3>
		<h3>주소 : ${mypageInfo.m_Address }<button class="addressModify">수정</button><br></h3></h3>
	</div>
	
</div>
</body>
</html> 