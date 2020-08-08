<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<section style="border-bottom: 1px solid #e0e0e0;">
<div class="container">
<br />
<input type="hidden" name="uid" value="${member.userId }" />
<input type="hidden" id="address1" value="${member.address1 }" />
<c:if test="${ !empty member.address2 && member.address3}">
	<input type="hidden" id="address2" value="${member.address2}" />
	<input type="hidden" id="address3" value="${member.address3}" />
</c:if>
		<div class="row">
			<div class="col-lg-4 col-md-4">
				<div class="dropdown">
						<a href="" class="dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">${fn:substring(member.address1,3,7)}</a> 주변의 소모임 리스트 입니다.
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

						<a class="dropdown-item" href="#">${fn:substring(member.address1,3,7)}</a>
					<c:if test="${ !empty member.address2 and !empty member.address3}">
						<a class="dropdown-item" href="#">${fn:substring(member.address2,3,7)}</a> 
						<a class="dropdown-item" href="#">${fn:substring(member.address3,3,7)}</a>
					</c:if>
					</div>
				</div>  
			</div>
			<div class="col-lg-8 col-md-8">
				<div class="rows">
					<div class="row">
						<div class="col-4">
							<input type="text" class="form-control" id="keyword" placeholder="모임명을 검색하세요">
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-info" style="margin-left: -20%;background:#132742; border:#132742;" id="searchGroup">검색</button>
						</div>
						<div class="col-3">
							<button type="button" class="btn btn-info" id="showFilter" style="margin-left: -40%;background:#132742; border:#132742 ;">상세 검색 ▼</button>
						</div>
						<div class="col-2">
							<button type="button" id="groupCreBtn" class="btn btn-success" style="margin-left: -80%;background:#ffb5b6; border:#ffb5b6;" onclick="location.href='${pageContext.request.contextPath}/sgroup/create.do'">모임 생성</button>
							<c:if test="${groupCount != 0 && groupCount >= 5 and member.getMLevel()==0}">
							<script>
								$(function(){
									$('#groupCreBtn').attr('disabled', true);
								});
							</script>
							</c:if>
						</div>
					</div>
					
					
					<div class="rows form-group" id="filter" style="display : none;">
						<div class="row">
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="short" value="S" name="gType"> 
								<label class="custom-control-label" for="short" style="font-weight: 400; margin-right: 10px;">단기</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="long" value="L" name="gType"> 
								<label class="custom-control-label" for="long" style="font-weight: 400; margin-right: 10px;">장기</label>
							</div>
						</div>
						<div class="row">
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C01" value="C01" name="cateId"> 
								<label class="custom-control-label" for="C01" style="font-weight: 400; margin-right: 10px;">운동</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C02" value="C02" name="cateId"> 
								<label class="custom-control-label" for="C02" style="font-weight: 400; margin-right: 10px;">친목</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C03" value="C03" name="cateId"> 
								<label class="custom-control-label" for="C03" style="font-weight: 400; margin-right: 10px;">공부</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C04" value="C04" name="cateId"> 
								<label class="custom-control-label" for="C04" style="font-weight: 400; margin-right: 10px;">취미생활</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C05" value="C05" name="cateId"> 
								<label class="custom-control-label" for="C05" style="font-weight: 400; margin-right: 10px;">문화생활</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C06" value="C06" name="cateId"> 
								<label class="custom-control-label" for="C06" style="font-weight: 400; margin-right: 10px;">여행</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C07" value="C07" name="cateId"> 
								<label class="custom-control-label" for="C07" style="font-weight: 400; margin-right: 10px;">봉사</label>
							</div>
							<div class="col-1.5 custom-control custom-checkbox my-2">
								<input type="checkbox" class="custom-control-input" id="C08" value="C08" name="cateId">
								<label class="custom-control-label" for="C08" style="font-weight: 400; margin-right: 10px;">기타</label>
							</div>
						</div>
						<div class="row">
							<div class="custom-control custom-checkbox col-1.5 ">
								<input type="checkbox" class="custom-control-input" id="teens" value="10대" name="limitGroup"> 
								<label class="custom-control-label" for="teens" style="font-weight: 400; margin-right: 10px;">10대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="2teens" value="20대" name="limitGroup"> 
								<label class="custom-control-label" for="2teens" style="font-weight: 400; margin-right: 10px;">20대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="3teens" value="30대" name="limitGroup">
								<label class="custom-control-label" for="3teens" style="font-weight: 400; margin-right: 10px;">30대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="4teens" value="40대" name="limitGroup"> 
								<label class="custom-control-label" for="4teens" style="font-weight: 400; margin-right: 10px;">40대</label>
							</div>
							<div class="custom-control custom-checkbox col-1.5">
								<input type="checkbox" class="custom-control-input" id="5teens" value="50대" name="limitGroup"> 
								<label class="custom-control-label" for="5teens" style="font-weight: 400; margin-right: 10px;">50대</label>
							</div>
						</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="whatever" name="limitGroup" value="A" class="custom-control-input"> 
							<label class="custom-control-label" for="whatever" style="padding-right: 6px;">성별 무관 </label>
						</div>
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="male" name="limitGroup" value="M" class="custom-control-input"> 
							<label class="custom-control-label" for="male" style="padding-right: 6px;">남자</label>
						</div>
						<div class="col-1.5 custom-control custom-radio my-2">
							<input type="radio" id="female" name="limitGroup" value="F" class="custom-control-input"> 
							<label class="custom-control-label" for="female">여자</label>
						</div>
						<div class="col-6 custom-control custom-radio my-2"></div>
					</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			<script>
			$('#showFilter').click(function(){
				 $('#filter').toggle();
			});
			
			</script>
		</div>
		<br />
