<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
<form action="${pageContext.request.contextPath}/sgroup/groupJoin.do">
<input type="hidden" name="userId" value="${member.getUserId() }"/>
<input type="hidden" name="gId" value="${sgroup.getGId() }"/>
	<div class="intro">
		<div class="col-12">
			<div class="content">
				<div style="border-bottom:1px solid black">
					<p style="font-size:1.2em">모임 상세보기</p>
				</div>
				<div style="margin-left: 5%;">
				<svg width="1em" height="4em" viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M10.648 7.646a.5.5 0 0 1 .577-.093L15.002 9.5V13h-14v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
				  <path fill-rule="evenodd" d="M4.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<span style="font-size: smaller;">모임 대표 이미지</span>
				
				
			<div class="row">

				<div class="sgroupPicture" id="imgArea" style="display:inline; margin-top:-15px;width:400px; height:350px;" >
					<c:if test="${sgroup.getGImg() ne null}">
					<img src="${pageContext.request.contextPath}/resources/upload/groupImg/${sgroup.getGImg()}" style="width:400px; height:300px; display:block; margin-left:50px" id="sampleImg">
				</c:if>
				<c:if test="${sgroup.getGImg() eq null}">
					<c:if test="${sgroup.getGType() eq 'S' }">
						<img src="${pageContext.request.contextPath}/resources/img/fav02.png" style="width:400px; height:300px; display:block; margin-left:50px" id="sampleImg">
					</c:if>
					<c:if test="${sgroup.getGType() eq 'L' }">
						<img src="${pageContext.request.contextPath}/resources/img/fav01.png" style="width:400px; height:300px; display:block; margin-left:50px" id="sampleImg">
					</c:if>
				</c:if>
				</div> 

			<div style="display : inline; margin-left:10%">
			
			
			 <div class="form-group">
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
					       	<button type="button" class="btn btn-secondary btn-pill" style="background:#132742; border:#132742;">운동</button>		        
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
				</div>
				
				
				
			<div class="form-group">
			<label style="margin-bottom:-1px">모임 타이틀</label>
			  <p>${sgroup.getGTitle()}</p>
			</div>
				
				<div class="form-group">
				<label style="margin-bottom:-1px">모임 장소 </label>
				<p>${sgroup.getGPlace() }</p>
				</div>
		
				<div class="form-group">
				<c:if test="${sgroup.getGType() eq 'S' }">
				<label style="margin-bottom:-1px">모임 날짜</label>
				<p>${sgroup.getDurate()}</p>	
				</c:if>
				<c:if test="${sgroup.getGType() eq 'L'}">
				<label style="margin-bottom:-1px">종료 날짜</label>
				<p>${sgroup.getDurate()}</p>
				</c:if>
				</div>
				
				<div class="form-group">
				<label style="margin-bottom:-1px">회비</label>
				<c:if test="${sgroup.getCharge() eq 'Y' }">
					<p>회비 금액 : ${sgroup.getGFee()}</p>
				</c:if>
				<c:if test="${sgroup.getCharge() eq 'N' }">
					<p>회비 없음</p>
				</c:if>
				</div>

				
				<div class="form-group">
				<label style="margin-bottom:-1px">인원 수</label>
				<p>${fn:length(joing) } / ${sgroup.getMaxNum() } 명</p>
				</div>
			
				<div class="form-group">
				<label style="margin-bottom:-1px">성별 제한</label>
				<c:if test="${sgroup.getLimitGroup()[0] eq 'M'}">
                	<p>남자만</p>
                </c:if>
                <c:if test="${sgroup.getLimitGroup()[0] eq 'F'}">
                    <p>여자만</p>
                </c:if>
                <c:if test="${sgroup.getLimitGroup()[0] eq 'A'}">
                    <p>성별무관</p>
                </c:if>
				</div>

				<div class="form-group">
				<label style="margin-bottom:-1px">나이 제한</label>
				<c:if test="">
                	<span class="badge badge-pill badge-success">10대</span>
                </c:if>
                <c:if test="Arrays.asList(${sgroup.getLimitGroup()}).contains('20대')">
                	<span class="badge badge-pill badge-success">20대</span>
                </c:if>
				</div>
				
				<div class="form-group">
				<label style="margin-bottom:-1px">공개 여부</label>
				<c:if test="${ !empty sgroup.getGPwd() }">
				<p style="color:red;">비공개</p>
				</c:if>
				<c:if test="${ empty sgroup.getGPwd() }">
				<p>공개</p>
				</c:if>
				</div>
				
				<div class="form-group">
				<label style="margin-bottom:-1px">모임 승인제</label>
				<c:if test="${sgroup.getJoinType() eq 'C' }">
				<p>모임장의 승인이 있어야 가입 가능합니다.</p>
				<input type="hidden" name="joinType" value="C" />
				</c:if>
				<c:if test="${sgroup.getJoinType() eq 'F' }">
				<p>자유롭게 가입이 가능합니다.</p>
				<input type="hidden" name="joinType" value="F" />
				</c:if>
				</div>
				
				<div class="form-group">
				<label style="margin-bottom:-1px">모임 소개</label>
				<p style="white-space: pre;">${sgroup.getGIntro()}</p>
				</div>
				
				<div style="width: 400px; text-align: center;">
					<button type="submit" id="joinGroupBtn" class="btn btn-secondary" style="background:#132742; border:#132742;" onclick="groupConfirm();">가입하기</button>
					<c:if test="${groupCount >= 5 and member.getMLevel()==0}">
						<script>
							$(function(){
								$('#joinGroupBtn').attr('disabled', true);
							});
						</script>
					</c:if>
				
				</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</form>
</div>
<script>
function groupConfirm(){
	var checkResult = window.confirm('모임에 가입하시겠습니까?');
	
	var str ="";
	
	if(checkResult == true) {
	    str ="모임 가입 완료!";
	} else {
	    str ="취소합니다.";
	}
}
</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />