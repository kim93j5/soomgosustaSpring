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
<link href="/resources/css/profile.css" rel="stylesheet">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body>


	<section class="">
		<div class="profile_box">
			<p id="pageName"class="profile_msg">${expert.e_Name}의 페이지 </p>
		</div>
		
		
		
	
			<div class="form-profile">
			
				<div class="profile-photo">
					<input type="file" name="updateFile"/>
					<input type="hidden" name="e_Id" value="${expert.e_Id}"/>
				</div>
				
				 <button id="updateBtn">수정</button> 
	
				<script type= "text/javascript" src="/resources/js/profile.js"> </script>
			
				
				
				<div id="profile-Img" class="row align-items-center">
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

  <h3> 리뷰</h3>
		<button type="button" id="review-register" class="btn btn-primary"  data-target="#myModal"> 등록하기 </button>
 	
	<script type= "text/javascript" src="/resources/js/review.js"></script>


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
					<!-- start review -->
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
			 <div class="panel-footer">
			 
			 </div>
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
      	  	<input id="review-date" name="date" placeholder="작성일" readonly="readonly">
      	   	</div>
      	   	
      	  	<div class="form-group">
      	  	<div class="starRev"> 
      	  	<label>별점 </label>
  			  <span class="starR on">별1</span>
			  <span class="starR">별2</span>
			  <span class="starR">별3</span>
			  <span class="starR">별4</span>
			  <span class="starR">별5</span>
      	  	<input id="review-star" type="text" name="starPoint" placeholder="별점">
      	   	</div>
      	   	</div>
      	   	
      	  	<div class="form-group">
          	<label>내용</label>
          	<textarea id="review-contents" name="contents" rows="10" cols="70" placeholder="내용"></textarea>
           	</div>
           	
          </div>
          
          
          <div class="modal-footer">

            <button type="button" id="modal-review-register" class="btn btn-primary"> 등록하기 </button>
            <button type="button" id="modal-review-modify" class="btn btn-warning"> 수정하기 </button>
            <button type="button" id="modal-review-delete" class="btn btn-danger"> 삭제하기 </button>
            <button type="button" id="modal-review-close" class="btn btn-default" data-dismiss="modal">닫기</button>
          </div>
       	 </div>
       		<!-- /.modal-content -->
    	</div>
    	<!-- /.modal-dialog -->
 	</div>
 	<!-- /.modal -->
 	
 	
 		<script>
			
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
	
	
	var reviewUL = $(".chat");
	
	
	showList(1);
	
	$(".chat").on("click", "li", function(e){
  		alert("클릭클릭");
  		var re_Seq = $(this).data("re_seq");
  		
  		reviewService.get(re_Seq, function(review){
  			console.log(re_Seq);
  			modalInputContents.val(review.re_Contents);
  			modalInputWrier.val(review.e_Id);
  			modalInputStarPoint.val(review.re_StarPoint);
  			modalInputDate.val(review.re_Date);
  			modal.data("re_Seq", review.re_Seq);
  			
  			modal.find("button[id !='modalCloseBtn']").hide();
  			modalModifyBtn.show();
  			modalDeleteBtn.show();
  			
  			$("#myModal").modal('show');
  		});
  		
  	});
	
	
	
	function showList(page){
	
		console.log("show list" + page);
		 
	 reviewService.getList({e_Id: e_Id, page:page},function(reviewCnt, list){
		 console.log("리뷰 개수: "+reviewCnt);
		 console.log("list: "+list);
		 console.log(list);
		 
		 if(page==-1){
			 pageNum = Math.ceil(reviewCnt/10.0);
			 showList(pageNum);
			 return;
		 }
		 	var str="";
		 if(list == null || list.length ==0){
			 str +="<div> <P> 등록된 리뷰가 없습니다 </P> </div>"
			 reviewUL.html(str);
			 return;
		 }
		 
		
			for(var i=0, len = list.length||0; i < len; i++){
				str +="<li class='left clearfix' data-re_Seq='"+list[i].re_Seq+"'>";
				str +="<div><div class='header'><strong class='primary-font'>"+list[i].m_Id+"</strong>";
				str +="<small class='pull-right text-muted'>"+list[i].re_Date+"</small></div>";
				str +="<small class='pull-right text-muted'>"+list[i].re_StarPoint+"</small></div>";
				str +="<p>"+list[i].re_Contents+"</p></div></li><hr>";
			}
			
			/* var member = reviewService.getMember({m_Id:getMember_m_Id},function(result){
				alert(result);
				
			}); */
			reviewUL.html(str);
			showReviewPage(reviewCnt,list);
	  });
	 	
	  
	};
	
	var pageNum = 1;
	var reviewPageFooter = $(".panel-footer")
	//리뷰 하단 페이징 Ui
	function showReviewPage(reviewCnt,list){
		
		var endNum = Math.ceil(pageNum/5.0)* 5;
		var startNum = endNum - 4;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 5 >= reviewCnt){
			endNUm = Math.ceil(reviewCnt/5.0);
		}
		if(endNum * 5 < reviewCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i<=endNum; i++){
			
			var active = pageNum == i?"active" :"";
			str += "<li class='page-item "+active+" '> <a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a clas='page-link' href='" +(endNum+1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		reviewPageFooter.html(str);
	}
	//페이징 클릭이벤트 
	reviewPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: "+ targetPageNum)		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	
	
 	$("#review-register").click(function(e){
	 
	 modalInputDate.closest("div").hide();
	 modal.find("button[id != 'modal-review-close']").hide();
	 modalRegisterBtn.show();
	 
	 var m_Id = e_Id;
	 /* $("#myModal").modal('show'); */
	 reviewService.findMatch({m_Id:m_Id , e_Id:e_Id},function(count){
		 	console.log("Match.........."  + count);
	 		if(count==0){
	 			alert("등록 권한이 없습니다.");
	 		}else{
	 			$("#myModal").modal('show');
	 		}
 	});
 	
  	$(modalRegisterBtn).on("click",function(e){
 		
 		var e_Id = "${profile.e_Id}";
 		
 		var modalInputStarPoint = $("#review-star").val();
 		var modalInputContents = $("#review-contents").val();
 		alert(" star 입력값 "+ modalInputStarPoint);
 	
 		var review={
 				m_Id: 'kim93j5@naver.com',
 				re_StarPoint: modalInputStarPoint,
 				re_Contents: modalInputContents,
 				e_Id: e_Id,
 		};
 		reviewService.add(review, function(result){
 			
 			alert("review 등록 성공"+result);
 			
 			modal.find("input").val(""); 
 			modal.modal("hide");
 			showList(-1);
 		});
 
 	}); 
 	
  	
  	
  
  	
  	//------------별점 UI----------------------------
 	$('.starRev span').click(function(){
 		  $(this).parent().children('span').removeClass('on');
 		   $(this).addClass('on').prevAll('span').addClass('on');
 		  var starPoint =$(this).val();
 		  alert(starPoint);
 		  return starPoint;
 	});
	
 	});
});

</script>


</body>
</html>