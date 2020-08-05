<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />
	<!--===================== 소모임 페이지의 바디 부분 =====================-->
	<div name="groupBody">
		<div class="row">
			<div class="col-md-4 col-lg-4">
				<div class="component">
					<div class="card">
						<div class="card-header">

						<c:if test="${sgroup.getGImg() eq null}">
				        <c:if test="${sgroup.getGType() eq 'S'}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/fav02.png" style="height:200px;">
				          </c:if>
				          <c:if test="${sgroup.getGType() eq 'L'}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/fav01.png" style="height:200px;">
				          </c:if>
				          </c:if>
				          <c:if test="${sgroup.getGImg() ne null}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/groupImg/${sgroup.getGImg()}" style="height:200px;">
				          </c:if>
						</div>
						<div class="card-body">
							<p class="card-text">${sgroup.getGIntro() }</p>
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
					<br />
					<br />
				</div>
				<button class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/sgroup/groupLeave.do?gid='+${gid}">소모임 탈퇴</button>
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
						<td><h5>설립일</h5></td>
						<td><h5>${sgroup.getCreateDate() }</h5></td>
						<td style="text-align: right;">
						<span>
							<c:if test="${sgroup.getGType() eq 'S' }">
					       		<span class="badge badge-pill badge-primary">단기</span> 		        
				        	</c:if>
				        	<c:if test="${sgroup.getGType() eq 'L' }">
					       		<span class="badge badge-pill badge-primary">정기</span> 			        
				        	</c:if> 
							<c:if test="${sgroup.getJoinType() eq 'C' }">
					       		<span class="badge badge-pill badge-dark">승인제</span>		        
				        	</c:if>
						</span>
						</td>
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
						<c:if test="${sgroup.getCateId() eq 'C01' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">운동</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C02' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">친목</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C03' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">공부</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C04' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">취미생활</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C05' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">문화생활</button>			        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C06' }">
					       <button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">여행</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C07' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">봉사</button>		        
				        </c:if>
				        <c:if test="${sgroup.getCateId() eq 'C08' }">
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">기타</button>			        
				        </c:if>
						</td>
						<td>
							<c:if test="${fn:length(sgroup.getLimitGroup()) eq 6 or fn:length(sgroup.getLimitGroup()) eq 1 }">
	     						<span class="badge badge-pill badge-success">나이무관</span> 
	     						
	     					</c:if>
	     					
	     					<c:if test="${fn:length(sgroup.getLimitGroup()) lt 6}">
	     						<c:if test="${ fn:length(sgroup.getLimitGroup()) ne 1}">
		     						<c:forEach var="li" items="${sgroup.getLimitGroup()}" begin="1">
		     							<span class="badge badge-pill badge-success">${li}</span> 
		     						</c:forEach>
	     						</c:if>
	     					</c:if>
							<c:if test="${sgroup.getLimitGroup()[0] eq 'M'}">
     							<span class="badge badge-pill badge-warning">남자만</span>
     						</c:if>
     						<c:if test="${sgroup.getLimitGroup()[0] eq 'F'}">
     							<span class="badge badge-pill badge-warning">여자만</span>
     						</c:if>
     						<c:if test="${sgroup.getLimitGroup()[0] eq 'A'}">
     							<span class="badge badge-pill badge-warning">성별무관</span>	
     						</c:if>
						</td>
					</tr>
					<tr>
						<td><h5>회비여부</h5></td>
						<td>
							<c:if test="${sgroup.getCharge() eq 'Y' }">
								<label>${sgroup.getGFee()}</label>
							</c:if>
							<c:if test="${sgroup.getCharge() eq 'N' }">
								<label>회비 없음</label>
							</c:if>
						</td>
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
						<td colspan="2" >
						<div style="display: flex; align-items: center;">
							<div class="progress progress-lg"
								style="width: 50%; float: left;">
								<div class="progress-bar bg-info" id="joinCount" role="progressbar" aria-valuenow="50" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<div style="float: left;">
								<h5>&nbsp;&nbsp;${fn:length(joing)}/${sgroup.getMaxNum() }</h5>
							</div>
							<div>
							&nbsp;&nbsp;<button type="button" class="btn btn-danger"
								onclick="clickMemList();">멤버 리스트</button>
							</div>
							</div>
						</td>
						<script>
							var joinMemCount = (${fn:length(joing)}/${sgroup.getMaxNum()})*100;
							$(function(){
								$('#joinCount').css('width', joinMemCount+'%');
							});
						</script>


					</tr>
					<tr>
						<td><h5>평균연령</h5></td>
						<td colspan="2"><label>20</label>대(그래프로 대체)</td>
					</tr>
					<tr>
						<td><h5>성비</h5></td>
						<td>
							<div id="piechart" style="width: 300px;"></div>
						</td>
					<td style="text-align: right;">	</td>
					</tr>
				</table>


			</div>
			<div align="right"></div>
		</div>


	</div>
	<br /> <br /> <br /> <br />
</div>


<script type="text/javascript">
$(function(){
	
 	var result = new Array();
	var json = new Object();
	
	<c:forEach var="jo" items="${joing}" varStatus="status">
		json = '${jo.getGender()}';
		result.push(json);
	</c:forEach>
	
	var test = JSON.stringify(result);
	console.log(test); 
	
	var mCnt = 0;
	var fCnt = 0;
	
	for(var i in test){
		if(test[i].trim() == "M") mCnt++;
		else if(test[i].trim() == "F") fCnt++;
			
	}
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Male', mCnt ], [ 'Female', fCnt ],

		]);

		var options = {
			//title: '7월 첫째주 모임이 제일 많이 생성된 지역',
			slices : {
				0 : {
					color : '#ffb5b6'
				},
				1 : {
					color : '#132742'
				},

			},
			legend : {
				position : 'none'
			}
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
	}
});
	function clickMemList() {
		location.href = '${ pageContext.request.contextPath }/sgroup/memberList.do?gid='+${gid};
	}
</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />