<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="reviewTitle" value="헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 국회는 의장 1인과 부의장 2인을 선출한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다."/>

<c:import url="/WEB-INF/views/common/header.jsp" />

<!-- 메인 배너 시작 -->
<div class="row"> 
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
   <!--  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/meetAgain/resources/img/BANNER1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/meetAgain/resources/img/BANNER2.jpg" alt="Second slide">
    </div>
   <!--  <div class="carousel-item">
      <img class="d-block w-100" src="/meetAgain/resources/img/dog-4.jpg" alt="Third slide">
    </div> -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<!-- 메인배너 끝 -->

  <!-- 차트 시작 -->
<div class="page-hero" id="banner">
  	<div class="container">
      <div class="row"> 
        <div class="col-sm-12 col-md-12 col-lg-6">
          <h4 style="text-align: center;">현재 제일 많은 모임 카테고리</h4>
          <div id="piechart" style="width:100%; height:500px;"></div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-6">
          <h4 style="text-align: center;">7월 첫째주 모임이 제일 많이 생성된 지역</h4>
          <div id="chart_div" style="width: 100%; height: 500px"></div>
      </div>
      </div>
    </div>
	</div> 
  <!-- 차트 끝-->

<!-- 공지사항 시작-->
<div class="intro bg-light">
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="header">
        <h2>공지사항</h2>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="section desc">
	    <div class="row">
		    <div class="col-12 col-md-12">
          <table class="table" id = "adTop3">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
             
            </tbody>
          </table>
		    </div>
	    </div>
    </div>
  </div>
</div>
<!-- 공지사항 끝 -->


    <!-- 리뷰 시작 -->
    <div class="section">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="header">
          	<h2>리뷰</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 offset-md-2">
          <div class="component">
						<div class="card">
							<div class="card-header">		  	
							<img class="card-img" id="rv0Image" src="/meetAgain/resources/img/fav01.png">
							</div>
						  <div class="card-body">
							  <span class="badge badge-success mb-2" id="rv0Cate">
								NONE
							</span>
						    <h4 class="card-title" id="rv0Title">-</h4>
						    <p class="card-text" id="rv0Content">
						    아직 등록되지 않았습니다.
							</p>
						  </div>
						  <div class="card-footer">
								<button type="button" id="rvBtn0" class="btn btn-outline-secondary"
								>자세히보기</button> &nbsp;
								<span class="badge badge-danger fas fa-heart" id="rv0Like" style="float:right;">0</span>
						  </div>
						</div>
          </div>
        </div>
      <div class="col-md-3 ">
          <div class="component">
						<div class="card">
							<div class="card-header">		  	
							<img class="card-img" id="rv1Image" src="/meetAgain/resources/img/fav01.png">
							</div>
						  <div class="card-body">
							  <span class="badge badge-success mb-2" id="rv1Cate">
								NONE
							</span>
						    <h4 class="card-title" id="rv1Title">-</h4>
						    <p class="card-text" id="rv1Content">
						    아직 등록되지 않았습니다.
							</p>
						  </div>
						  <div class="card-footer">
								<button type="button" id="rvBtn1" class="btn btn-outline-secondary">자세히보기</button> &nbsp;
								<span class="badge badge-danger fas fa-heart" id="rv1Like" style="float:right;">0</span>
						  </div>
						</div>
          </div>
        </div>
         <div class="col-md-3">
          <div class="component">
						<div class="card">
							<div class="card-header">		  	
							<img class="card-img" id="rv2Image"src="/meetAgain/resources/img/fav01.png">
							</div>
						  <div class="card-body">
							  <span class="badge badge-success mb-2" id="rv2Cate">
								NONE
							</span>
						    <h4 class="card-title" id="rv2Title">-</h4>
						    <p class="card-text" id="rv2Content">
						    아직 등록되지 않았습니다.
							</p>
						  </div>
						  <div class="card-footer">
								<button type="button" id="rvBtn2" class="btn btn-outline-secondary">자세히보기</button> &nbsp;
								<span class="badge badge-danger fas fa-heart" id="rv2Like" style="float:right;">0</span>
						  </div>
						</div>
          </div>
        </div>
      </div>

    </div>
<!-- 리뷰 끝 -->

