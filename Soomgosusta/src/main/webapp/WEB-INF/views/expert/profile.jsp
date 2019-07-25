<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid p-0">
	<section class="">
		<div class="profile_box">
			<p class="profile_msg">${loginUser.user_Divide}의 페이지 </p>
		</div>
			
			<div class="form-profile">
			
				<div class="profile-photo">
					<input type="file" name="updateFile"/>
					<input type="hidden" name="e_Id" value="${expert.e_Id}"/>
				</div>
				
				 <button id="updateBtn">수정</button> 
				<script type= "text/javascript" src="/resources/js/profile.js"> </script>
				<script >
				$(document).ready(function(){
					
					
					
					
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
					
					
					$("#updateBtn").on("click", function(e){
						
						var formData = new FormData();
						
						var inputFile=$("input[name='updateFile']");
						var files = inputFile[0].files;
						
					
						var e_Id=$("input[name='e_Id']").val();
					
						if(!checkExtention(files[0].name, files[0].size)){
							return false;
						}
						
						formData.append("e_Id",e_Id);
						formData.append("updateFile",files[0]);
						
						$.ajax({
							url: '/expert/profile',
							processData:false,
							contentType:false,
							data: formData,
							type:'POST',
							dataType:'json',
							success: function(result){
								alert("수정완료")
								$("#profile-Img").load(" #profile-Img img"); 
								$("#profile-Img2").load(" #profile-Img2 img");
								console.log(result);
							}
						});
					});
					
					
				});
				</script>
				
				
				<div id="profile-Img">
					<img class="profile-photo" src="/upload/profile/${expert.e_Photo}">
				</div>
				
				<div>
				<ul id="profile-basic">
					<li>${expert.e_Name}</li>
					<li>${expert.e_Id}</li>
					<li>${expert.e_Photo}</li>
				</ul>
				</div>
			</div>
			
			
			
		</section>	
		<div id="profile-Ol">
		<section class="">
		<h3>한 줄 소개 </h3> 
		<br>
			<div class="form-profile-ol">
				${profile.ep_Ol}
			</div>
		</section>
		</div>
		
		<hr>
		<div id="profile-Dl">
		<section class="">
		<h3>상세 소개 </h3> 
		<br>
			<div class="form-profile-dl">
				${profile.ep_Dl}
			</div>
		</section>
		</div>
		<hr>
		
		<div id='profileForm' >

			<input type="text" id="ep_Ol" name="ep_Ol"><br>
			<input type="text" id="ep_Dl" name="ep_Dl"><br>
		</div>
		
		<button id="profileBtn">수정</button> 
		<script>
		
		$(document).ready(function(){
			console.log(profileService);
			var e_Id = "${profile.e_Id}";
			profileService.getProfile({e_Id :e_Id}, function(e_profile){
					console.log(e_profile);
					console.log(e_profile.e_Id);
					var str = "";
					str +=	"<section class='dl' >"
					 + "<h3>상세 소개 </h3> <br>"
					 + "<div class='form-profile-dl'>"
					 +e_profile.ep_Dl+"</div>"
					 +"</section>";
					
					 var str2 = "";
					 str2 += "<section class='Ol' >"
						 + "<h3>한 줄 소개지롱 </h3> <br>"
						 + "<div class='form-profile-Ol'>"
						 +e_profile.ep_Ol+"</div>"
						 +"</section>";
						 
					$("#profile-Ol").html(str2);	 
					$("#profile-Dl").html(str);			
			});
			$("#profileBtn").on("click", function(e){
				var epDl = $("#ep_Dl").val();
				var epOl = $("#ep_Ol").val();
				alert(epDl);
				alert(epOl);
				
					profileService.update(
					{
						e_Id : e_Id,
						ep_Ol : epOl,
						ep_Dl : epDl
					}
					, function(result){
							alert("수정완료");
					});	
			});
	
		}); 
		
		</script>
		
		<hr class="m-0">
		
		<section class="" id="">
		<h3>자격증</h3>
			
		</section>
		<hr>
		
		<section class="" id="">
		<h3>포트폴리오</h3>
		</section>
		<hr>
		
		

      <span class="d-block d-lg-none">${expert.e_Name}</span>
     <span id="profile-Img2" class="d-none d-lg-block">
       <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="/upload/profile/${expert.e_Photo}" alt="">   
     </span>

  
