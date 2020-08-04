/**
 * meetAgain 일정 한글
 */ 
	 $(function(){
		 
		$('.fc-prev-button').on('click',function(){
		
			var test1 = $('.fc-toolbar-title').html();
			//console.log(test1);
			var test2 = test1.split(' ');
			//console.log(test2);
 
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