<!-- 리뷰 자세히보기 the modal -->
<div class="modal fade" id="handleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <div style="float:left;">
        <h4 class="modal-title" id="exampleModalLabel">
        <span id="modal-title"></span>
        <span class="badge badge-success mb-2" id="modal-cate">Study</span><br />
        
        </h4>
        <h6 id = "modal-date" style="font-weight:normal;color:#9c9c9c;">2020/02/19 ~ 2020/08/10</h6>
        </div>
        <div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></div>
      </div>
      <div class="modal-body">
      <p id="star_grade">
      별점 : 
	   </p>
        <form action="#">
        <div class="card-header">
        <img class="modal-img" src="/meetAgain/resources/img/dog-1.jpg" style="width : 100%;">
        </div>
        <div class="card-body custom-control custom-checkbox my-2">
		<textarea class="form-control" rows="5" style="resize:none;" readonly >
	</textarea>
        </div>
		   <br />
</form>
        </div>
              <div class="modal-footer">
              <input type="hidden" id="userId" value="${member.userId }" />
              <input type="hidden" name="rvId"  id="reviewId"/>
        <p style="font-size:15px;">이 리뷰가 도움이 되셨나요?
        <button type="button" class="btn btn-outline-danger btn-icon btn-sm" id="likeBtn"><i class="fas fa-heart"></i></button>
        <span id="heartrate" >30</span>
        </p>
      </div>
        

</div>
</div>
</div>

<br><br><br>
<script>

$(function(){
$.ajax({
	url : "selectRvtop3.do",
	success : function(data){
		for(var i in (data.review)){
			var cate = data.review[i].cateId;
			var title = data.review[i].gtitle;
			var content;
			if((data.review[i].rvContent).length>20){
				content = (data.review[i].rvContent).substr(0,19)+'...';
			}else{
				content = data.review[i].rvContent;				
			}
			var like = data.review[i].rvLike;
			var image = data.review[i].rvImage;
			var category;
			
			
			if(cate=="C01") category="운동";
			else if(cate=="C02") category="친목";
			else if(cate=="C03") category="공부";
			else if(cate=="C04") category="취미생활";
			else if(cate=="C05") category="문화생활";
			else if(cate=="C06") category="여행";
			else if(cate=="C07") category="봉사";
			else if(cate=="C08") category="기타";
			
			$("#rv"+i+"Title").html(title);
			$("#rv"+i+"Cate").html(category);
			$("#rv"+i+"Content").html(content);
			$("#rv"+i+"Like").html(like);
			if(image !=null) $("#rv"+i+"Image")
			.attr('src','${ pageContext.request.contextPath }/resources/upload/reviewImg/'+image);
		}
		
		$("#rvBtn1, #rvBtn2, #rvBtn0").click(function(){
			var i;
			if($(this).attr('id') == 'rvBtn0') i=0;
			else if($(this).attr('id') == 'rvBtn1') i=1;
			else i=2;
			
			var gtitle = data.review[i].gtitle;
			var content = data.review[i].rvContent;
			var cate = data.review[i].cateId;
			var star = data.review[i].rvStar;
			var like = data.review[i].rvLike;
			var img = data.review[i].rvImage;
			var sdate = data.sdate[i];
			var edate = data.edate[i];
			var id = data.review[i].rvId;
			var category;
			var starcount;
			
			if(cate=="C01") category="운동";
			else if(cate=="C02") category="친목";
			else if(cate=="C03") category="공부";
			else if(cate=="C04") category="취미생활";
			else if(cate=="C05") category="문화생활";
			else if(cate=="C06") category="여행";
			else if(cate=="C07") category="봉사";
			else if(cate=="C08") category="기타";
			
			if(star==1) starcount = "별점 : ★";
			else if(star==2) starcount = "별점 : ★★";
			else if(star==3) starcount = "별점 : ★★★";
			else if(star==4) starcount = "별점 : ★★★★";
			else if(star==5) starcount = "별점 : ★★★★★";
			else starcount = "별점 : ";
			/* var sdate = $(this).data('sdate');
			var edate = $(this).data('edate');
						var like = $(this).data('like');
			
			
			var img = $(this).data('img');
			var id = $(this).data('rid');
			var starcount; */
			$("#star_grade").html(starcount);
			$("#modal-title").html(gtitle);
			$(".form-control").val(content);
			$("#modal-cate").html(category);
			$("#heartrate").html(like);
			$("#modal-date").html(sdate+" ~ "+edate);
			$("#handleModal").modal();
			$("#reviewId").val(id);
			
			if(img!='') $(".modal-img").attr('src','${ pageContext.request.contextPath }/resources/upload/reviewImg/'+img);
			else $(".modal-img").attr('src','/meetAgain/resources/img/fav01.png');
		});
		
		$("#likeBtn").click(function(){
			
			var rvid = $("#reviewId").val();
			var userid;
			
			if($("#userId").val()!='') {
				userid = $("#userId").val();
				
				$.ajax({
					url : "board/helpRv.do",
					data : {
						rvid : rvid,
						userid : userid
					},
					success : function(data){
						if(data.result==false)	alert("에러 발생!");
						else{
							$("#heartrate").html(data.like);
						}
					},
					error : function(){
						alert("에러 발생");
					}
				});		
			}
			
		});
	},
	error : function(){
		alert("에러 발생");
	}
});
	
	
$.ajax({
	url: 'selectAdtop3.do',
	success : function(data){
		var $table = $('#adTop3');
		for(var i in (data.adboard)){
			// 내용을 모두 담을 tr 생성
			var bid = data.adboard[i].bid;
			var $tr = $('<tr>');
			
			// 내용을 각각 표현할 td 태그 생성
			var $tdBno = $('<td>').text(data.adboard[i].bid);
			var $tdTitle = $('<td>').text(data.adboard[i].btitle);
			var $tdBdate = $('<td>').text(data.boardDate[i]);				
					
			$tr.append($tdBno).append($tdTitle)
			   .append($tdBdate);
			
			$table.append($tr);
			
			
		}
		$("td").css("cursor","pointer");
		$("td").click(function(){
			var bid = $(this).parent().children().eq(0).text();
			
			location.href='${pageContext.request.contextPath}/board/noticeDetail.do?bId='+bid;
		})
	},
	error : function(){
		alert("에러 발생");
	}
});
$("#handleModal").on('hide.bs.modal',function(){
	location.reload();
});
$('[name=upFile]').on('change',function(){
    //var fileName = $(this).val();//C:\fakepath\파일명
    //var fileName = this.files[0].name;//파일명(javascript)
    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
	//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
    console.log($(this).val());
    $(this).next('.custom-file-label').html(fileName);
})



});

