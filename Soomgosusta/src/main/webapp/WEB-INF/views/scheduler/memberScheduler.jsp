<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/resources/bootstrap-3.3.2-dist/js/jquery-3.2.1.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/memberScheduler.js"></script>
<link rel="stylesheet" href="/resources/css/memberScheduler.css">
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<script type="text/javascript">
var m_Id = 'nano125@naver.com';
var e_Id = '<c:out value="${e_Id}"/>';
scheduleService.getList(e_Id, function(list){
	//console.log(list);
	
	var profile = "";
	 profile += '<img src="/resources/images/' + list.expert.e_Photo + '">';
	 profile += '<div id="info"><h4>'+ list.part + ' 서비스</h4>';
	 profile += '<strong>' + list.expert.e_Name + '</strong> 고수<br>';	 
	 profile += list.exInfo.ei_District + '<br>';
	 profile += list.expert.e_Rc + '회 고용</div>';
	 
	 $('#profile').append(profile);
	 	
	 console.log(m_Id);
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
 ///////////이벤트 수정 삭제//////////////
 eventClick: function (calEvent, jsEvent, view) {

	 scheduleService.get(calEvent._id, function(list){
		if(list.m_Id == m_Id){
		
				console.log(list);
		 
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
		
				str += '<strong>궁금하신 점 있으면 문의주세요!</strong><br>';
				str += '<textarea id="faq" rows="3" cols="50"></textarea>';
		
				$('.modal-body').append(str);
			
		  	 	$('.modal-footer').append('<button id="insert" type="button" class="btn btn-default" data-dismiss="modal">질문 등록</button>');
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
				str3 += '<strong>궁금하신 점 있으면 문의주세요!</strong><br>';
				str3 += '<textarea id="faq" rows="3" cols="50"></textarea>';
				
				$('.modal-body').append(str3);

		  	 	$('.modal-footer').append('<button id="insert" type="button" class="btn btn-default" data-dismiss="modal">질문 등록</button>');
			  	$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');		
			  	
				$('#modal').modal();
			}
		
		$(document).on("click", "#insert", function(){
			
			var data = $('#faq').val();
			data = data.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			scheduleService.register({f_Contents: data, s_Seq: calEvent._id}, function(result){
				console.log("success");
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
	<div id='profile'></div>

	<div id='calendar'></div>
	
	<div id="menu">
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