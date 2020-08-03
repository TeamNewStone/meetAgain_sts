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
				<img
					src="${ pageContext.request.contextPath }/resources/img/lorde.png"
					alt="Raised circle image"
					class="img-fluid rounded-circle shadow-lg" style="width: 180px;">
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

	<!-- 나의 소모임 시작 -->
	<!-- 카드 고정폭 500px 더보기 아래로-->
	<div class="profile profile-tabs tab-content">

		<div class="tab-pane fade show active" id="myGroupList">

			<div class="row">

				<c:forEach items="${mygroup}" var="mg">
					<div class="col-md-4" style="max-width: 500px;">
						<div class="component">
							<div class="card" id = "${mg.getGId()}">
								<div class="card-header">
									<c:if test="${mg.getGImg() eq null}">
										<c:if test="${mg.getGType() eq 'S'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav02.png">
										</c:if>
										<c:if test="${mg.getGType() eq 'L'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav01.png">
										</c:if>
									</c:if>
									<c:if test="${mg.getGImg() ne null}">
										<img class="card-img"
											src="${ pageContext.request.contextPath }/resources/upload/groupImg/${mg.getGImg()}"
											style="height: 200px;">
									</c:if>
								</div>
								<div class="card-body">

									<input type="hidden" id="gPlace" value="${mg.getGPlace() }" />
									<c:if test="${mg.getGType() eq 'S' }">
										<span class="badge badge-primary mb-2">단기</span>
									</c:if>
									<c:if test="${mg.getGType() eq 'L' }">
										<span class="badge badge-primary mb-2">장기</span>
									</c:if>

									<c:if test="${mg.getCateId() eq 'C01'}">
										<span class="badge badge-secondary mb-2">운동</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C02' }">
										<span class="badge badge-secondary mb-2">친목</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C03' }">
										<span class="badge badge-secondary mb-2">공부</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C04' }">
										<span class="badge badge-secondary mb-2">취미생활</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C05' }">
										<span class="badge badge-secondary mb-2">문화생활</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C06' }">
										<span class="badge badge-secondary mb-2">여행</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C07' }">
										<span class="badge badge-secondary mb-2">봉사</span>
									</c:if>
									<c:if test="${mg.getCateId() eq 'C08' }">
										<span class="badge badge-secondary mb-2">기타</span>
									</c:if>

									<c:if test="${mg.getLimitGroup()[0] eq 'M'}">
										<span class="badge badge-danger">남자만</span>
									</c:if>
									<c:if test="${mg.getLimitGroup()[0] eq 'F'}">
										<span class="badge badge-danger">여자만</span>
									</c:if>
									<c:if test="${mg.getLimitGroup()[0] eq 'A'}">
										<span class="badge badge-success">성별무관</span>
									</c:if>

									  <c:if test="${fn:length(mg.getLimitGroup()) eq 6 or fn:length(mg.getLimitGroup()) eq 1 }">
                       <span class="badge badge-success">나이 무관</span>
                       
                    </c:if>
                    
                    <c:if test="${fn:length(mg.getLimitGroup()) lt 6}">
                       <c:if test="${ fn:length(mg.getLimitGroup()) ne 1}">
                          <span class="badge badge-danger">나이 제한</span>
                       </c:if>
                    </c:if>
					
					<c:if test="${!empty mg.getGPwd() }">
					<span class="badge badge-danger">비공개</span>
					</c:if>
					
									<h4 class="card-title mt-2">${mg.getGTitle()}</h4>
									<p class="card-text">
										<c:choose>
											<c:when test="${fn:length(mg.getGIntro()) gt 11}">
												<c:out value="${fn:substring(mg.getGIntro(),0,10)}..."></c:out>
											</c:when>
											<c:otherwise>
				          ${mg.getGIntro()}
				          </c:otherwise>
										</c:choose>
									</p>
								</div>
								<c:if test="${mg.getIsFin() eq 'Y'}">
									<div class="card-footer">
										<a href="#a" class="btn btn-outline-dark">리뷰 작성</a>
									</div>
								</c:if>
							</div>
						</div>
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
							<div class="card" id = "${cg.getGId()}">
								<div class="card-header">
									<c:if test="${cg.getGImg() eq null}">
										<c:if test="${cg.getGType() eq 'S'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav02.png">
										</c:if>
										<c:if test="${cg.getGType() eq 'L'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav01.png">
										</c:if>
									</c:if>
									<c:if test="${cg.getGImg() ne null}">
										<img class="card-img"
											src="${ pageContext.request.contextPath }/resources/upload/groupImg/${mg.getGImg()}"
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
									<div class="card-footer">
										<a href="#a" class="btn btn-outline-dark">리뷰 작성</a>
									</div>
								</c:if>
							</div>
						</div>
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

				<table id="tbl-board" class="table" style="text-align: center;">
					<thead>
						<tr>
							<th>소모임명</th>

							<th>게시글 제목</th>

							<th>작성일</th>

							<th>조회수</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:if test="${list ne null }">
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

</div>

<!-- 마이페이지 메인 끝 -->

<!-- 마인펭이지 메인 스크립트작성 -->
<!--   jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js"></script>
<!-- lazy javascript -->
<script src="${ pageContext.request.contextPath }/resources/js/lazy.js"></script>

<script>
$(function(){
	$(".card").on("click",function(){
		var gId = $(this).attr("id");
		console.log("gId="+gId);
		location.href = "${pageContext.request.contextPath}/sgroup/gotoGroup.do?gid="+gId;
	});
	
	function accountEdit() {
		location.href = "myPage2.do";
	}
	function rateEdit() {
		location.href = "${ pageContext.request.contextPath }/member/membership.do";
	}
	function fn_refresh(){
		location.reload();
	}
	
	$(function() {
		if($('#follower').val() > 0){
		$("#followerDiv").click(function() {
			var userId = ${owner.userId};
			window.open('${pageContext.request.contextPath}/myPage/followerList.do?uid='+userId,'팔로워','width=300, height=500');
		}).mouseenter(function() {
			$(this).css({
				"cursor" : "pointer"
			});

		})
		}
		
		if($('#following').val() > 0){
			$("#followingDiv").click(function() {
				var userId = ${owner.userId};
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
			var userId = ${owner.userId};
			var muserId = ${member.userId};
			location.href="${pageContext.request.contextPath}/myPage/unFollow.do?uid="+userId+"&muserId="+muserId;
		}
	}
	
	function follow(){
		var userId = ${owner.userId};
		var muserId = ${member.userId};
		location.href="${pageContext.request.contextPath}/myPage/follow.do?uid="+userId+"&muserId="+muserId;
	}
});
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />










