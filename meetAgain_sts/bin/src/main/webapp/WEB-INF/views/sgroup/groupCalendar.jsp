<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.meetAgain.sgroup.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />

<link href='${ pageContext.request.contextPath }/resources/css/main.css' rel='stylesheet' type='text/css'>
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/locales/ko.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/title_ko.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy.MM.dd" />

	<div class="container" style="overflow: hidden; height: auto;">
		<c:import url="/WEB-INF/views/common/groupHeader.jsp" />		
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
		<div class="row">
		
			<div class="col-4">
			<div style="margin-bottom : 10%;">
			<div style="float:left;">
				<h2 id="scheduleList">
				<c:if test="${sysMonth lt 10}">
					${fn:substring(sysMonth,1,2)}월의 일정
				</c:if>
				<c:if test="${sysMonth gt 9}"> 
					${sysMonth}월의 일정
				</c:if></h2>
			</div>
			<div style="float:right;">
			<button class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal" value="일정추가">일정추가</button>
			</div>
			</div>
				<!-- 소모임 타이틀 표시 -->
				<br />
				<br />
			<div>
				
				<span>일반모임</span><br>
					<c:forEach items="${sclist}" var="normalList" varStatus="scIndex">
						<c:set var = "calTime" value="${normalList.getGTime()}"/>
						<c:set var="genCtn" value="${normalList.getIsCtn()}" />
							<c:if test="${genCtn eq 'N'}">
							<li class="list-group-item">
							일정 : ${normalList.getGInfo()}<br>
							날짜 : 
							<c:if test="${normalList.getGDate() <normalList.getGDateEnd()}">
							${normalList.getGDate()} ~ ${normalList.getGDateEnd()}
							</c:if>
							<c:if test="${normalList.getGDate() > normalList.getGDateEnd()}">
							${normalList.getGDateEnd()} ~ ${normalList.getGDate()}
							</c:if>
							<br>
							시간 : ${fn:substring(calTime, 10, 16)}	<br>
							</li>											
							</c:if>
					</c:forEach>					
				<br><span>정기모임</span>
					<c:forEach items="${sclist}" var="normalList" varStatus="scIndex">
						<c:set var = "calTime" value="${normalList.getGTime()}"/>
						<c:set var="genCtn" value="${normalList.getIsCtn()}" />
							<c:if test="${genCtn eq 'Y'}">
							<li class="list-group-item">
							일정 : ${normalList.getGInfo()}<br>
							날짜 : 
							<c:if test="${normalList.getGDate() <normalList.getGDateEnd()}">
							${normalList.getGDate()} ~ ${normalList.getGDateEnd()}
							</c:if>
							<c:if test="${normalList.getGDate() > normalList.getGDateEnd()}">
							${normalList.getGDateEnd()} ~ ${normalList.getGDate()}
							</c:if>
							시간 : ${fn:substring(calTime, 10, 16)}	<br>
							</li>											
							</c:if>
					</c:forEach>
				</div>	
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
						 
						 <input type="hidden" name="gid" value="${gid}" />
						 <!-- <input type="hidden" name="gId" /> -->
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
									<c:if test="${isCtn }">
									<tr>
										<td id="tx">정기 모임</td>
										<td><input type="checkbox" id="isCtnChk" /></td>
									</tr>		
									</c:if>
								</tbody>
							</table>								
						<input type="hidden" name="isCtn" id="_Y" value="N" />											
						<div class="modal-footer">
							<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary" id="addCal">일정 등록</button>
						</div>
						</form>					
					</div>
				</div>
			</div>
		</div>
		<br />
		<br />
		<br />
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
					id : "${sc.getCdId()}",
					title : "${sc.getGInfo()}",
					start : "${sc.getGDate()}",
					end : "${sc.getGDateEnd()}"
				   }
				   <c:if test="${!scIndex2.last}">,</c:if>		   
				   </c:forEach>
				],
				
				eventClick: function(info) {
					
					var result = confirm('해당 "' + info.event.title + '" 일정을 삭제하시겠습니까 ??');
								
					if(result == true){
						// alert('클릭 캘린더 위치: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY); // 좌표
						var cdId = info.event._def.publicId;	
						// $(info.el.style.borderColor) = 'blueviolet'; 정기
						
						$.ajax({
					       url: '${pageContext.request.contextPath}/sgroup/deleteCalendar.do',
					       data: {
					    	   cdId : cdId
					       },
					       type: "POST",
					       success: function () {
					          //$('#calendar').fullCalendar('removeEvents', event);
					          alert('일정이 삭제되었습니다.');
					          $(info.el).remove();
					    	  location.reload(true); 
					       }
						   
					    });
						
					} else {
						return null;
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

		$('#isCtnChk').change( function() {
			if ( $('#isCtnChk').is(':checked')) {
				console.log('체크값 : ' + $(this).val());
				$('#_Y').val('Y');
				console.log($('#_Y').val());
			} else {
				console.log('체크값? : ' + $(this).val());
				$('#_Y').val('N');	
				console.log($('#_Y').val());				
			}
		});
			
	</script>
	
<c:import url="/WEB-INF/views/common/footer.jsp" />
