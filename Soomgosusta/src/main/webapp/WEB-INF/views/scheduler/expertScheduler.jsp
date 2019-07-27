<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header> --%>
<html>
<head>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link href='/resources/fullcalendar-4.2.0/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.2.0/packages/daygrid/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.2.0/packages/timegrid/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar-4.2.0/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.2.0/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar-4.2.0/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.2.0/packages/timegrid/main.js'></script>
<script type="text/javascript" src="/resources/js/expertScheduler.js"></script>
<link rel="stylesheet" href="/resources/css/expertScheduler.css">
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var e_Id = '<c:out value="${loginUser.e_Id}"/>';
scheduleService.getList(e_Id, function(list){
	console.log(list);
 	for(var i=0, len=list.listSchedule.length||0; i<len; i++){
		console.log(list.listSchedule[i]);
	}
 	 
	 var profile = "";
	 profile += '<div id="photo"><img src="/resources/images/' + list.expert.e_Photo + '"></div>';
	 profile += '<div id="info"><h4>'+ list.part + ' 서비스</h4>';
	 profile += '<strong>' + list.expert.e_Name + '</strong> 고수<br>';	 
	 profile += list.exInfo.ei_District + '<br>';
	 profile += list.expert.e_Rc + '회 고용</div>';
	  
	 $('#profile').append(profile);

	 
	var dataset=[];
	 for(var i=0, len=list.listSchedule.length||0; i<len; i++){
		 dataset.push({
			 id: list.listSchedule[i].s_Seq,
			 title: list.listSchedule[i].s_Contents,
		 	 start: list.listSchedule[i].s_Sd,
		 	 end: list.listSchedule[i].s_Ed,
		 	 color: list.listSchedule[i].s_Color
		 });
	 }
	 
	 createCalendar(dataset);
});

	function createCalendar(dataset) {
		console.log("dataset--------");
		console.log(dataset);	 

    var calendar = $('#calendar').fullCalendar({    	
    	plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
     	header: {
      	  left: 'prev,next today',
        	center: 'title',
        	right: 'dayGridMonth,timeGridWeek,timeGridDay'
      	},
      titleFormat:{
    	  month: 'YYYY년 MM월'
      },
      buttonText:{
    	  prev: 'prev',
    	  next: 'next'
      },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(start, end, allday) {

         	  $('.modal-header').empty();
        	  $('.modal-body').empty();
        	  $('.modal-footer').empty();
    		  
    		  var startd = moment(start).format('YYYY년 MM월 DD일');

        	  $('.modal-header').append('<h4>'+startd+' 일정 등록</h4>');
        	  $('.modal-body').append('<p>시작 시간: <input type="text" id="start"></p><p>끝 시간: <input type="text" id="end"></p><p>내용: <input type="text" id="contents"></p>');
        	  $('.modal-body').append('<p>장소: <input type="text" id="place"></p><p>회원 아이디: <input type="text" id="id"></p>');
        	  $('.modal-body').append('<p>색상: <input type="text" id="color"></p>');
        	  $('.modal-body').append('<p>메모: <input type="text" id="memo"></p>');
        	  $('.modal-footer').append('<button id="insert" type="button" class="btn btn-default" data-dismiss="modal">일정 등록</button>');
        	  $('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');

        	  $('#modal').modal();
    			
        	  ///////이벤트 등록//////////
        	  $("#insert").click(function(){
        		  scheduleService.getCount("count", function(count){
    				  console.log("insert ---------------");
    				  console.log("count: " + count);
                	  var startD = moment(start).format('YYYY-MM-DD');
                	  var startT = startD+'T'+$('#start').val();
                	  
                	  var endD = moment(end).subtract('hours', 24).format('YYYY-MM-DD');
                	  var endT = endD+'T'+$('#end').val();

        			  var content = $('#contents').val();
        			  var color = $('#color').val();

                      calendar.fullCalendar('renderEvent',
                    	{
                    	  id: count,
                    	  title: content,
                          start: startT,
                          end: endT,
                          color: color
                        });	

                     	scheduleService.insert(
                     			{s_Contents: content, s_Sd: startT, s_Ed: endT, s_Place: $('#place').val(), m_Id: $('#id').val(), s_Color: $('#color').val(), e_Id: e_Id, s_Memo: $('#memo').val()},
                     			function(result){
    								console.log("success");
                     			}
                     	);
            	  	});        			  
        		  })
      },
      ///////////이벤트 수정 삭제//////////////
      eventClick: function (calEvent, jsEvent, view) {
     	  $('.modal-header').empty();
    	  $('.modal-body').empty();
    	  $('.modal-footer').empty();
    	  
    	  $('.modal-header').append('작업을 선택하세요!');
    	  $('.modal-body').append('<button id="update" type="button" class="btn btn-default" style="margin-left: 170px; margin-right:20px;">수정</button>');
    	  $('.modal-body').append('<button id="remove" type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 20px;">삭제</button>');
    	  $('.modal-body').append('<button id="listfaq" type="button" class="btn btn-default" data-dismiss="modal">댓글 보기</button>');
    	  $('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
    	  
		  $('#modal').modal();
		  
		  $('#remove').click(function(event){
			  $('#calendar').fullCalendar('removeEvents', calEvent._id);
			    
			    scheduleService.remove(calEvent._id, function(count){
			    	console.log(count);	
			    }); 
		  });
		  
		  $('#update').click(function(event){
				console.log(calEvent._id);
			scheduleService.get(calEvent._id, function(data){
				
				console.log("================");
				console.log(data);
				console.log("================");
				
				var startT = moment(data.s_Sd).format('HH:mm');
				console.log(startT);
				var endT = moment(data.s_Ed).format('HH:mm');
				console.log(endT);
				
		     	$('.modal-header').empty();
		    	$('.modal-body').empty();
		    	$('.modal-footer').empty();				

		    	$('.modal-header').append('내용을 수정하세요');
	        	$('.modal-body').append('<p>시작 시간: <input type="text" id="start" value="'+startT+'"></p><p>끝 시간: <input type="text" id="end" value="'+endT+'"></p><p>내용: <input type="text" id="contents" value ="'+data.s_Contents+'"></p>');
	        	$('.modal-body').append('<p>장소: <input type="text" id="place" value="'+data.s_Place+'"></p>');
	        	$('.modal-body').append('<p>색상: <input type="text" id="color" value="'+data.s_Color+'"></p>');
	        	$('.modal-body').append('<p>메모: <input type="text" id="memo" value="'+data.s_Memo+'"></p>');
	        	
	        	$('.modal-footer').append('<button id="modify" type="button" class="btn btn-default" data-dismiss="modal">수정완료</button>');
	        	$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
	        	
	        	$('#modify').click(function(event){
		        	var startD = data.s_Sd.substring(0, data.s_Sd.indexOf('T'))+ 'T' + $('#start').val();
		        	var endD = data.s_Ed.substring(0, data.s_Ed.indexOf('T'))+ 'T' + $('#end').val();

		        	console.log(startD);
		        	console.log(endD);
	        		scheduleService.modify({
	        			s_Seq: data.s_Seq,
	        			s_Contents: $('#contents').val(),
	        			s_Sd: startD,
	        			s_Ed: endD,
	        			s_Color: $('#color').val(),
	        			s_Place: $('#place').val(),
	        			s_Memo: $('#memo').val()
	        		}, function(result){
	        			scheduleService.get(calEvent._id, function(list){
		        			console.log("===== modify ======");
	        				console.log(list);
	        				
		        			var event={
			        				"id": calEvent._id,
			        				"title": list.s_Contents,
			        				"start": list.s_Sd,
			        				"end": list.s_Ed,
			        				"color": list.s_Color,
			        			}
		        			
							$('#calendar').fullCalendar('removeEvents', calEvent._id);
							$('#calendar').fullCalendar('renderEvent', event);
	        			});


		        		});
		        	});
	        	});
			});
			$('#listfaq').click(function(){
	     		$('.modal-header').empty();
	    		$('.modal-body').empty();
	    		$('.modal-footer').empty();
	    	
	    		scheduleService.getFaq(calEvent._id, function(list){
	    			console.log(list);
	    	
	    			$('.modal-header').append('회원이 문의하신 글입니다!');
	    			
	    			for(var i=0, len= list.length||0; i<len; i++){
	    				
	    				var date = moment(list[i].f_Date).format('MM/DD HH:mm');
						var content = list[i].f_Contents.split('<br>').join("\r\n");
	    				
	    				var str="";
						
						str += '<div class="faq">';
						str += '<div class="faq-photo"><img src="/resources/images/'+ list[i].m_Photo +'"></div>';
						str += '<div class="faq-name">'+list[i].m_Name+'</div>';
						str += '<div class="faq-date">'+list[i].f_Date+'</div>';
						str += '<div class="faq-reply"><button class="reply-register" type="button">답글</button></div>';
						str += '<div class="faq-contents">'+ content + '</div>';
						str += '<div class="reply-form" style="margin-bottom: 20px; margin-left: 50px; display:none;" >';
						str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
						str += '<div class="reply-input"><textarea class="reply-text" row="3" cols="50"></textarea></div>';
						str += '<div class="faq-reply"><button class="reply-insert" data-seq="'+list[i].f_Seq +'" type="button">등록</button>';
						str += '<button class="reply-cancel" type="button" style="display:none;">취소</button></div></div></div>';
						
						for(var j=0, len2 = list[i].listReply.length||0; j<len2; j++){
							str += '<div class="reply" style="margin-left: 50px;">';
							str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
							str += '<div class="reply-name">'+ list[i].e_Name + '</div>';
							str += '<div class="reply-date">'+ list[i].listReply[j].sr_Date + '</div>';
							str += '<div class="reply-contents">'+ list[i].listReply[j].sr_Contents + '</div></div>';
						}

						
						$('.modal-body').append(str);
	    			}

				    $('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
				    $('#modal').modal();
					
					$(document).on("click", '.reply-register', function(){
						$(this).parent().parent().find('.reply-cancel').show();
						$(this).parent().parent().find('.reply-form').show();
					});
					$(document).on("click", '.reply-cancel',function(){
						$(this).parent().parent('.reply-form').hide();
					});
					
					$(document).on("click", '.reply-insert', function(){
						var text = $(this).parent().parent().find('.reply-input').find('.reply-text').val();
						text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

						var seq = $(this).parent().find('.reply-insert').data("seq");
						
						scheduleService.insertReply({sr_Contents: text, f_Seq: seq}, function(result){

				    		$('.modal-body').empty();
				    		
				    		scheduleService.getFaq(calEvent._id, function(list){
				    			console.log(list);
				    	
				    			for(var i=0, len= list.length||0; i<len; i++){
				    				
				    				var date = moment(list[i].f_Date).format('MM/DD HH:mm');
									var content = list[i].f_Contents.split('<br>').join("\r\n");
									var str="";
									
									str += '<div class="faq">';
									str += '<div class="faq-photo"><img src="/resources/images/'+ list[i].m_Photo +'"></div>';
									str += '<div class="faq-name">'+list[i].m_Name+'</div>';
									str += '<div class="faq-date">'+list[i].f_Date+'</div>';
									str += '<div class="faq-reply"><button class="reply-register" type="button">답글</button></div>';
									str += '<div class="faq-contents">'+ content + '</div>';
									str += '<div class="reply-form" style="margin-bottom: 20px; margin-left: 50px; display:none;" >';
									str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
									str += '<div class="reply-input"><textarea class="reply-text" row="3" cols="50"></textarea></div>';
									str += '<div class="faq-reply"><button class="reply-insert" data-seq="'+list[i].f_Seq +'" type="button">등록</button>';
									str += '<button class="reply-cancel" type="button" style="display:none;">취소</button></div></div></div>';
									
									for(var j=0, len2 = list[i].listReply.length||0; j<len2; j++){
										str += '<div class="reply" style="margin-left: 50px;">';
										str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
										str += '<div class="reply-name">'+ list[i].e_Name + '</div>';
										str += '<div class="reply-date">'+ list[i].listReply[j].sr_Date + '</div>';
										str += '<div class="reply-contents">'+ list[i].listReply[j].sr_Contents + '</div></div>';
									}

									
									$('.modal-body').append(str);
				    			}

							    $('#modal').modal();
							});
						});
	    			});
	    		});
				});
			},
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      fixedWeekCount:false,
      height: 500,
  	  events: dataset,
    });

  };
</script>

<title>Insert title here</title>
</head>
<body>
	
	<div id="container">	
		<div class="profbody col-auto open">
			<div id='profile'></div>
	
			<div id='link'></div>
		</div>
	
		<div class="calbody">
			<div id='calendar'></div>
		</div>
	</div>

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

</body>
</html>