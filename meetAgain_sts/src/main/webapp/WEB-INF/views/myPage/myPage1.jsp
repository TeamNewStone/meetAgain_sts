<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.kh.meetAgain.member.model.vo.Member"%>

<%
	Member m = (Member)session.getAttribute("member");
%>

<style>
#_fwfw {
	font-size: 20px;
}
</style>

<c:import url="/WEB-INF/views/common/header.jsp" />

<!-- 비어있는 소모임 -->
<!-- <p class="lead"><span class="text-danger"><i class="far fa-frown-open"></i></span>비어있음.</p> -->

<!-- 마이페이지 메인 시작 -->
<div class="col-12">
	<br>
</div>

<div class="container">

	<div class="info">

		<div class="row">
			<div class="col-12 col-md-4 text-center">
			
						<c:if test="${owner.userImg eq null }">
							<img
								src="${ pageContext.request.contextPath }/resources/img/usericon.png"
								alt="usericon"
								class="test img-fluid rounded-circle" style="width: 180px; height:180px;">
						</c:if>
						<c:if test="${owner.userImg ne null }">
							<img
								src="${ pageContext.request.contextPath }/resources/upload/userImg/${owner.userImg}"
								alt="Raised circle image"
								class="test img-fluid rounded-circle"style="width: 180px; height:180px;">
						</c:if>
			
				
				<div>
					<hr>
				</div>
				<c:if test="${owner.userId eq member.userId}">
					<div>
						<button type="button" class="lead btn btn-sm btn-light"
							onclick="accountEdit();">회원정보수정</button>
						<button type="button" class="lead btn btn-sm btn-light"
							onclick="rateEdit();">등급관리</button>
						<!-- <button type="button" class="lead btn btn-sm btn-light">프로필편집</button> -->
					</div>
				</c:if>
				<c:if test="${member.userId ne owner.userId}">
					<!-- <form action="">
						<a href="#a" class="btn btn-primary btn-pill btn-sm ml-3 mt-1">팔로우하기</a>
					</form> -->
					<c:if test="${followYN eq 1}">
						<button class="btn btn-outline-primary btn-pill btn-sm"
							onclick="unFollow();">언팔로우</button>
					</c:if>
					<c:if test="${followYN eq 0}">
						<button class="btn btn-primary btn-pill btn-sm"
							onclick="follow();">팔로우하기</button>
					</c:if>
				</c:if>
			</div>
			<div
				class="col-12 col-md-8 d-flex flex-column align-items-center align-items-lg-start">
				<div class="d-flex flex-row align-items-start mt-3 mt-lg-0">
				<c:if test="${owner.getMLevel() eq 1 }">
				<div>
				<img src="${ pageContext.request.contextPath }/resources/img/premium.jpg" style="width : 50px;"  /> &nbsp;
				</div>
				</c:if>
					<div class="name">
						<h2 class="mb-0">${owner.nickName}</h2>

					</div>

				</div>
				<br>
				<div
					class="stats d-flex flex-row align-items-center align-items-lg-start text-center text-lg-left"
					id="_follow">
					<div class="posts ml-2 ml-lg-0">
						<p class="lead" id="_fwfw">
							소모임 <b>${groupSum}</b>
						</p>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="posts" id="followerDiv">
						<p class="lead" id="_fwfw">
							<input type="hidden" id="follower" value="${follower}" /> 팔로워 <b>${follower}</b>
						</p>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="posts" id="followingDiv">
						<p class="lead" id="_fwfw">
							<input type="hidden" id="following" value="${following}" /> 팔로잉
							<b>${following}</b>
						</p>
					</div>
					&nbsp;

				</div>
				<p class="lead mb-0 mt-2" style="color: green;">
					<b>키워드</b>
				</p>
				<%-- 		        <i class="fa fa-plus-circle" id="addKeyword" onclick="location.href='${ pageContext.request.contextPath }/#'"></i> --%>

				<p class="lead text-center text-lg-left">${tmi.getKeyword()}</p>
			</div>
		</div>

	</div>

	<div class="navigation d-flex justify-content-center">
		<ul
			class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#myGroupList"> <i class="fa fa-heart"></i>
					가입한 소모임
			</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#myCreatedGroupList"> <i class="fa fas fa-seedling"></i>
					생성한 소모임
			</a></li>
			<c:if test="${member.userId eq owner.userId}">
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#myPost"> <i class="fa fa-list-alt"></i> 작성한 게시글
				</a></li>
			</c:if>
		</ul>
	</div>

	<!--============================================== 나의 소모임 시작 ======================================================-->
	<!-- 카드 고정폭 500px 더보기 아래로-->
	<div class="profile profile-tabs tab-content">

		<div class="tab-pane fade show active" id="myGroupList">

			<div class="row">

				<c:forEach items="${mygroup}" var="mg">
					<div class="col-md-4" style="max-width: 500px;">
						<div class="component">
						
						<c:if test="${mg.ISFIN eq 'Y'}">
							<script>
				    		$(function(){				    			
				    			$('<h4 style="position: absolute;top: 30%; left: 25%;">종료된 모임입니다.</h4>').appendTo('#m-${ mg.GID}');	
				    			$('#m-${ mg.GID} .card-header').css('opacity', '0.2');	
				    		});
				    	</script>		
							<div class="card-fin" id = "m-${mg.GID}">
							</c:if>
							<c:if test="${mg.ISFIN ne 'Y'}">
							<div class="card" id = "${mg.GID}">
							<c:if test="${mg.ISREADY eq 2 }">
							<h4 style="position: absolute;top: 30%; left: 25%;">승인 대기중입니다.</h4>
							</c:if>
							</c:if>
						
							
							
								<div class="card-header"
								<c:if test="${mg.ISREADY eq 2 }">
								style = "opacity : 0.2";
								</c:if>
								>
									<c:if test="${mg.GIMG eq 'NULL'}">
										<c:if test="${mg.GTYPE eq 'S'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav02.png" style="height: 200px;">
										</c:if>
										<c:if test="${mg.GTYPE eq 'L'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav01.png" style="height: 200px;">
										</c:if>
									</c:if>
									<c:if test="${mg.GIMG ne 'NULL'}">
										<img class="card-img"
											src="${ pageContext.request.contextPath }/resources/upload/groupImg/${mg.GIMG}"
											style="height: 200px;">
									</c:if>
								</div>
								<div class="card-body">

									<input type="hidden" id="gPlace" value="${mg.GPLACE }" />
									<c:if test="${mg.GTYPE eq 'S' }">
										<span class="badge badge-primary mb-2">단기</span>
									</c:if>
									<c:if test="${mg.GTYPE eq 'L' }">
										<span class="badge badge-primary mb-2">장기</span>
									</c:if>

									<c:if test="${mg.CATE_ID eq 'C01'}">
										<span class="badge badge-secondary mb-2">운동</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C02' }">
										<span class="badge badge-secondary mb-2">친목</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C03' }">
										<span class="badge badge-secondary mb-2">공부</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C04' }">
										<span class="badge badge-secondary mb-2">취미생활</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C05' }">
										<span class="badge badge-secondary mb-2">문화생활</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C06' }">
										<span class="badge badge-secondary mb-2">여행</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C07' }">
										<span class="badge badge-secondary mb-2">봉사</span>
									</c:if>
									<c:if test="${mg.CATE_ID eq 'C08' }">
										<span class="badge badge-secondary mb-2">기타</span>
									</c:if>

									<c:if test="${fn:substring(mg.LIMITGROUP,0,1) eq 'M'}">
										<span class="badge badge-danger">남자만</span>
									</c:if>
									<c:if test="${fn:substring(mg.LIMITGROUP,0,1) eq 'F'}">
										<span class="badge badge-danger">여자만</span>
									</c:if>
									<c:if test="${fn:substring(mg.LIMITGROUP,0,1) eq 'A'}">
										<span class="badge badge-success">성별무관</span>
									</c:if>

									  <c:if test="${fn:length(mg.LIMITGROUP) eq 6 or fn:length(mg.LIMITGROUP) eq 1 }">
                       <span class="badge badge-success">나이 무관</span>
                       
                    </c:if>
                    
                    <c:if test="${fn:length(mg.LIMITGROUP) lt 6}">
                       <c:if test="${ fn:length(mg.LIMITGROUP) ne 1}">
                          <span class="badge badge-danger">나이 제한</span>
                       </c:if>
                    </c:if>
					
					<c:if test="${!empty mg.GPWD }">
					<span class="badge badge-danger">비공개</span>
					</c:if>
					
									<h4 class="card-title mt-2">${mg.GTITLE}</h4>
									<p class="card-text">
										<c:choose>
											<c:when test="${fn:length(mg.GINTRO) gt 11}">
												<c:out value="${fn:substring(mg.GINTRO,0,10)}..."></c:out>
											</c:when>
											<c:otherwise>
				          ${mg.GINTRO}
				          </c:otherwise>
										</c:choose>
									</p>
								</div>
								<c:if test="${mg.ISFIN eq 'Y'}">
								<c:if test="${owner.userId eq member.userId}">
									<div class="card-footer">
										<button class="btn btn-outline-dark" id="rvBtn"
										data-title="${mg.GTITLE}" data-cate="${mg.CATE_ID}" data-id="${mg.GID }"
										data-sdate="${mg.CREATEDATE}" data-edate="${mg.DURATE}">리뷰 작성</button>
										
									</div>
									</c:if>
								</c:if>
							</div>
						</div>
						<br /><br />
					</div>
				</c:forEach>
				<%-- </c:forEach> --%>

			</div>

			<div class="d-flex justify-content-center my-5">
				<a href="#a" class="btn btn-outline-primary btn-pill">더 보기</a>
			</div>

		</div>
		<!--=================== 생성한 소모임 리스트================== -->
		<div class="tab-pane fade" id="myCreatedGroupList">

			<div class="row">

				<c:forEach var="cg" items="${cgroup}">

					<div class="col-md-4" style="max-width: 500px;">
						<div class="component">
							<c:if test="${cg.getIsFin() eq 'Y'}">
							<script>
				    		$(function(){				
				    			$('<h4 style="position: absolute;top: 30%; left: 25%;">종료된 모임입니다.</h4>').appendTo('#c-${cg.getGId()}');
				    			$('#c-${cg.getGId()} .card-header').css('opacity', '0.2');
				    		});
				    	</script>		
							<div class="card-fin" id = "c-${cg.getGId()}">
							</c:if>
							<c:if test="${cg.getIsFin() ne 'Y'}">
							<div class="card" id = "${cg.getGId()}">
							</c:if>
								<div class="card-header" id="mycardImg">
									<c:if test="${cg.getGImg() eq null}">
										<c:if test="${cg.getGType() eq 'S'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav02.png" style="height: 200px;">
										</c:if>
										<c:if test="${cg.getGType() eq 'L'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav01.png" style="height: 200px;">
										</c:if>
									</c:if>
									<c:if test="${cg.getGImg() ne null}">
										<img class="card-img"
											src="${ pageContext.request.contextPath }/resources/upload/groupImg/${cg.getGImg()}"
											style="height: 200px;">
									</c:if>
								</div>
								<div class="card-body">
								
								<input type="hidden" id="gPlace" value="${cg.getGPlace() }" />
									<c:if test="${cg.getGType() eq 'S' }">
										<span class="badge badge-primary mb-2">단기</span>
									</c:if>
									<c:if test="${cg.getGType() eq 'L' }">
										<span class="badge badge-primary mb-2">장기</span>
									</c:if>

									<c:if test="${cg.getCateId() eq 'C01' }">
										<span class="badge badge-secondary mb-2">운동</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C02' }">
										<span class="badge badge-secondary mb-2">친목</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C03' }">
										<span class="badge badge-secondary mb-2">공부</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C04' }">
										<span class="badge badge-secondary mb-2">취미생활</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C05' }">
										<span class="badge badge-secondary mb-2">문화생활</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C06' }">
										<span class="badge badge-secondary mb-2">여행</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C07' }">
										<span class="badge badge-secondary mb-2">봉사</span>
									</c:if>
									<c:if test="${cg.getCateId() eq 'C08' }">
										<span class="badge badge-secondary mb-2">기타</span>
									</c:if>

									<c:if test="${cg.getLimitGroup()[0] eq 'M'}">
										<span class="badge badge-danger">남자만</span>
									</c:if>
									<c:if test="${cg.getLimitGroup()[0] eq 'F'}">
										<span class="badge badge-danger">여자만</span>
									</c:if>
									<c:if test="${cg.getLimitGroup()[0] eq 'A'}">
										<span class="badge badge-success">성별무관</span>
									</c:if>

									  <c:if test="${fn:length(cg.getLimitGroup()) eq 6 or fn:length(cg.getLimitGroup()) eq 1 }">
                       <span class="badge badge-success">나이 무관</span>
                       
                    </c:if>
                    
                    <c:if test="${fn:length(cg.getLimitGroup()) lt 6}">
                       <c:if test="${ fn:length(cg.getLimitGroup()) ne 1}">
                          <span class="badge badge-danger">나이 제한</span>
                       </c:if>
                    </c:if>
					
					<c:if test="${!empty cg.getGPwd() }">
					<span class="badge badge-danger">비공개</span>
					</c:if>
					
								
									<h4 class="card-title mt-2">${cg.getGTitle()}</h4>
									<p class="card-text">
										<c:choose>
											<c:when test="${fn:length(cg.getGIntro()) gt 11}">
												<c:out value="${fn:substring(cg.getGIntro(),0,10)}..."></c:out>
											</c:when>
											<c:otherwise>
				          ${cg.getGIntro()}
				          </c:otherwise>
										</c:choose>
									</p>
								</div>
								<c:if test="${cg.getIsFin() eq 'Y'}">
								<c:if test="${owner.userId eq member.userId}">
									<div class="card-footer">
										<button class="btn btn-outline-dark" id="rvBtn2"
										data-title="${cg.getGTitle()}" data-cate="${cg.getCateId()}" data-id="${cg.getGId() }"
										data-sdate="${cg.getCreateDate()}" data-edate="${cg.getDurate()}">리뷰 작성</button>
										
									</div>
									</c:if>
								</c:if>
							</div>
						</div>
						<br /><br />
					</div>
				</c:forEach>

			</div>

			<div class="d-flex justify-content-center my-5">
				<a href="#a" class="btn btn-outline-primary btn-pill">더 보기</a>
			</div>

		</div>

		<div class="tab-pane fade text-center" id="myPost">

			<!-- <table class="table">

				<thead>
					<tr>
						<th>-</th>
						<th>모임명</th>
						<th>모임제목</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>굽남모임</td>
						<td>제목1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>굽남모임</td>
						<td>제목1</td>
					</tr>
				</tbody>
			</table>  -->

			<section id="gBoardList" class="container">

				<table id="tbl-board" class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th>소모임명</th>

							<th>게시글 제목</th>

							<th>작성일</th>

							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list}">
							<c:forEach items="${list}" var="gb">
								<tr id="${gb.gbId}">
									<td>${gb.GTitle}</td>
									<td>${gb.gbTitle}</td>
									<td>${gb.gbDate}</td>
									<td>${gb.gbRate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list}">
							<tr>
								<td colspan="4"><p>아직 작성한 게시글이 없습니다.</p></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<c:if test="${list eq null }">
					<c:out value="${pageBar}" escapeXml="false" />
				</c:if>
			</section>
			<input type="button" value="새로고침" class="btn btn-outline-success"
				onclick="fn_refresh();" />

		</div>

	</div>
