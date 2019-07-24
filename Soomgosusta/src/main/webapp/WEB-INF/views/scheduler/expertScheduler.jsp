<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script type="text/javascript" src="/resources/js/expertScheduler.js"></script>
<link rel="stylesheet" href="/resources/css/expertScheduler.css">
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
scheduleService.getList("nano124@gmail.com", function(list){
	
 	for(var i=0, len=list.listSchedule.length||0; i<len; i++){
		console.log(list.listSchedule[i]);
	}
 	 
	 var profile = "";
	 profile += '<img src="/resources/images/' + list.expert.e_Photo + '">';
	 profile += '<div id="info"><h4>'+ list.part + ' 서비스</h4>';
	 profile += '<strong>' + list.expert.e_Name + '</strong> 고수<br>';	 
	 profile += list.exInfo.ei_District + '<br>';
	 profile += list.expert.e_Rc + '회 고용</div>';
	 
	 var link = "<h5>회원 목록</h5>";
	 $('#link').append(link);
 	 
	 for(var j=0, len=list.listMatch.length||0; j<len; j++){
	     var link = '<div class="m_info">';
		 link += '<img src="/resources/images/' + list.listMatch[j].m_Photo + '">';
		 link += '<div id="m">' + list.listMatch[j].m_Name;
		 link += '</div>';
		 
 		 if(list.listMatch[j].m_Session == 'logout'){
			 link += '<img src="/resources/images/logout.JPG" style="width:10px; height:10px; margin-top:18px;"></div>';
		 }else{
			 link += '<img src="/resources/images/login.JPG" style="width:10px; height:10px; margin-top:18px;"></div>';
		 }
 		 
 		 $('#link').append(link);

	} 



	 
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
        	  $('#insert').click(function(){
				  console.log("insert ---------------");
            	  var startD = moment(start).format('YYYY-MM-DD');
            	  console.log("startD: " + startD);
            	  var startT = startD+'T'+$('#start').val();
            	  
            	  var endD = moment(end).format('YYYY-MM-DD');
            	  var endT = endD+'T'+$('#end').val();

    			  var content = $('#contents').val();
    			  var color = $('#color').val();
    			  
                  calendar.fullCalendar('renderEvent',
                	{
                	  title: content,
                      start: startT,
                      end: endT,
                      color: color
                    });	
                 	
                 	scheduleService.insert(
                 			{s_Contents: content, s_Sd: startT, s_Ed: endT, s_Place: $('#place').val(), m_Id: $('#id').val(), s_Color: $('#color').val(), e_Id: "nano124@gmail.com", s_Memo: $('#memo').val()},
                 			function(result){
								console.log("success");
                 			}
                 	);
        	  	});

      },
      ///////////이벤트 수정 삭제//////////////
      eventClick: function (calEvent, jsEvent, view) {
     	  $('.modal-header').empty();
    	  $('.modal-body').empty();
    	  $('.modal-footer').empty();
    	  
    	  $('.modal-header').append('작업을 선택하세요!');
    	  $('.modal-body').append('<button id="update" type="button" class="btn btn-default">수정</button>');
    	  $('.modal-body').append('<button id="remove" type="button" class="btn btn-default" data-dismiss="modal">삭제</button>');
    	  $('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
    	  
		  $('#modal').modal();
		  
		  $(document).on("click", "#remove", function(event){
			  $('#calendar').fullCalendar('removeEvents', calEvent._id);
			    
			    scheduleService.remove(calEvent._id, function(count){
			    	console.log(count);	
			    }); 
		  });
		  
		  $(document).on("click", "#update", function(event){
				console.log(calEvent._id);
				
			scheduleService.get(calEvent._id, function(data){
				
				console.log("================");
				console.log(data);
				console.log(data.s_Seq);
				console.log("================");
				
		     	$('.modal-header').empty();
		    	$('.modal-body').empty();
		    	$('.modal-footer').empty();				

		    	$('.modal-header').append('내용을 수정하세요');
	        	$('.modal-body').append('<p>시작 시간: <input type="text" id="start" value="'+data.s_Sd+'"></p><p>끝 시간: <input type="text" id="end" value="'+data.s_Ed+'"></p><p>내용: <input type="text" id="contents" value ="'+data.s_Contents+'"></p>');
	        	$('.modal-body').append('<p>장소: <input type="text" id="place" value="'+data.s_Place+'"></p>');
	        	$('.modal-body').append('<p>색상: <input type="text" id="color" value="'+data.s_Color+'"></p>');
	        	$('.modal-body').append('<p>메모: <input type="text" id="memo" value="'+data.s_Memo+'"></p>');
	        	
	        	  $('.modal-footer').append('<button id="modify" type="button" class="btn btn-default" data-dismiss="modal">수정완료</button>');
	        	$('.modal-footer').append('<button id="close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
	        	
	        	$(document).on("click","#modify", function(event){
	        		scheduleService.modify({
	        			s_Seq: data.s_Seq,
	        			s_Contents: $('#contents').val(),
	        			s_Sd: $('#start').val(),
	        			s_Ed: $('#end').val(),
	        			s_Color: $('#color').val(),
	        			s_Place: $('#place').val(),
	        			s_Memo: $('#memo').val()
	        		}, function(result){
	        			console.log("===== modify done ======");
	        			
		        		scheduleService.getList("nano124@gmail.com", function(list){
		        			console.log("getList");
		        			     			 
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

<title>Insert title here</title>
</head>
<body>
	
	<div id='profile'></div>
	
	<div id='link'></div>

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