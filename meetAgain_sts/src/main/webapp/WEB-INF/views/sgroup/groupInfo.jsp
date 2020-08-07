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
					<p id="gFee">회비 금액 : ${sgroup.getGFee()}</p>
				</c:if>
				<c:if test="${sgroup.getCharge() eq 'N' }">
					<p>회비 없음</p>
				</c:if>
				</div>
				
				<script>
					$(function(){
						$('#gFee').toLocaleString();
					});
				</script>

				<div class="form-group">
				<label style="margin-bottom:-1px">인원 수</label>
				<p>${groupMem } / ${sgroup.getMaxNum() } 명</p>
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
				<label style="margin-bottom:-1px">가입 가능 연령대</label>
					<c:if test="${fn:length(sgroup.getLimitGroup()) eq 6 or fn:length(sgroup.getLimitGroup()) eq 1 }">
		     		<p class="badge badge-pill badge-success">나이무관</p> 
		     		</c:if>
		     		<c:if test="${fn:length(sgroup.getLimitGroup()) lt 6}">
		     			<c:if test="${ fn:length(sgroup.getLimitGroup()) ne 1}">
			     			<div>
			     			<c:forEach var="li" items="${sgroup.getLimitGroup()}" begin="1">
			     				<span class="badge badge-pill badge-success">${li}</span>
			     			</c:forEach>
			     			</div>
		     			</c:if>
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
					<button type="submit" id="joinGroupBtn" class="btn btn-secondary" style="background:#132742; border:#132742;">가입하기</button>
					<c:if test="${groupCount >= 5 and member.getMLevel()==0}">
						<script>
							$(function(){
								$('#joinGroupBtn').attr('disabled', true);
							});
						</script>
					</c:if>
					<c:forEach var="jo" items="${joing}">
						<c:if test="${jo.getUserId().equals(member.getUserId()) and jo.getIsReady()=='2'}">
						<script>
						$(function(){
							$('#joinGroupBtn').html('승인중').attr('disabled', true);
						});
						</script>
						</c:if>
					</c:forEach>
					<input type="hidden" id="private"/>
					<input type="hidden" id="ageConfirm" />
					<input type="hidden" id="genderConfirm"/>
					<input type="hidden" id="maxNumConfirm"/>	
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
var age ="";
var cnt1 = "0";
var cnt2 = "0";
var cnt3 = "0";
var cnt4 = "0";
var cnt5 = "0";
var myAgeTest = 0;
$(function(){ 
	var result = new Array();
	var json = new Object();

		var birthYear = '${member.getBirthday()}'.substr(0,4);
		var today = new Date();
		var nowYear = today.getFullYear();
		age = nowYear - birthYear + 1;
  		
		<c:forEach var="li" items="${sgroup.getLimitGroup()}" begin="1">
			json = "${li}";
		console.log("json : " + json);
		result.push(json);
		</c:forEach>
		var myage = String(age).substr(0,1);
		
		
		console.log("myage : " + myage);
	 	for(var i in result){
	 		if(result[i] == "10대") cnt1 = "1";
	 		else if(result[i] == "20대") cnt2 = "1";
	 		else if(result[i] == "30대") cnt3 = "1";
	 		else if(result[i] == "40대") cnt4 = "1";
	 		else if(result[i] == "50대") cnt5 = "1";
	 	}
	 	if(myage==1) myAgeTest = cnt1;
	 	else if(myage==2) myAgeTest = cnt2;
	 	else if(myage==3) myAgeTest = cnt3;
	 	else if(myage==4) myAgeTest = cnt4;
	 	else if(myage==5) myAgeTest = cnt5;
	 	
	 	
	});


$(function(){	
	$('form').on('submit',function(event){
        alert("이 내용으로 가입 하시겠습니까?");
        
        <c:if test="${sgroup.getMaxNum()==groupMem }">
        	alert('가입가능한 인원수를 초과하였습니다.');
    		$('#maxNumConfirm').addClass('fail').removeClass('success');
    		return false;
        </c:if>
        
        <c:if test="${!empty sgroup.getGPwd()}">
    	var gPwd = ${sgroup.getGPwd()};
    	var inputPassword = window.prompt('모임 비밀번호를 입력하세요'); 
    		if(gPwd==inputPassword){
    			$('#private').addClass('success').removeClass('fail');
    		}else {
    			alert('비밀번호가 틀렸습니다.');
    			$('#private').addClass('fail').removeClass('success');
    		}
    	</c:if>
    	
    	<c:if test="${fn:length(sgroup.getLimitGroup()) lt 6}">
    		<c:if test="${ fn:length(sgroup.getLimitGroup()) ne 1}">
    			if(myAgeTest==1){
    				$('#ageConfirm').addClass('success').removeClass('fail');
    		 	} else {
    		 		alert("연령대가 맞지 않습니다.");
    		 		$('#ageConfirm').addClass('fail').removeClass('success');
    		 	}
    		</c:if>
    	</c:if>
    	
    	<c:if test="${sgroup.getLimitGroup()[0] eq 'M' and member.getGender().trim() eq 'F'}">
    		alert('이 모임은 남자만 가입가능합니다.');
    		$('#genderConfirm').addClass('fail').removeClass('success');
    	</c:if>
    	<c:if test="${sgroup.getLimitGroup()[0] eq 'F' and member.getGender().trim() eq 'M'}">
    		alert('이 모임은 여자만 가입가능합니다.');
    		$('#genderConfirm').addClass('fail').removeClass('success');
    	</c:if>
    	
        if($('.fail').length == 0 && confirm) {
            alert(' 성공!');
        }else{

            event.preventDefault();
        }

    
    });

});

	 

</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />