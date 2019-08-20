<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/profile.css" rel="stylesheet">
</head>
<body>
	<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	</header>

	<div class="page-wrapper">
	
		<div class="profile_box" >
			<p id="pageName"class="profile_msg">${expert.e_Name}의 페이지 </p>
		</div>
		
		<div class="form-profile" >
				<h3>고수 프로필</h3>
				<c:if test="${loginUser.user_Divide =='expert'}">
				<div class="profile-photo">
					<input type="file" name="updateFile"/>
					<input type="hidden" name="e_Id" value="${expert.e_Id}"/>
					<button id="updateBtn">수정</button> 
				</div>
				</c:if>
	
				<script type= "text/javascript" src="/resources/js/profile.js"> </script>
				
				<div id="profile-Img" class="effect">
					<img class="profile-photo" src="/upload/profile/${expert.e_Photo}">
				</div>
		
				<div class="profile-basic">
					<ul>
						<li><img class="icon" src='/resources/images/person_icon.png'>${expert.e_Name}</li>
						<li><img class="icon" src='/resources/images/mail_icon.png'>${expert.e_Id}</li>
						<li><img class="icon" src='/resources/images/hire_icon.png'>${expert.e_Rc}</li>
					</ul>
				</div>
		</div>
			<hr>
		
		
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
		<c:if test="${loginUser.user_Divide =='expert'}">
		<div id='profileForm' >

			<input type="text" id="ep_Ol" name="ep_Ol"><br>
			<input type="text" id="ep_Dl" name="ep_Dl"><br>
		</div>
		
		<button id="profileBtn">수정</button> 
		</c:if>
		<hr class="m-0">
		
		<div id="license">
		<h3>자격증 / 포트폴리오</h3>
			<c:if test="${loginUser.user_Divide =='expert'}">
				<div id="license">
					<input type="file" name="uploadLicense" multiple="multiple">
					<input type="hidden" name="e_Id" value="${expert.e_Id}"/>
					<button id="uploadBtn">등록</button> 
				</div>
					<button id="licenseModifyBtn">수정</button>
			</c:if>

				<div id="uploadResult" class="uploadResult">
				  <ul>
				  </ul>
				</div>

				<a id="prevbtn" href="#" style="float: left; margin-left: 80px;">이전</a>
				<a id="nextbtn" href="#" style="float: right; margin-right: 80px;">다음</a>
				<div class="bigPictureWrapper">
					<div class="bigPicture">
					</div>
				</div>
		<hr>
		</div>
		
		
		
		


  <h3> 리뷰</h3>
		
 	
	<script type= "text/javascript" src="/resources/js/review.js"></script>


