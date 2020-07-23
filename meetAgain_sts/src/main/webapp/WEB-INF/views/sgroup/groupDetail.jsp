<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />
<div class="container">
<c:import url="/views/common/groupHeader.jsp" />
	<!--===================== 소모임 페이지의 바디 부분 =====================-->
	<div name="groupBody">
		<div class="row">
			<div class="col-md-4 col-lg-4">
				<div class="component">
					<div class="card">
						<div class="card-header">
							<img class="card-img" src="/meetAgain/resources/img/dog-3.jpg"
								alt="dog">
						</div>
						<div class="card-body">
							<p class="card-text">이 부분에 모임 설명을 씁니다</p>
						</div>
						<div class="card-footer" style="text-align: right;">
							<!-- 이거 수정버튼임 -->
							<svg width="1.5em" height="1.5em" viewBox="0 0 16 16"
								class="bi bi-pencil-square" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
 		 <path
									d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
 		 <path fill-rule="evenodd"
									d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
		</svg>
						</div>
					</div>
				</div>
			</div>

			<!-- ---------이부분까지 사진과 설명---------- -->
			<div class="col-md-8 col-lg-8">
				<table  cellpadding="5px" style="width: 100%;">
					<colgroup>
						<col width="17%" />
						<col width="30%" />
						<col width="53%" />
					</colgroup>
					<tr>
						<td><h5>설립일 </h5></td>
						<td><h5>yyyy.mm.dd</h5></td>
						<td style="text-align: right;"><span> <span
								class="badge badge-pill badge-primary">정기</span> <span
								class="badge badge-pill badge-info">6개월</span> <span
								class="badge badge-pill badge-dark">승인제</span>
						</span></td>
					</tr>
					<tr>
						<td colspan="3"><hr /></td>
					</tr>
					<tr>
						<td colspan="2"><h5>카테고리</h5></td>
						<td><h5>가입제한</h5></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn btn-info btn-pill">운동</button>
						</td>
						<td><span class="badge badge-pill badge-success">20대</span> <span
							class="badge badge-pill badge-success">30대</span> <span
							class="badge badge-pill badge-success">40대</span> <span
							class="badge badge-pill badge-warning">성별무관</span></td>
					</tr>
					<tr>
						<td><h5>회비여부</h5></td>
						<td><label>10만원</label></td>
						<td>매달 10일 수금 <svg width="1.5em" height="1.5em"
								viewBox="0 0 16 16" class="bi bi-pencil-square"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 <path
									d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
 		 <path fill-rule="evenodd"
									d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
		</svg>
						</td>
					</tr>
					<tr>
						<td><h5>모임인원</h5></td>
						<td colspan="2" style="display: flex; align-items: center;">
							<div class="progress progress-lg" style="width:50%; float:left;" >
								<div class="progress-bar bg-info" role="progressbar"
									style="width: 25%;" aria-valuenow="50" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<div style="float:left;"><h5> &nbsp;5/10 </h5></div> 
						</td>

					</tr>
					<tr>
						<td><h5>평균나이</h5></td>
						<td colspan="2"><label>21.4</label>세</td>
					</tr>
					<tr>
						<td><h5>성비</h5></td>
						<td>
							<div id="piechart" style="width: 300px; "></div>
						</td>
						<td style="text-align: right;"><button type="button"
								class="btn btn-danger" onclick="clickMemList();">멤버 리스트</button></td>
					</tr>
				</table>


			</div>
			<div align="right"></div>
		</div>


	</div>
	<br /> <br /> <br /> <br />
</div>


<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Male',     5],
    ['Female',      5],
   
  ]);

   var options = {
    //title: '7월 첫째주 모임이 제일 많이 생성된 지역',
    slices: {
      0: { color: '#ffb5b6' },
      1: { color: '#132742' },
    
    },
    legend : {position: 'none'}
  };
  

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));


  chart.draw(data, options);

}

function clickMemList(){
	location.href='/meetAgain/views/sgroup/memberList.jsp';
}
</script>
<c:import url="/views/common/footer.jsp" />