$(function(){
	var result = new Array();
	var result2 = new Array();
	var json = new Object();
	var json2 = new Object();
	var c1 = 0; var c2 = 0; var c3 = 0; var c4 = 0; 
	var c5 = 0; var c6 = 0; var c7 = 0; var c8 = 0;
	var seoul = 0; var busan = 0; var gyeonggi = 0;
	
	$.ajax({
		url : 'graph.do',
		success:function(data){
			for(var i in data){
				json = data[i].cateId;
				json2 = data[i].gplace.substr(0,2);
				result.push(json);
				result2.push(json2);
			
			if(result[i]=='C01'){
				c1++;
			} else if(result[i]=='C02'){
				c2++;
			}else if(result[i]=='C03'){
				c3++;
			}else if(result[i]=='C04'){
				c4++;
			}else if(result[i]=='C05'){
				c5++;
			}else if(result[i]=='C06'){
				c6++;
			}else if(result[i]=='C07'){
				c7++;
			}else if(result[i]=='C08'){
				c8++;
			}
			
			if(result2[i]=='서울'){
				seoul++;
			} else if(result2[i]=='부산'){
				busan++;
			} else if(reuslt2[i]=='경기'){
				gyeonggi++;
			}
		}
			console.log("seoul :" +seoul);

	
	  google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      // 원형 차트
      function drawChart() {

        var data1 = google.visualization.arrayToDataTable([
          ['카테고리', '비율'],
          ['운동',     c1],
          ['친목',      c2],
          ['공부',  c3],
          ['취미생활', c4],
          ['문화생활',  c5],
          ['여행',    c6],
          ['봉사',    c7],
          ['기타',    c8]
        ]);

         var options1 = {
          //title: '7월 첫째주 모임이 제일 많이 생성된 지역',
          slices: {
            0: { color: '#ffb5b6' },
            1: { color: '#132742' },
            2: { color: 'beige' },
            3: { color: '#132742' },
            4: { color: '#ffb5b6' },
            5: { color: '#132742' },
            6: { color: 'beige' },
            7: { color: '#132742' }
          },
          legend : {position: 'none'}
        };
        

        var chart1 = new google.visualization.PieChart(document.getElementById('piechart'));


        chart1.draw(data1, options1);

        
        // 라인차트
        var data2 = google.visualization.arrayToDataTable([
          ['지역', '지역'],
          ['서울',  seoul],
          ['부산',  busan],
          ['경기',  gyeonggi]
        ]);

        var options2 = {
          //title: 'Company Performance',
          curveType: 'function'
          //legend: { position: 'bottom' }
        };

        var chart2 = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart2.draw(data2, options2);
      }
      
			
			
		},error : function(){
			alert("에러 발생!!!");
		}
		
});
});     
</script>
 <c:import url="/WEB-INF/views/common/footer.jsp" />


