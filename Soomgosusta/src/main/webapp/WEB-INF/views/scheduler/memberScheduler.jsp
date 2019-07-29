<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<jsp:include page="../includes/header.jsp"></jsp:include>
</header>
<html>
<head>
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
<script type="text/javascript" src="/resources/js/memberScheduler.js"></script>
<link rel="stylesheet" href="/resources/css/memberScheduler.css">
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<script type="text/javascript">

var m_Id = '<c:out value="${loginUser.m_Id}"/>';
var e_Id = 'nano124@gmail.com';
scheduleService.getList(e_Id, function(list){
	console.log(list);

	 var profile = "";
	 profile += '<div id="photo"><img src="/resources/images/' + list.expert.e_Photo + '"></div>';
	 profile += '<div id="info"><p><strong>' + list.expert.e_Name + '</strong> 고수<p>';	 
	 profile += '<p>'+ list.part.p_S_Word + ' 서비스</p>';
	 profile += '<p>'+list.exInfo.ei_District + '<p>';
	 profile += '<p>'+list.expert.e_Rc + '회 고용</p></div>';
	 
	 $('#profile').append(profile);
	 	
		var dataset=[];
		 for(var i=0, len=list.listSchedule.length||0; i<len; i++){
			 console.log(i+": " + list.listSchedule[i].m_Id);
			 if(list.listSchedule[i].m_Id == m_Id){
			 	dataset.push({
					 id: list.listSchedule[i].s_Seq,
					 title: list.listSchedule[i].s_Contents,
			 		 start: list.listSchedule[i].s_Sd,
			 		 end: list.listSchedule[i].s_Ed,
			 		 color: list.listSchedule[i].s_Color
			 	});
			 }
			  else{
				 dataset.push({
					 id: list.listSchedule[i].s_Seq,
					 start: list.listSchedule[i].s_Sd,
					 end: list.listSchedule[i].s_Ed,
					 color: 'black'
				 })
			 }
		 }
		 
		 createCalendar(dataset);
});

function createCalendar(dataset) {
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
 eventClick: function (calEvent, jsEvent, view) {

	 scheduleService.get(calEvent._id, function(list){
		 
		 if(list.m_Id == m_Id){
		 
				var start = moment(list.s_Sd).format('YYYY년 MM월 DD일 HH시 mm분');	
				var end = moment(list.e_Ed).format('YYYY년 MM월 DD일 HH시 mm분');
		
				$('.modal-header').empty();
				$('.modal-body').empty();
				$('.modal-footer').empty();
				  	
				$('.modal-header').append('<strong>일정 상세정보</strong>');
		
				var str = "";	
				str += '<h6><strong><'+list.s_Contents+ '></strong></h6>';
				str += '<h6><strong>시작 시간</strong>: '+ start;
				str += '<h6><strong>끝나는 시간</strong>: '+ end;
				str += '<h6><strong>장소</strong>: '+ list.s_Place+ '</h6>';
				str += '<h6><strong>메모</strong>: '+ list.s_Memo+ '</h6>';
				str += '<br>';
		
				$('.modal-body').append(str);
			
		  	 	$('.modal-footer').append('<button id="insert" type="button" class="btn btn-default">질문 등록</button>');
			  	$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');		
	
				$('#modal').modal();
		
			}
		else{
				$('.modal-header').empty();
				$('.modal-body').empty();
				$('.modal-footer').empty();
				
				$('.modal-header').append('<strong>일정 상세정보</strong>');
				
				var str3="";
				str3 += '<strong>일정 열람이 불가합니다!</strong><br>';
				
				$('.modal-body').append(str3);

			  	$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');		
			  	
				$('#modal').modal();
			}
		
		$('#insert').click(function(){
    		scheduleService.getFaq(calEvent._id, function(list){
    			console.log(list);
    			
				$('.modal-header').empty();
				$('.modal-body').empty();
				$('.modal-footer').empty();
				
    			$('.modal-header').append('<strong>고수에게 자유롭게 문의하세요!</strong>');
				var str="";
				
    			for(var i=0, len= list.length||0; i<len; i++){
    				
    				var date = moment(list[i].f_Date).format('MM/DD HH:mm');
					var content = list[i].f_Contents.split('<br>').join("\r\n");
    				
					str += '<div class="faq">';
					str += '<div class="faq-photo"><img src="/resources/images/'+ list[i].m_Photo +'"></div>';
					str += '<div class="faq-name">'+list[i].m_Name+'</div>';
					str += '<div class="faq-date">'+list[i].f_Date+'</div>';
					str += '<div class="faq-contents">'+ content + '</div>';
					
					for(var j=0, len2 = list[i].listReply.length||0; j<len2; j++){
						str += '<div class="reply" style="margin-left: 50px;">';
						str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
						str += '<div class="reply-name">'+ list[i].e_Name + '</div>';
						str += '<div class="reply-date">'+ list[i].listReply[j].sr_Date + '</div>';
						str += '<div class="reply-contents">'+ list[i].listReply[j].sr_Contents + '</div></div>';
					}

    			}

				str += '<br><br><textarea id="textarea" rows="3" cols="50" style="margin-right:20px;"></textarea>';
				str += '<button class="faq-register" type="button">등록</button>';
				$('.modal-body').append(str);
				
			    $('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
			    $('#modal').modal();
				
				$(document).on("click", '.faq-register', function(){

					var text = $('#textarea').val();
					
					text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

					scheduleService.register({f_Contents: text, s_Seq: calEvent._id}, function(result){
						console.log("success");
						
			    		$('.modal-body').empty();
			    		
			    		scheduleService.getFaq(calEvent._id, function(list){
			    			console.log(list);
			    	
			    			var str="";
			    			for(var i=0, len= list.length||0; i<len; i++){
			    				
			    				var date = moment(list[i].f_Date).format('MM/DD HH:mm');
								var content = list[i].f_Contents.split('<br>').join("\r\n");
										
								str += '<div class="faq">';
								str += '<div class="faq-photo"><img src="/resources/images/'+ list[i].m_Photo +'"></div>';
								str += '<div class="faq-name">'+list[i].m_Name+'</div>';
								str += '<div class="faq-date">'+list[i].f_Date+'</div>';
								str += '<div class="faq-contents">'+ content + '</div></div>';

								
								for(var j=0, len2 = list[i].listReply.length||0; j<len2; j++){
									str += '<div class="reply" style="margin-left: 50px;">';
									str += '<div class="reply-photo"><img src="/resources/images/'+ list[i].e_Photo + '"></div>';
									str += '<div class="reply-name">'+ list[i].e_Name + '</div>';
									str += '<div class="reply-date">'+ list[i].listReply[j].sr_Date + '</div>';
									str += '<div class="reply-contents">'+ list[i].listReply[j].sr_Contents + '</div></div>';
								}

			    			}

							str += '<textarea id="textarea" rows="3" cols="50" style="margin-right: 20px;"></textarea>';
							str += '<button class="faq-register" type="button">등록</button>';
							$('.modal-body').append(str);
							
						    $('#modal').modal();
						});
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
 events: dataset
});

};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<!-- /.modal -->
	
</body>
</html>