<div class="row" id="profile-review">
	
	<div class="col-lg-12">
		<!-- /.panel  -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Review
				<button type="button" id="review-register" class="btn btn-outline-primary" data-target="#myModal"> 등록하기 </button>
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
          	<input id="review-writer" name="writer" placeholder="작성자" readonly="readonly" value="${loginUser.m_Id}">
      	  	</div>
      	  
      	 	<div class="form-group">
      	  	<label>작성일 </label>
      	  	<input id="review-date" name="date" placeholder="작성일" readonly="readonly">
      	   	</div>
      	   	
      	  	<div class="form-group">
      	  	<div class="starRev"> 
      	  	<label>별점 </label>
  			  <span id="star_one" class="starR on" data-re_StarPoint=1>1</span>
			  <span id="star_two" class="starR" data-re_StarPoint=2>2</span>
			  <span id="star_three" class="starR" data-re_StarPoint=3>3</span>
			  <span id="star_four" class="starR" data-re_StarPoint=4>4</span>
			  <span id="star_five" class="starR" data-re_StarPoint=5>5</span>
      	  	<input id="review-star" type="hidden" name="starPoint" placeholder="별점">
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
 </div>	
 	
 		<script>
			
				$(document).ready(function(){
				
					$('#prevbtn').on("click", function(e){
						e.preventDefault();
						
						$('.uploadResult ul').animate({
							marginLeft : parseInt($('.uploadResult ul').css('marginLeft'))  + 250
						}, 'slow');
					});
					
					$('#nextbtn').on("click", function(e){
						e.preventDefault();
					
					$('.uploadResult ul').animate({
							marginLeft : parseInt($('.uploadResult ul').css('marginLeft'))  - 250
						}, 'slow');
					})
					
					var e_Id = "${profile.e_Id}";
					profileService.getFileList({e_Id:e_Id}, function(list){
						console.log(list);
						var str = "";
						
						for(var i=0, len = list.length||0; i < len; i++){
							console.log(list[i].ef_Uuid)
							var filePath = encodeURI(list[i].ef_Path+"/s_"+list[i].ef_Uuid+"_"+list[i].ef_Photo);
							str += "<li data-ef_Path='"+list[i].ef_Path+"' data-ef_Uuid='"+list[i].ef_Uuid+"' data-ef_Photo='"+list[i].ef_Photo+"'>";
							str += "<img src='/upload/"+filePath+"'></li>"; //class='img-responsive img-thumbnail'
							
						}
						$("#uploadResult ul").html(str);
						
						
					})
					
					$("#uploadResult").on("click","li", function(e){
						console.log("view image");
						console.log($(this).data("ef_path"));
						var path= encodeURI($(this).data("ef_path")+"/"+$(this).data("ef_uuid")+"_"+$(this).data("ef_photo"));
						showImage(path.replace(new RegExp(/\\/g),"/"));
						if($(this).data("ef_type")){
							showImage(path.replace(new RegExp(/\\/g),"/"));
						}
						
					});
					
					$("#licenseModifyBtn").on("click", function(e){
						profileService.getFileList({e_Id:e_Id}, function(list){
							console.log(list);
							var str = "";
							
							for(var i=0, len = list.length||0; i < len; i++){
								console.log(list[i].ef_Uuid)
								var filePath = encodeURI(list[i].ef_Path+"/s_"+list[i].ef_Uuid+"_"+list[i].ef_Photo);
								str += "<li data-ef_Path='"+list[i].ef_Path+"' data-ef_Uuid='"+list[i].ef_Uuid+"' data-ef_Photo='"+list[i].ef_Photo+"'>";
								str += "<img src='/upload/"+filePath+"'></li>"; //class='img-responsive img-thumbnail'
							}
							$("#uploadResult ul").html(str);
							
							
						})
					})
					
					function showImage(path){
						
						$(".bigPictureWrapper").css("display","flex").show();
						$(".bigPicture").html("<img src='/upload/"+path+"'>").animate({width:'100%',height:'100%'},1000);
					}
					
					$(".bigPictureWrapper").on("click", function(e){
						$(".bigPicture").animate({width:'0%',height:'0%'},0);
						setTimeout(function(){
							$(".bigPictureWrapper").hide();
						},0);
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
					
					
					$("#updateBtn").on("click", function(e){
						
						if(!"${profile.e_Id}"=="${loginUser.e_Id}"){
							alert("권한이 없습니다.");				
							return false;
						}
						var formData = new FormData();
						var inputFile=$("input[name='updateFile']");
						var files = inputFile[0].files;
					
						var e_Id=$("input[name='e_Id']").val();
					
						if(!checkExtention(files[0].name, files[0].size) ){
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
					
					var cloneObj = $("#license").clone();
					var uploadResult = $("#uploadResult ul");
					
						function showUploadedFile(uploadResultArr){
							
							var str="";
							
							$(uploadResultArr).each(function(i,obj){
								
								if(!obj.ef_Type){
								str += "<li>" + obj.ef_Photo + "</li>";
								}else{
								var filePath = encodeURI(obj.ef_Path+"/s_"+obj.ef_Uuid+"_"+obj.ef_Photo);
								str += "<li><img src='/upload/"+filePath+"'><li>";
								}
							});
							$("#uploadResult ul").append(str);
						}
					$("#uploadBtn").on("click", function(e){
						
						if(!"${profile.e_Id}"=="${loginUser.e_Id}"){
							alert("권한이 없습니다.");				
							return false;
						}
						var formData = new FormData();
						var inputFile=$("input[name='uploadLicense']");
						var files = inputFile[0].files;
					
						var e_Id=$("input[name='e_Id']").val();
						
						for(var i=0; i< files.length; i++){
							if(!checkExtention(files[i].name, files[i].size) ) {
								return false;
							}
							formData.append("uploadFile",files[i]);
						
						}
						formData.append("e_Id",e_Id);
						
						$.ajax({
							url: '/expert/profile_License',
							processData:false,
							contentType:false,
							data: formData,
							type:'POST',
							dataType:'json',
							success: function(result){
								
								$("#license").html(cloneObj.html());
								showUploadedFile(result);
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
						 + "<h3>한 줄 소개 </h3> <br>"
						 + "<div class='form-profile-Ol'>"
						 +e_profile.ep_Ol+"</div>"
						 +"</section>";
						 
					$("#profile-Ol").html(str2);	 
					$("#profile-Dl").html(str);			
			});
			$("#profileBtn").on("click", function(e){
				var epDl = $("#ep_Dl").val();
				var epOl = $("#ep_Ol").val();
			
				
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
  		var re_Seq = $(this).data("re_seq");
  		
  		reviewService.get(re_Seq, function(review){
  			console.log(re_Seq);
  			modalInputContents.val(review.re_Contents);
  			modalInputWrier.val(review.m_Id);
  			modalInputStarPoint.val(review.re_StarPoint);
  			modalInputDate.val(review.re_Date);
  			modal.data("re_Seq", review.re_Seq);
  			
  			modal.find("button[id !='modal-review-close']").hide();
  			modalModifyBtn.show();
  			modalDeleteBtn.show();
  			
  				
  				$("#star_five").parent().children('span').removeClass('on');
  				if(review.re_StarPoint==1){
  			    $("#star_one").addClass('on').prevAll('span').addClass('on');
  			    return false;
  				}else if(review.re_StarPoint== 2){
  				$("#star_two").addClass('on').prevAll('span').addClass('on');
  				return false;
  				}else if(review.re_StarPoint == 3){
  				$("#star_three").addClass('on').prevAll('span').addClass('on');
  				return false;
  				}else if(review.re_StarPoint==4){
  				$("#star_four").addClass('on').prevAll('span').addClass('on');
  				}else{
  				$("#star_five").addClass('on').prevAll('span').addClass('on');
  				}
  				
  			});
  			$("#myModal").modal('show');
  		});
  		
  	
	
	$(modalModifyBtn).on("click", function(e){
  		
  		var review = {re_Seq:modal.data("re_Seq"),
  				re_Contents: modalInputContents.val(),
  				re_StarPoint: modalInputStarPoint.val()};
  		reviewService.update(review, function(result){
  			$("#myModal").modal( "hide");
  			showList(1);
  		});
  	});
	
	$(modalDeleteBtn).on("click",function(e){
		var re_Seq = modal.data("re_Seq");
		

		reviewService.remove(re_Seq, function(result){
			
		});
		$("#myModal").modal("hide");
		showList(1);
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
				str +="<small class='pull-right text-muted'>"+list[i].re_Date+"</small></div><br>";
				str +="<small class='pull-right text-muted'>";
				str +="<img class='starimg' style=' width:15px; height:15px;' src='/resources/images/starpoint.JPG'>"+list[i].re_StarPoint+"</small></div>";
				str +="<p>"+list[i].re_Contents+"</p></div></li><hr>";
			}
			
			
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
	 
	 var m_Id = "${loginUser.m_Id}";
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
 		var m_Id = "${loginUser.m_Id}";
 		
 	
 		var modalInputStarPoint = $("#review-star").val();
 		var modalInputContents = $("#review-contents").val();
 	
 		var review={
 				m_Id: m_Id,
 				re_StarPoint: modalInputStarPoint,
 				re_Contents: modalInputContents,
 				e_Id: e_Id,
 		};
 		reviewService.add(review, function(result){
 			
 			
 			showList(-1);
 		});
 		modal.find("textarea").val(""); 
		modal.modal("hide");
 
 	}); 
  	
  
 	
  	$('.starR').click(function(){
		  $(this).parent().children('span').removeClass('on');
		   $(this).addClass('on').prevAll('span').addClass('on');
		  var starPoint =$(this).data("re_starpoint");
		  $("#review-star").val($(this).data("re_starpoint"));
	});
  	
  
  	
  	//------------별점 UI----------------------------
	
 	});
});

</script>


</body>
</html>