<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/header.jsp" />

<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/css/main.css"></script>
<script src="${ pageContext.request.contextPath }/resources/js/locales/ko.js"></script>

<script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date();

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next',
				center : 'title',
				right : 'today dayGridMonth timeGridWeek timeGridDay listMonth'
			},
			
			initialDate : today, //현재날짜로 초기화
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			locale : 'ko',
			
			events : [ {
				title : 'Long Event',
				start : '2020-06-07',
				end : '2020-06-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-06-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2020-06-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2020-06-11',
				end : '2020-06-13'
			}, {
				title : '일반모임',
				start : '2020-07-23',
				end : '2020-07-23'
			}, {
				title : '정기모임',
				start : '2020-07-17'
			} 
			
		<%-- 	<% 
		  	  for (int i = 0; i < list.size(); i++) {
		  	  	ScheduleDTO dto = (ScheduleDTO)list.get(i);
		%>	
		  	  {
		  	   title : '<%= dto.getSubject() %>',
		  	   start : '<%= dto.getStartDate() %>',
		  	   end : '<%= dto.getEndDate() %>'
		  	   },
		<%
			}
		%>
				{
				   title : 'default',
				   start : "2019-01-01",
				   end : "2019-01-01"
				  } --%>			
			
			]
			
		});

		calendar.render();
		
	});
    
</script>

<style>
body {
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
.add-button {
    position: absolute;
    top: 1px;
    right: 230px;
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}
</style>
<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

	<div id="infoArea" class="col-lg-4" style="float: left;">
		<table style="text-align: center; width: 100%;">
			<tr>
				<div id="monthMove" style="display: flex; align-items: center;" align="center">

					<br /> <br />
					<div style="float: left;">
						<svg width="2.2em" height="2.2em" viewBox="0 0 16 16" class="bi bi-calendar-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
						  <path fill-rule="evenodd" d="M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1zm1-3a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2z" />
						  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5zm9 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5z" />
					  </svg>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div style="float: left;" id="myScore">
						<!-- 소모임 일정 표시 -->
						<h2 id="scheduleList"></h2>
					</div>
					&nbsp;&nbsp;&nbsp;
					<button data-toggle="modal" data-target="#exampleModal" style="border: 0; outline: 0; background: white;">
						<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					 	 <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z" />
					 	 <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z" />
					 	 <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						</svg>
					</button>
				</div>
			</tr>
			<tr>
				<div>
					</br>
					<div>
						<span class="badge badge-pill badge-danger"
							style="font-size: 1.3em;"> 7/17</span> 정기모임 <br /> <br /> <span
							class="badge badge-pill badge-success" style="font-size: 1.3em;">
							7/23</span> 일반모임
					</div>
				</div>
			</tr>
		</table>
	</div>
	
	<!-- <div class="navigation d-flex justify-content-center">
		<ul>
			<li class="nav-item">
				<a href="#">ㄹㄹ</a>
			</li>
		</ul>
	</div> -->

	<!------------------ modal 영역 ---------------------------->
	
	<form method="POST" action="addCalendar.do">
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">모임 일정 추가</h5>
				</div>
				<div class="modal-body">
						<table style="width: 100%; padding: 10px;">
							<tr>
								<td>일정 날짜</td>
								<td><input type="date" name="gdate" id="" class="form-control"  /></td>
							</tr>
							<tr>
								<td>약속 시간</td>
								<td><input type="time" name="gtime" id="time" class="form-control"  /></td>
							</tr>
							<tr>
								<td colspan="2">일정 설명</td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" name="ginfo"
									class="form-control" /></td>
							</tr>
						</table>
						<div class="custom-control custom-checkbox my-2">
							<input type="checkbox" class="custom-control-input"
								id="customCheck2" name="isctn" > 
								<label class="custom-control-label" for="customCheck2">
								정기 모임일 시 체크</label>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light"
						data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">일정 등록</button>
				</div>
			</div>
		</div>
	</div>
	
	</form>

	<!------------------ calendar 영역 ---------------------------->
	<div id="calendarArea" class="col-lg-8" style="float: left;">
		<br />
		<div id='calendar'></div>
		<br />
	</div>
	<br /> <br />
</div>

<script>
	
	$(function(){
	$('.fc-prev-button').on('click',function(){
	
		var test1 = $('.fc-toolbar-title').html();
		console.log(test1);
		var test2 = test1.split(' ');
		console.log(test2);

		for (var i in test2){
			// console.log(test2[i]);
			// if(test2[0] === 'September'){
			// 	console.log('9월의 일정');
			// }

			switch (test2[1]) {
				case '1월':
					// console.log('1월의 일정');
					$('#scheduleList').html('<div><h2>1월의 일정</h2></div>');
					break;
				case '2월':
					$('#scheduleList').html('<div><h2>2월의 일정</h2></div>');
					break;
				case '3월':
					$('#scheduleList').html('<div><h2>3월의 일정</h2></div>');
					break;
				case '4월':
					$('#scheduleList').html('<div><h2>4월의 일정</h2></div>');
					break;
				case '5월':
					$('#scheduleList').html('<div><h2>5월의 일정</h2></div>');
					break;
				case '6월':
					$('#scheduleList').html('<div><h2>6월의 일정</h2></div>');
					break;
				case '7월':
					$('#scheduleList').html('<div><h2>7월의 일정</h2></div>');
					break;
				case '8월':
					$('#scheduleList').html('<div><h2>8월의 일정</h2></div>');
					break;
				case '9월':
					$('#scheduleList').html('<div><h2>9월의 일정</h2></div>');
					break;
				case '10월':
					$('#scheduleList').html('<div><h2>10월의 일정</h2></div>');
					break;
				case '11월':
					$('#scheduleList').html('<div><h2>11월의 일정</h2></div>');
					break;
				case '12월':
					$('#scheduleList').html('<div><h2>12월의 일정</h2></div>');
					break;

				default:
					break;
			}

		}
		
	});
	
	$('.fc-next-button').on('click',function(){
		
		var test1 = $('.fc-toolbar-title').html();
		// console.log(test1);
		var test2 = test1.split(' ');
		// console.log(test2);

		for (var i in test2){
			// console.log(test2[i]);
			// if(test2[0] === 'September'){
			// 	console.log('9월의 일정');
			// }

			switch (test2[1]) {
				case '1월':
					$('#scheduleList').html('<div><h2>1월의 일정</h2></div>');
					break;
				case '2월':
					$('#scheduleList').html('<div><h2>2월의 일정</h2></div>');
					break;
				case '3월':
					$('#scheduleList').html('<div><h2>3월의 일정</h2></div>');
					break;
				case '4월':
					$('#scheduleList').html('<div><h2>4월의 일정</h2></div>');
					break;
				case '5월':
					$('#scheduleList').html('<div><h2>5월의 일정</h2></div>');
					break;
				case '6월':
					$('#scheduleList').html('<div><h2>6월의 일정</h2></div>');
					break;
				case '7월':
					$('#scheduleList').html('<div><h2>7월의 일정</h2></div>');
					break;
				case '8월':
					$('#scheduleList').html('<div><h2>8월의 일정</h2></div>');
					break;
				case '9월':
					$('#scheduleList').html('<div><h2>9월의 일정</h2></div>');
					break;
				case '10월':
					$('#scheduleList').html('<div><h2>10월의 일정</h2></div>');
					break;
				case '11월':
					$('#scheduleList').html('<div><h2>11월의 일정</h2></div>');
					break;
				case '12월':
					$('#scheduleList').html('<div><h2>12월의 일정</h2></div>');
					break;

				default:
					break;
			}
			
		}

	});

	});

	document.getElementById('myScore').addEventListener('click',
	function() {
		calendar.next();
	});
	
	function increaseScore() {
		score1++;
		document.getElementById("myScore").innerHTML = score1;
	}
	
	function _addSc() {
		location.href="${ pageContext.request.contextPath }/sgroup/addCalendar.do";
	}
	
	$('#time').on('change', function() {
		
		var result = $('#time').toISOString().slice(10, 19).replace('T', '').replace(/:/gi, '');
		
		console.log(result);
		
		return result;
		
	});
	

</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
