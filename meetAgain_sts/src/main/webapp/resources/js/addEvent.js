/**
 * meetAgain 일정등록 이벤트
 */

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