<!-- 카테고리 추천 START -->

 	<br /><br />
 	<div class="row">
		<h4 style="margin-left: 20px;">관심 카테고리 추천</h4>
	</div> 
	<div class="row" id="testtest">
		<c:forEach items="${cateInfo}" var="ca" end="2">
			<c:if test="${!empty ca }">
				<script>
				$(function(){
					$('#${ca.getGId()}').clone(true).appendTo($('#testtest'));
               			
				});
				</script> 
			</c:if>
		</c:forEach>
		<c:if test="${empty cateInfo}">
			<p style="margin-left:20px"> 설정한 관심 카테고리가 없습니다. 마이페이지에서 관심 카테고리를 등록해주세요! </p>
		</c:if>
	</div>
<!-- 카테고리 추천 END -->
</div>
</section>
<br> <br> <br>

<!-- 소모임 전체 리스트 START -->
<div class="container">
	<div class="row" id="searchShowDiv">
	</div>
</div>
<div id="searchHideDiv">
<div class="container">
	<div class="row">
		
		<c:forEach items="${list}" var="sg">
				    
				  <div class="col-md-4 cardOne" id="${ sg.getGId()}" style="max-width: 500px;">
					   <c:if test="${sg.getIsFin() == 'Y'}">
					<script>
				    		$(function(){
				    			
				    			$('<h4 style="position: absolute;top: 30%; left: 25%;">종료된 모임입니다.</h4>').appendTo('#${ sg.getGId()}');
				    			$('#${ sg.getGId()} .component').css('opacity', '0.2');
				    			$('#${ sg.getGId()}').removeAttr('id');
				    		});
				    	</script>		
				    </c:if>
				    <div class="component">
				      <div class="card" style="cursor:pointer;">
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
				        
				        <input type="hidden" id="gPlace" value="${sg.getGPlace() }" />
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

     					 <c:if test="${!empty sg.getGPwd() }">
						<span class="badge badge-danger">비공개</span>
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
</div>

<!-- 소모임 전체 LIST END -->
<script>

	$(function() {
		$('.form-group label').each(function() {
			$(this).css('font-weight', '400');
		});
	});
	
	$(function(){
		$(".cardOne[id]").on("click",function(){
			var gId = $(this).attr("id");
			var result = new Array();
			console.log("gId="+gId);
			
			<c:forEach items="${joUser}" var="jo">
			var json = new Object();
			json.joGId = ${jo.getGId()};
			result.push(json);
			</c:forEach>

			if(JSON.stringify(result).indexOf(gId) < 0){
				location.href = "${pageContext.request.contextPath}/sgroup/groupInfo.do?gid="+gId;
			} else {
				location.href = "${pageContext.request.contextPath}/sgroup/gotoGroup.do?gid="+gId;
			}
		});
	});
	
	$('#searchGroup').on('click', function() {
		var gTypeArr = new Array();
		var cateIdArr = new Array();
		var limitGroupArr = new Array();
		
		$('input[name=gType]:checked').each(function(){
				gTypeArr.push(this.value);
		});
		
		$('input[name=cateId]:checked').each(function(){
				cateIdArr.push(this.value);
		});
		$('input[name=limitGroup]:checked').each(function(){
				limitGroupArr.push(this.value);
	});
		
		
		
		$.ajax({
	          url:'${pageContext.request.contextPath}/sgroup/searchGroup.do',
	          data : {
	             keyword : $('#keyword').val(),
	             gType : gTypeArr,
	             cateId : cateIdArr,
	             limitGroup : limitGroupArr
	          }, type : "get",
	          success:function(data){

	              $('#searchHideDiv').hide();

	             for(var i in data){
	                 console.log(data[i].gid);
	                 $('#'+data[i].gid).clone(true).appendTo($('#searchShowDiv'));
	             }
	             
	          }, beforeSend:function(){
	        	  $('#searchShowDiv').empty();
	          }, error:function(){
	             alert("검색실패");
	          }
	       });

		
		
		
	});
	
</script>


<c:import url="/WEB-INF/views/common/footer.jsp" />