<!-- 리뷰 작성 the modal // 마이페이지 화면구현 다 되면 마이페이지로 옮길 코드입니다 -->
<div class="modal fade" id="reviewInsert" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <div style="float:left;">
        <h4 class="modal-title" id="exampleModalLabel">
        <span class = "titleSpace"></span>
        <span class="badge badge-success mb-2" id = "modal-cate">Study</span><br />
        </h4>
        <h6 class = "modal-date" style="font-weight:normal;color:#9c9c9c;"></h6>
        </div>
        <div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></div>
      </div>
      <form action="reviewInsert.do" method="post" enctype="multipart/form-data" onsubmit="return validate(this);" >
      <div class="modal-body">
    
      <p id="star_grade">
      별점 :  
      <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점" >
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div> 

	   </p>
        
        <div class="card-header">
        <div class="input-group">
        <input type="hidden" name="userId" value="${member.userId }" />
        <input type="hidden" name="gId" id="modal-gid" />
        <input type="hidden" name="rvStar" id="modal-star" />
  <div class="custom-file">
    <input type="file" class="custom-file-input" id="inputGroupFile02" name="reviewImage">
    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
  </div>
</div>
        </div>
        <div class="card-body custom-control custom-checkbox my-2">
		<textarea class="form-control" name = "rvContent" rows="5" style="resize:none;" ></textarea>
        </div>

        <br />

        </div>
        <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
      </form>  

