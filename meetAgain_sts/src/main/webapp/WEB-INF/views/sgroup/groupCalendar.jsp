<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />

<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/css/main.css"></script>

<script>


	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date();

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title, #dayday',
				right : 'dayGridMonth'
			},
			initialDate : today, //현재날짜로 초기화
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
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
			} ]
		});
		
		// 왼쪽 버튼을 클릭하였을 경우
				
	    $("button.fc-prev-button").click(function() {
	            var date = $("#calendar").main("getDate");
	            convertDate(date);
	        });

	        // 오른쪽 버튼을 클릭하였을 경우
	        $("button.fc-next-button").click(function() {
	            var date = $("#calendar").main("getDate");
	            convertDate(date);
	        });

		calendar.render();
	});
	
	function convertDate(date) {
        var date = new Date(date);
        alert(date.yyyymmdd());
    }

    // 받은 날짜값을 YYYY-MM-DD 형태로 출력하기위한 함수.
    Date.prototype.yyyymmdd = function() {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();
        return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
    }
    
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
</style>
<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

	<div id="infoArea" class="col-lg-4" style="float: left;">
		<table style="text-align: center; width: 100%;">
			<tr>
				<div id="monthMove" style="display: flex; align-items: center;"
					align="center">

					<br /> <br />
					<div style="float: left;">
						<svg width="2.2em" height="2.2em" viewBox="0 0 16 16"
							class="bi bi-calendar-check" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
								d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
  <path fill-rule="evenodd"
								d="M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1zm1-3a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2z" />
  <path fill-rule="evenodd"
								d="M3.5 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5zm9 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5z" />
	</svg>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div style="float: left;" id="myScore">
						<h3 id="dayday">7월의 일정</h3>
					</div>
					&nbsp;&nbsp;&nbsp;
					<button data-toggle="modal" data-target="#exampleModal"
						style="border: 0; outline: 0; background: white;">
						<svg width="2em" height="2em" viewBox="0 0 16 16"
							class="bi bi-plus-circle" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
 	 <path fill-rule="evenodd"
								d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z" />
 	 <path fill-rule="evenodd"
								d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z" />
 	 <path fill-rule="evenodd"
								d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
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

	<!------------------ modal 영역 ---------------------------->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">모임 일정 추가</h5>
				</div>
				<div class="modal-body">
					<form action="submit">
						<table style="width: 100%; padding: 10px;">
							<tr>
								<td>일정 날짜</td>
								<td><input type="date" name="" id="" class="form-control"  /></td>
							</tr>
							<tr>
								<td>약속 시간</td>
								<td><input type="time" name="" id="" class="form-control"  /></td>
							</tr>
							<tr>
								<td colspan="2">일정 설명</td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" name=""
									class="form-control" /></td>
							</tr>
						</table>
						<div class="custom-control custom-checkbox my-2">
							<input type="checkbox" class="custom-control-input"
								id="customCheck2" > 
								<label class="custom-control-label" for="customCheck2">
								정기 모임일 시 체크</label>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">일정 등록</button>
				</div>
			</div>
		</div>
	</div>



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
	$("#group-calbtn").attr('class','btn btn-secondary');
	
	}
);


	document.getElementById('myScore').addEventListener('click',
	function() {
		calendar.next();
	});
	
	document.getElementById('dayday').addEventListener('click', function() {
		  var date = calendar.getDate();
		  alert("The current date of the calendar is " + date.toISOString());
		});

	function increaseScore() {
		score1++;
		document.getElementById("myScore").innerHTML = score1;
	}
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />