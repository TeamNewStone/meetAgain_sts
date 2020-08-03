
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
			events : [
			   <c:forEach items="${sclist}" var="sc" varStatus="statusindex"> 			
			   {
			   title : "${sc.ginfo}",
			   start : "${sc.gdate}"
			   },
			   </c:forEach>
			]	

		});
		
		// 출력
		calendar.render();

		// 배열 이벤트 데이터 불러오기
		// var tse = calendar.getEvents('a');
		console.log(calendar.getEvents('a'));

	});    
