/**
 * Google Graph API 
 */

	  google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      // 원형 차트
      function drawChart() {

        var data1 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     9],
          ['Eat',      7],
          ['Commute',  4],
          ['Watch TV', 2],
          ['Sleep',    2]
        ]);

         var options1 = {
          //title: '7월 첫째주 모임이 제일 많이 생성된 지역',
          slices: {
            0: { color: '#ffb5b6' },
            1: { color: '#132742' },
            2: { color: 'ivory'},
            3: { color: '#132742' },
            4: { color: '#ffb5b6' }
          },
          legend : {position: 'none'}
        };
        

        var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));


        chart1.draw(data1, options1);

        
        // 라인차트
        var data2 = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options2 = {
          //title: 'Company Performance',
          curveType: 'function'
          //legend: { position: 'bottom' }
        };

        var chart2 = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart2.draw(data2, options2);
      }
      
      $(function(){
    	  console.log($(window).width());
      })