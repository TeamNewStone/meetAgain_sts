<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.meetAgain.sgroup.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<%-- <%
	Calendar cal = (Calendar)session.getAttribute("sclist");
%>
<%if ( cal == null ) { %>
	<script>
		//alert('불러오기 완료');
		console.debug(cal);
	</script>
<% } else { %>
	<script> 
		//alert('불러오기 실패');
		console.debug(cal);
	</script>
<% } %> --%>

<link href='${ pageContext.request.contextPath }/resources/css/main.css' rel='stylesheet' type='text/css'>
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/locales/ko.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/title_ko.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy.MM.dd" />

	<div class="container" style="overflow: hidden; height: auto;">
		<c:import url="/WEB-INF/views/common/groupHeader.jsp" />		

		<div class="row">
		
			<div class="col-4">
				<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal" value="일정추가">일정추가</button>
				<!-- 소모임 타이틀 표시 -->
				<h2 id="scheduleList"></h2>
				
				<span>일반모임</span><br>
					<c:forEach items="${sclist}" var="normalList" varStatus="scIndex">
					<c:set var = "calTime" value="${normalList.getGTime()}"/>
						<li class="list-group-item" id="test5">모임명 : ${normalList.getGInfo()}<br>
						일정 : ${normalList.getGDate()} ~ ${normalList.getGDateEnd()}<br>시간 : ${fn:substring(calTime, 10, 16)}</li>
					</c:forEach>					
				<br><span>정기모임</span>
							
				<!-- <span style="float: left;" >일반모임</span><br>
				<div id="_normalScheduleList"></div>
				<br /><br />
				
				<span style="float: left;">정기모임</span><br>						
				<div id="_meetScheduleList">
				</div>	 -->	
			</div>
			
			<div class="col-8">
				<!------------------ calendar 영역 ------------------>
				<div id='calendar'></div>				
				
			</div>
			
		</div>

		<!------------------ modal 영역 ------------------>	
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel" style="text-align: center;">모임 일정 추가</h4>
						<h6>오늘날짜 : ${year}</h6>						
					</div>
					<div class="modal-body">						
						<!-- 소모임id -->
						<form method="POST" action="addCalendar.do">
																				
						 <input type="hidden" name="gId" value="${gid}" /> 
							<table id="my_table_1" data-toggle="table" data-sort-stable="true">													
							   <tbody>
									<tr>
										<td id="tx">일정 시작 날짜</td>
										<td><input type="date" name="gDate" class="form-control" /></td>
									</tr>
									<tr>
										<td id="tx">일정 끝 날짜</td>
										<td><input type="date" name="gDateEnd" class="form-control" /></td>
									</tr>
									<tr>
										<td id="tx">일정 설명</td>
										<td><input type="text" name="gInfo" class="form-control"  /></td>
									</tr>
									<tr>
										<td id="tx">약속 시간</td>
										<td><input type="time" name="gTime" class="form-control"  /></td>
									</tr>
									<tr>
										<td id="tx">정기 모임</td>
										<td><input type="checkbox" name="isCtn" /></td>
									</tr>		
								</tbody>
							</table>								
						<div class="modal-footer">
							<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary" id="addCal">일정 등록</button>
						</div>
						</form>					
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<script>

		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var today = new Date();
		
			var calendar = new FullCalendar.Calendar(calendarEl, {
			
				headerToolbar : { // 달력 헤더
					left : 'prev,next',
					center : 'title',
					right : 'today dayGridMonth'
				},
				
				initialDate : today, //현재날짜로 초기화
				navLinks : true, // can click day/week names to navigate views
				editable : true,
				dayMaxEvents : true, // allow "more" link when too many events
				locale : 'ko', // 한글
				 
				events : [
				   /* {
					 id : "5",
					 title: "1fault",
					 start : "2020-08-15",
					 end : "2020-08-17"				 
				   }, */
				   <c:forEach items="${sclist}" var="sc" varStatus="scIndex2">
				   {
				   id : "${sc.getGId()}",
				   title : "${sc.getGInfo()}",
				   start : "${sc.getGDate()}",
				   end : "${sc.getGDateEnd()}"
				   }
				   <c:if test="${!scIndex2.last}">,</c:if>		   
				   </c:forEach>
				],
				
				eventClick: function(info) {
					
					var realTitle = '${sc.getGInfo()}';
					console.log(realTitle);
					
					
					/* alert('Event: ' + info.event.title);
					alert('일정 위치 x, y: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
					alert('View: ' + info.view.type); */    			    
				   
					var result = confirm('해당 "' + info.event.title + '" 일정을 삭제하시겠습니까 ??');
						if(result){
							
							/* $.ajax{
								url: deleteCalendar.do
							} */
							
							return null;
						} else {		    		
							return false;
						}
						
				}
		
			});
			
			// 출력
			calendar.render();
		
			// 배열 이벤트 데이터 불러오기		
			// console.log(calendar.getEvents(5));
			
		});

	</script>	
	
	<script>
		function addCal() {
				location.href="${ pageContext.request.contextPath }/sgroup/addCalendar.do";
		}
	</script>
	
<c:import url="/WEB-INF/views/common/footer.jsp" />