</div>	
<div class="row" id="profile-review">
	
	<div class="col-lg-12">
		<!-- /.panel  -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Review
			</div>
			
			<!--/.panel-heading  -->
			<div class="panel-body">
				<ul class="chat">
					<!-- start reveiw -->
					<li class="left clearfix" data-re_Seq='21'>
						<div>
							<div class="header">
								<strong class="primary-font">writer</strong>
								<small class="pull-right text-muted">20190505</small>
							</div>
							<p>contents</p>
						</div>
					</li>
					<!-- end review  -->
				</ul>
				<!-- ./end ul  -->
			</div>
			 <!--/.panel .chat-panel  -->
		</div>
	</div>
	<!-- /.end row -->
</div>
	
	

<div class="modal fade" id="myModal"  role="dialog" tabindex="-1" aria-labelledby="myModalLabel" >

    	<div class="modal-dialog" role="document">
     	 <div class="modal-content">
          <div class="modal-header">
           	<h4 class = " modal-title" id="myModal"> 리뷰 </h4>
           	  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           	  <span aria-hidden="true">&times;</span>
           	  </button>
          </div>
          
          <div class="modal-body">
          	<div class="form-group">
          	<label>작성자</label>
          	<input id="review-writer" name="writer" placeholder="작성자">
      	  	</div>
      	  
      	 	<div class="form-group">
      	  	<label>작성일 </label>
      	  	<input id="review-date" name="date" placeholder="작성일">
      	   	</div>
      	   	
      	  	<div class="form-group">
      	  	<label>별점 </label>
      	  	<input id="review-star" type="text" name="starPoint" placeholder="별점">
      	   	</div>
      	   	
      	  	<div class="form-group">
          	<label>내용</label>
          	<input id="review-contents" type="text"  name="contents" placeholder="내용">
           	</div>
           	
          </div>
          
          
          <div class="modal-footer">

            <button type="button" id="modal-review-register"> 등록하기 </button>
            <button type="button" id="modal-review-modify"> 수정하기 </button>
            <button type="button" id="modal-review-delete"> 삭제하기 </button>
            <button type="button" id="modal-review-close" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
       	 </div>
       		<!-- /.modal-content -->
    	</div>
    	<!-- /.modal-dialog -->
 	</div>
 	<!-- /.modal -->
 	<h3> 리뷰</h3>
		<button type="button" id="review-register" class="btn btn-primary"  data-target="#myModal"> 등록하기 </button>
 	
	<script type= "text/javascript" src="/resources/js/review.js"></script>

<script>
$(document).ready(function(){
	
	var e_Id = "${profile.e_Id}";

	if("${loginUser.user_Divide}"=='member'){
	var m_Id = "${loginuser.m_Id}";
	}
	var modal = $("#myModal");
	var epDl = $("#ep_Dl").val();
	var modalInputWrier = $("#review-writer");
	var modalInputStarPoint = $("#review-star");
	var modalInputContents = $("#review-contents");
	var modalInputDate = $("#review-date")
	var modalRegisterBtn = $("#modal-review-register");
	var modalModifyBtn = $("#modal-review-modify");
	var modalDeleteBtn = $("#modal-review-delete");
	
	/* reviewService.update({
		re_Seq: 21,
		e_Id: e_Id,
		re_Contents: "수정 test"
	},function(result){
		alert("review 수정 완료");
	})
	 */
	
	/* reviewService.remove(22, function(count){
		
		console.log(count);
		if(count ==="success"){
			alert("REMOVED");
		}
	},function(err){
		alert('ERROR');
		
	}); */
	
	reviewService.getList({e_Id: e_Id, page:1},function(list){
		for(var i=0,len =list.length||0; i<len; i++){
			console.log(list[i]);
		}
	});
	
 	$("#review-register").on("click",function(e){
	 
	 modalInputDate.closest("div").hide();
	 modal.find("button[id != 'modal-review-close']").hide();
	 modalRegisterBtn.show();
	 
	 $("#myModal").modal('show');
	 
 	});
 	
 	$(modalRegisterBtn).on("click",function(e){
 		var m_Id=${loginUser.m_Id}
 		var match = reviewService.findMatch({m_Id:m_Id},function(result){
 			
 			
 			
 		})
 		
 		
 		
 		var modalInputStarPoint = $("#review-star").val();
 		var modalInputContents = $("#review-contents").val();
 		alert("add 이벤트 확인");
 		alert(" star 입력값 "+ modalInputStarPoint);
 		alert(modalInputStarPoint);
 		var review={
 				m_Id: 'kim93j5@naver.com',
 				re_StarPoint: modalInputStarPoint,
 				re_Contents: modalInputContents,
 				e_Id: e_Id
 		};
 		
 		reviewService.add(review, function(result){
 			
 			alert("review 등록 성공"+result);
 			
 			modal.find("input").val(""); 
 			modal.modal("hide");
 			
 		})
 	});
	
 
});

</script>


</body>
</html>