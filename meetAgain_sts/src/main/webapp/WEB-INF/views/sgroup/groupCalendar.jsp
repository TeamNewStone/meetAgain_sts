<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.meetAgain.sgroup.model.vo.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Calendar cal = (Calendar)session.getAttribute("sclist");
%>
<%-- <%if ( cal == null ) { %>
<script>
		alert('불러오기 완료');
</script>
<% } else { %>
	<script>
		alert('불러오기 실패');
	</script>
<% } %> --%>

<c:import url="/WEB-INF/views/common/header.jsp" />

<link href='${ pageContext.request.contextPath }/resources/css/main.css' rel='stylesheet' type='text/css'>
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/locales/ko.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/title_ko.js"></script>
<%-- <script src="${ pageContext.request.contextPath }/resources/js/addEvent.js"></script> --%>
<%-- <script src="${ pageContext.request.contextPath }/resources/js/test.js"></script> --%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy.MM.dd" />



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
#tx{
	padding-right: 50px;
}
</style>

<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

<div class="container" style="overflow: hidden; height: auto;">

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
						<span class="badge badge-pill badge-danger" style="font-size: 1.3em;">7/17</span>정기모임 <br /> <br />
						<span class="badge badge-pill badge-success" style="font-size: 1.3em;">7/23</span>일반모임
						
						<span id="allList">리스트</span>
						
							<c:forEach items="${sclist}" var="sc" varStatus="scIndex">
					</div>
				</div>
			</tr>
		</table>
	</div>

	<!------------------ modal 영역 ---------------------------->
	
	<!-- <input type="text" id="rst" value="${sc.gtime}, ${statusindex.index}, ${sc.gdate}"/> -->
	<!-- <input type="text" name="rst2" id="rst2"> -->
<%-- 	
	<c:set var="realDate" value="${sc.gdate}"/>
	<c:set var="realTime" value="${sc.gtime}"/>
	<c:set var="realCutTime" value="${fn:substring(realTime, 0, 10)}"/> --%>
<%-- 	<span>${realTime}</span><br>
	<span>${realCutTime}</span><br> --%>	
	
	<button type="submit" class="btn btn-primary" id="addCal">아 왜안되지</button>

	<script>
		// var str = $('#rst').val();
		// console.log(str.substr(10));

		/* var str2 = $('${realTime}').val();	
		console.log(str2.substr(0, 10)); */
	</script>
	

		
	<form method="POST" action="addCalendar.do">
	
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel" style="text-align: center;">모임 일정 추가</h4>
						<h6>오늘날짜 : ${year}</h6>
						
					</div>
					<div class="modal-body">

						<table id="my_table_1" data-toggle="table" data-sort-stable="true">
							<thead>
							<tr>								
								<hr>
							</tr>
							</thead>							
						   <tbody>
								<tr>
									<td id="tx">일정 시작 날짜</td>
									<td><input type="date" name="gdate" id="gdate" class="form-control" /></td>
								</tr>
								<tr>
									<td id="tx">일정 끝 날짜</td>
									<td><input type="date" name="gdateEnd" id="gdateEnd" class="form-control" /></td>
								</tr>
								<tr>
									<td id="tx">일정 설명</td>
									<td><input type="text" name="ginfo" id="title" class="form-control"  /></td>
								</tr>
								<tr>
									<td id="tx">약속 시간</td>
									<td><input type="time" name="gtime" id="gtime" class="form-control"  /></td>
								</tr>
								<tr>
									<td id="tx">정기 모임</td>
									<td><input type="checkbox" name="isctn" id="isctn" /></td>
								</tr>	
	
								</tbody>
						</table>

					</div>	

					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary" id="addCal">일정 등록</button>
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
	document.getElementById('myScore').addEventListener('click', function() {
		calendar.next();
	});	
	function increaseScore() {
		score1++;
		document.getElementById("myScore").innerHTML = score1;
	}	
	function addCal() {
		location.href="${ pageContext.request.contextPath }/sgroup/addCalendar.do";
	}
</script>
<script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date();
	
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : { // 달력 헤더
				left : 'prev,next',
				center : 'title',
				right : 'today dayGridMonth timeGridWeek timeGridDay listMonth'
			},
			
			initialDate : today, //현재날짜로 초기화
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			locale : 'ko', // 한글
			 
			events : [
			   {
				 id : "5",
				 title: "1fault",
				 start : "2020-08-15",
				 end : "2020-08-17"				 
			   },
			   <c:forEach items="${sclist}" var="sc" varStatus="scIndex">
			   {
			   // id : "${sc.gid}",
			   title : "${sc.ginfo}",
			   start : "${sc.gdate}",
			   end : "${sc.gdateEnd}"
			   }<c:if test="${!scIndex.last}">,</c:if>			   
			   </c:forEach>
			],
			
			eventClick: function(info) {
				
				var realTitle = title;
				
				console.log(realTitle);
				
			    /* alert('Event: ' + info.event.title);
			    alert('일정 위치 x, y: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
			    alert('View: ' + info.view.type); */			    			    
			   
			    var result = confirm(info.event.title + '의 ' + ' 일정을 삭제하시겠습니까 ??');
			    	if(result){
			    		return null;
			    	} else {			    		
			    		return false;
			    	}
			    
			    // change the border color just for fun
			    info.el.style.borderColor = 'red';
			    
			  }
	
		});
		
		// 출력
		calendar.render();
	
		// 배열 이벤트 데이터 불러오기		
		console.log(calendar.getEvents(5));
		
				
		
		
	});

</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	
	<c:forEach items="${sclist}" var="sc1" varStatus="scIndex">
	<c:set var="realtime" value='${sc1.gtime}' />
	</c:forEach>
	
	var ime = "${realtime}";
	console.log(ime);
	
</script>

<!-- 

<script>
var editTitle = $('#title').val();
var editStart = $('#start').val();
var editEnd = $('#end').val();

	var addEvent = function () {
			
		var tseData = [ {
			
			title : editTitle,
			start : editStart,
			end : editEnd

		} ];

		console.log(tseData);

	} 


</script>

<script>
/**
 * test
 */

 document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date();

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : { // 달력 헤더
				left : 'prev,next',
				center : 'title',
				right : 'today dayGridMonth timeGridWeek timeGridDay listMonth'
			},
			
			initialDate : today, //현재날짜로 초기화
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			locale : 'ko', // 한글
			
			// 이벤트 예
			events : [ {			
			   title : 'default',
			   start : "2019-01-01",
			   end : "2019-01-01"				
			}, {
				title : '일반모임',
				start : '2020-07-23',
				end : '2020-07-23'
			}, {
				title : '정기모임',
				start : '2020-07-17'
			}, {
				title : 'Long Event',
				start : '2020-06-07',
				end : '2020-06-10'
			}, {
				id: 'a',
				title: '30일 이벤트',
				start: '2020-07-30'
			} ]	

		});
		
		// 출력
		calendar.render();

		// 배열 이벤트 데이터 불러오기
		var tse = calendar.getEvents('a');
		console.log(tse);

	});    
	
</script>
 -->
 
 
 
 
 
 