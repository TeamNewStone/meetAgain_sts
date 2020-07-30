<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />

<section style="border-bottom: 1px solid #e0e0e0;">
<div class="container">
<input type="hidden" value="${member.userId }" />
<input type="hidden" id="address1" value="${member.address1 }" />
<c:if test="${ !empty member.address2 && member.address3}">
	<input type="hidden" id="address2" value="${member.address2}" />
	<input type="hidden" id="address3" value="${member.address3}" />
</c:if>



	<br>
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<p>
					<a href="">${fn:substring(member.address1,3,7)}</a> 의 소모임 리스트를 보고 계십니다.
				</p>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">지역선택</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

						<a class="dropdown-item" href="#">${fn:substring(member.address1,3,7)}</a>
					<c:if test="${ !empty member.address2 && member.address3}">
						<a class="dropdown-item" href="#">${fn:substring(member.address2,3,7)}</a> 
						<a class="dropdown-item" href="#">${fn:substring(member.address3,3,7)}</a>
					</c:if>
					</div>
				</div>

				  
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="rows">
					<div class="row">
						<div class="col-8">
							<input type="search" class="form-control" id="search"
								placeholder="모임을 검색하세요">
						</div>
						<div class="col-4">
							<button type="button" class="btn btn-info">상세 검색 ▼</button>
						</div>
					</div>
					<div class="rows form-group">
						<div class="row">
							<div class="col-2 custom-control custom-radio my-2">
								<input type="radio" id="short-term" name="term"
									class="custom-control-input" checked> <label
									class="custom-control-label" for="short-term">단기</label>
							</div>
							<div class="col-2 custom-control custom-radio my-2">
								<input type="radio" id="long-term" name="term"
									class="custom-control-input"> <label
									class="custom-control-label" for="long-term">장기</label>
							</div>
							<div class="col-8 custom-control custom-radio my-2"></div>
						</div>
						<div class="row">
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="health"
									name="hobby" checked> <label
									class="custom-control-label" for="health"
									style="font-weight: 400; margin-right: 10px;">운동</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="study"
									name="hobby"> <label class="custom-control-label"
									for="study" style="font-weight: 400; margin-right: 10px;">공부</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="commu"
									name="hobby"> <label class="custom-control-label"
									for="commu" style="font-weight: 400; margin-right: 10px;">소통</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="job"
									name="hobby"> <label class="custom-control-label"
									for="job" style="font-weight: 400; margin-right: 10px;">취업</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="ent"
									name="hobby"> <label class="custom-control-label"
									for="ent" style="font-weight: 400; margin-right: 10px;">음악/댄스</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="gosang"
									name="hobby"> <label class="custom-control-label"
									for="gosang" style="font-weight: 400; margin-right: 10px;">고상한
									취미</label>
							</div>
						</div>
						<div class="row">
							<div class="custom-control custom-checkbox col-1.5 ">
								<input type="checkbox" class="custom-control-input" id="teens"
									name="ages" checked> <label
									class="custom-control-label" for="teens"
									style="font-weight: 400; margin-right: 10px;">10대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="2teens"
									name="ages"> <label class="custom-control-label"
									for="2teens" style="font-weight: 400; margin-right: 10px;">20대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="3teens"
									name="ages"> <label class="custom-control-label"
									for="3teens" style="font-weight: 400; margin-right: 10px;">30대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="4teens"
									name="ages"> <label class="custom-control-label"
									for="4teens" style="font-weight: 400; margin-right: 10px;">40대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="5teens"
									name="ages"> <label class="custom-control-label"
									for="5teens" style="font-weight: 400; margin-right: 10px;">50대</label>
							</div>
						</div>
					</div>

					<div class="row" style="margin-top: 10px;">
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="whatever" name="gender"
								class="custom-control-input"> <label
								class="custom-control-label" for="whatever"
								style="padding-right: 6px;">성별 무관 </label>
						</div>
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="man" name="gender"
								class="custom-control-input"> <label
								class="custom-control-label" for="man"
								style="padding-right: 6px;">남자</label>
						</div>
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="woman" name="gender"
								class="custom-control-input"> <label
								class="custom-control-label" for="woman">여자</label>
						</div>
						<div class="col-6 custom-control custom-radio my-2"></div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="col-lg-3 col-md-3">
			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/sgroup/create.do'">소모임 생성하기!</button>
			</div>
		</div>
		<div class="row">
			<h4 style="margin-left: 20px;">관심 카테고리 추천</h4>
		</div>
		<div class="rows">
		</div>
		</div>
</section>
	<br> <br> <br>
<div class="container">
	<div class="row">
		<c:forEach items="${list}" var="sg"> 		
				  <div class="col-md-4 cardOne" style="max-width: 500px;">
				    <div class="component">
				      <div class="card" id="${ sg.getGId()}" style="cursor:pointer;">
				 <%--        <input type="hidden" value="${ sg.getGId()}" /> --%>
				        <div class="card-header">
				        <c:if test="${sg.getGImg() eq null}">
				        <c:if test="${sg.getGType() eq 'S'}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/fav02.png" style="height:200px;">
				          </c:if>
				          <c:if test="${sg.getGType() eq 'L'}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/fav01.png" style="height:200px;">
				          </c:if>
				          </c:if>
				          <c:if test="${sg.getGImg() ne null}">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/groupImg/${sg.getGImg()}" style="height:200px;">
				          </c:if>
				        </div>
				        <div class="card-body">
				        
				        <input type="hidden" value="${sg.getGPlace() }" />
				        <c:if test="${sg.getGType() eq 'S' }">
					       	<span class="badge badge-primary mb-2">단기</span>			        
				        </c:if>
				        <c:if test="${sg.getGType() eq 'L' }">
					       	<span class="badge badge-primary mb-2">장기</span>			        
				        </c:if>
				        
				        
				        <c:if test="${sg.getCateId() eq 'C01' }">
					       	<span class="badge badge-secondary mb-2">운동</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C02' }">
					       	<span class="badge badge-secondary mb-2">친목</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C03' }">
					       	<span class="badge badge-secondary mb-2">공부</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C04' }">
					       	<span class="badge badge-secondary mb-2">취미생활</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C05' }">
					       	<span class="badge badge-secondary mb-2">문화생활</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C06' }">
					       	<span class="badge badge-secondary mb-2">여행</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C07' }">
					       	<span class="badge badge-secondary mb-2">봉사</span>			        
				        </c:if>
				        <c:if test="${sg.getCateId() eq 'C08' }">
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
     					 
     					<c:if test="${fn:length(sg.getLimitGroup()) eq 6 or fn:length(sg.getLimitGroup()) eq 1 }">
     						<span class="badge badge-success">나이 무관</span>
     						
     					</c:if>
     					
     					<c:if test="${fn:length(sg.getLimitGroup()) lt 6}">
     						<c:if test="${ fn:length(sg.getLimitGroup()) ne 1}">
	     						<span class="badge badge-danger">나이 제한</span>
     						</c:if>
     					</c:if>

     					 
     					 
     					 
				          <h4 class="card-title mt-2">${sg.getGTitle()}</h4>
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
				    
				<br /><br /><br />
				  </div>
				</c:forEach> 
	</div>
</div>
<script>
	$(function() {
		$('.form-group label').each(function() {
			$(this).css('font-weight', '400');
		});
	});
	
	$(function(){
		$(".card[id]").on("click",function(){
			var gId = $(this).attr("id");
			console.log("gId="+gId);
			location.href = "${pageContext.request.contextPath}/sgroup/groupInfo.do?gId="+gId;
		});
	});
	
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