</div>
</div>
</div>
</div>

<!-- 마이페이지 메인 끝 -->

<script>

	$(".card").on("click",function(){
		
		var gId = $(this).attr("id");
		$.ajax({
			url : 'checkIn.do',
			data : {
				userId : ${member.getUserId()},
				gId : gId
			},
			success : function(data){
				if(data.isIn){
					location.href = "${pageContext.request.contextPath}/sgroup/gotoGroup.do?gid="+gId;
				}else{
					location.href = "${pageContext.request.contextPath}/sgroup/groupInfo.do?gid="+gId;
				}
			},
			error : function(){
				alert("에러 발생!");
			}			
		
		});
		
		/* var gId = $(this).attr("id");
		console.log("gId="+gId);
		location.href = "${pageContext.request.contextPath}/sgroup/gotoGroup.do?gid="+gId; */
	}).mouseenter(function(){
		$(this).css({
			"cursor" : "pointer"
		});
	});
	

	
	$("#rvBtn, #rvBtn2").click(function(){
		console.log("클릭함!");
		var gid = $(this).data('id');
		var userid = ${member.userId};
		var gtitle = $(this).data('title');
		var sdate = $(this).data('sdate');
		var edate = $(this).data('edate');
		var cate = $(this).data('cate');
		var category ;
		
		if(cate=="C01") category="운동";
		else if(cate=="C02") category="친목";
		else if(cate=="C03") category="공부";
		else if(cate=="C04") category="취미생활";
		else if(cate=="C05") category="문화생활";
		else if(cate=="C06") category="여행";
		else if(cate=="C07") category="봉사";
		else if(cate=="C08") category="기타";
		
		$.ajax({
			url : 'checkReview.do',
			data : {
				userid : userid,
				gid : gid
			},
			success : function(data){
				if(data.result==true){
					alert("이미 리뷰를 작성하셨습니다.");
				}
				else {
					console.log("else문으로 들어옴");
					$(".modal-date").html(sdate+" ~ "+edate);
					$(".titleSpace").html(gtitle);
					$("#modal-cate").html(category);
					$("#modal-gid").val(gid);
					
					$("#reviewInsert").modal();
				}
			},
			error : function(){
				alert("에러발생");
			}
		});
		
	
	}); 
	
/* 	$(".btn-outline-dark").click(function(){
		var gtitle = $(this).data('title');
		var sdate = $(this).data('sdate');
		var edate = $(this).data('edate');
		var cate = $(this).data('cate');
		var gid = $(this).data('id');
		var category ;
		
		if(cate=="C01") category="운동";
		else if(cate=="C02") category="친목";
		else if(cate=="C03") category="공부";
		else if(cate=="C04") category="취미생활";
		else if(cate=="C05") category="문화생활";
		else if(cate=="C06") category="여행";
		else if(cate=="C07") category="봉사";
		else if(cate=="C08") category="기타";
	

		$(".modal-date").html(sdate+" ~ "+edate);
		$(".titleSpace").html(gtitle);
		$("#modal-cate").html(category);
		$("#modal-gid").val(gid);
	}); */
	function fn_refresh(){
		location.reload();
	}
	
	$(function() {
		if($('#follower').val() > 0){
		$("#followerDiv").click(function() {
			var userId = '${owner.userId}';
			window.open('${pageContext.request.contextPath}/myPage/followerList.do?uid='+userId,'팔로워','width=300, height=500');
		}).mouseenter(function() {
			$(this).css({
				"cursor" : "pointer"
			});

		})
		}
		
		if($('#following').val() > 0){
			$("#followingDiv").click(function() {
				var userId = '${owner.userId}';
				window.open('${pageContext.request.contextPath}/myPage/followingList.do?uid='+userId,'팔로잉','width=300, height=500');
			}).mouseenter(function() {
				$(this).css({
					"cursor" : "pointer"
				});

			})
			}
	});
	
	function unFollow(){
		var confirm = window.confirm('정말 팔로우를 끊으시겠습니까?');
		if(confirm){
			var userId = '${owner.userId}';
			var muserId = '${member.userId}';
			location.href="${pageContext.request.contextPath}/myPage/unFollow.do?uid="+userId+"&muserId="+muserId;
		}
	}
	
	function follow(){
		var userId = '${owner.userId}';
		var muserId = '${member.userId}';
		location.href="${pageContext.request.contextPath}/myPage/follow.do?uid="+userId+"&muserId="+muserId;
	}

	function accountEdit() {
		var userId = '${member.userId}';
		location.href = "${ pageContext.request.contextPath }/myPage/myPage2.do?uid="+userId;
	}
	function rateEdit() {
		location.href = "${ pageContext.request.contextPath }/member/membership.do";
	}
	
	// 내가 쓴 게시글 클릭하면 해당 게시글로 이동
	$('tr[id]').mouseenter(function() {
		$(this).css({
			"cursor" : "pointer"
		});
	}).on('click',function(){
		var gbId = $(this).attr("id");
		location.href='${pageContext.request.contextPath}/sgroup/groupBoardDetail.do?gbId='+gbId;
	})
	
	
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
  //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
  this.rate = newrate;
  let items = document.querySelectorAll('.rate_radio');
  items.forEach(function(item, idx){
      if(idx < newrate){
          item.checked = true;
      }else{
          item.checked = false;
      }
      
  });
  $("#modal-star").val(newrate);
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />










