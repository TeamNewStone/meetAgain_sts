<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp" />
<div class="rows">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10 content">
			<br>
			<button type="button" class="btn btn-outline-secondary btn-pill"
			onclick="location.href='${pageContext.request.contextPath}/admin/adGroupManage1.do'">진행 중인 모임</button>
			<button type="button" class="btn btn-secondary btn-pill"
			onclick="location.href='${pageContext.request.contextPath}/admin/adGroupManage2.do'">종료된 모임</button>
			<div class="rows">
				<div class="row">
					<c:if test="${!empty list }">
					<c:forEach items="${list }" var="sg">
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<c:if test="${sg.GImg eq null}">
										<c:if test="${sg.GType eq 'S'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav02.png"
												style="height: 200px;">
										</c:if>
										<c:if test="${sg.GType eq 'L'}">
											<img class="card-img"
												src="${ pageContext.request.contextPath }/resources/img/fav01.png"
												style="height: 200px;">
										</c:if>
									</c:if>
									<c:if test="${sg.GImg ne null}">
										<img class="card-img"
											src="${ pageContext.request.contextPath }/resources/upload/groupImg/${sg.GImg}"
											style="height: 200px;">
									</c:if>
								</div>
								<div class="card-body" style="height: 100%;">
									<c:if test="${sg.GType eq 'S' }">
										<span class="badge badge-primary mb-2">단기</span>
									</c:if>
									<c:if test="${sg.GType eq 'L' }">
										<span class="badge badge-primary mb-2">장기</span>
									</c:if>


									<c:if test="${sg.cateId eq 'C01' }">
										<span class="badge badge-secondary mb-2">운동</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C02' }">
										<span class="badge badge-secondary mb-2">친목</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C03' }">
										<span class="badge badge-secondary mb-2">공부</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C04' }">
										<span class="badge badge-secondary mb-2">취미생활</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C05' }">
										<span class="badge badge-secondary mb-2">문화생활</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C06' }">
										<span class="badge badge-secondary mb-2">여행</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C07' }">
										<span class="badge badge-secondary mb-2">봉사</span>
									</c:if>
									<c:if test="${sg.cateId eq 'C08' }">
										<span class="badge badge-secondary mb-2">기타</span>
									</c:if>

									<c:if test="${sg.getLimitGroup()[0] eq 'M'}">
										<span class="badge badge-danger">남자만</span>
									</c:if>
									<c:if test="${sg.getLimitGroup()[0] eq 'F'}">
										<span class="badge badge-danger">여자만</span>
									</c:if>
									<c:if test="${sg.getLimitGroup()[0] eq 'A'}">
										<span class="badge badge-success">성별무관</span>
									</c:if>

									<c:if
										test="${fn:length(sg.getLimitGroup()) eq 6 or fn:length(sg.getLimitGroup()) eq 1 }">
										<span class="badge badge-success">나이 무관</span>

									</c:if>

									<c:if test="${fn:length(sg.getLimitGroup()) lt 6}">
										<c:if test="${ fn:length(sg.getLimitGroup()) ne 1}">
											<span class="badge badge-danger">나이 제한</span>
										</c:if>
									</c:if>

									<c:if test="${!empty sg.getGPwd() }">
										<span class="badge badge-danger">비공개</span>
									</c:if>
									<h5 class="card-title">${sg.GTitle }</h5>
									<p class="card-text">
								 	   <c:choose>
							           <c:when test="${fn:length(sg.getGIntro()) gt 11}">
							           <c:out value="${fn:substring(sg.getGIntro(),0,15)}..."></c:out>
							           </c:when>
							           <c:otherwise>
							           ${sg.getGIntro()}
							           </c:otherwise>
							           </c:choose>
									</p>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<div class="col-sm-3">
						<div class="component">
							<p>아직 종료된 소모임이 없습니다.</p>
						</div>
						</div>
					</c:if>
				
				</div>
				<c:if test="${!empty list }">
				<c:out value="${pageBar }" escapeXml="false"></c:out>
				</c:if>
			</div>
			<div class="row"></div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>