<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.kh.meetAgain.member.model.vo.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />


<div class="container-fluid">
  <div class="row">
	  <div class="col-12 col-md-4 offset-md-4">
				  <div class="register-form">
					  <div class="mb-7">
					  <br />
					  <br />
					  <br />
						  <h1>부가정보</h1>
					  <br />
					  </div>
					  <form style="line-height:1em;"action="${ pageContext.request.contextPath }/member/mTMIUpdate.do">
					  
					  
					  <input type="hidden" name="userId" value="${UserTMI.userId }" />
					  
					  
						  <div class="form-group" style="text-align:center;">
						<c:if test="${UserTMI.userImg eq null }">
							<img
								src="${ pageContext.request.contextPath }/resources/img/usericon.png"
								alt="usericon"
								class="img-fluid rounded-circle" id="sampleImg" style="width: 180px;">
						</c:if>
						<c:if test="${UserTMI.userImg ne null }">
							<img
								src="${ pageContext.request.contextPath }/resources/img/${member.userImg}"
								alt="Raised circle image"
								class="img-fluid rounded-circle" id="sampleImg" style="width: 180px;">
						</c:if>
						<br />
						  <button type="button" id="mimgBtn">사진 첨부</button>
								<input type="file" name="userImg" id="profileImgBtn" style="display: none;"
								onchange="loadImg(this);" />

						  </div>
						  <div class="form-group">
						    <label for="blood">혈액형</label>
						    <c:if test="${UserTMI.blood eq ''}">
						    <input type="text" class="form-control" id="blood" maxlength="2" name="blood" placeholder="ex) AB" style="text-transform:uppercase;">
						    </c:if>
						    <c:if test="${UserTMI.blood ne ''}">
						    <input type="text" class="form-control" id="blood" maxlength="2" name="blood" placeholder="ex) AB" value="${UserTMI.blood}" style="text-transform:uppercase;">
						    </c:if>
						    <small><span class="error_next_box text-info" id="bloodNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  <div class="form-group">
						    <label for="constellation">별자리</label>
						    <input type="text" class="form-control" id="constellation" placeholder="염소자리" readonly>
						  </div>
						  <div class="form-group">
						    <label for="MBTI">MBTI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <button type="button" class="btn btn-outline-secondary" onclick="window.open('https://www.16personalities.com/ko','_blank')">테스트하러 가기</button></label><br />
						    <c:if test="${UserTMI.mbti eq ''}">
						    <input type="text" class="form-control" id="MBTI" placeholder="ex) ISFP" name="mbti" maxlength="4" style="text-transform:uppercase;" >
						    </c:if>
						    <c:if test="${UserTMI.mbti ne ''}">
						    <input type="text" class="form-control" id="MBTI" placeholder="ex) ISFP" name="mbti" maxlength="4" value="${UserTMI.mbti}" style="text-transform:uppercase;" >
						    </c:if>
						    <small><span class="error_next_box text-info" id="mbtiNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  <div class="form-group">
						    <label for="interest">주 관심사</label>
						    <div class="custom-control custom-checkbox my-2">
						    <% 
					    		List<String> cateList = null;
								/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
								String[] cate_id = ((CateInfo)request.getAttribute("CateInfo")).getCateId();

								if(cate_id != null)//이 조건이 없다면,취미체크박스에 하나도 체크하지 않았다면, Array.asList(null)=>NullPointerException 
									cateList = Arrays.asList(cate_id);
							%>
						    <span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C01" id="customCheck1" <%=cateList!=null && cateList.contains("C01")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck1" style="width:150px;">운동</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C02" id="customCheck2" <%=cateList!=null && cateList.contains("C02")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck2" style="width:150px;">친목</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C03" id="customCheck3" <%=cateList!=null && cateList.contains("C03")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck3" style="width:150px;">공부</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C04" id="customCheck4" <%=cateList!=null && cateList.contains("C04")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck4" style="width:150px;">취미생활</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C05" id="customCheck5" <%=cateList!=null && cateList.contains("C05")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck5" style="width:150px;">문화생활</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C06" id="customCheck6" <%=cateList!=null && cateList.contains("C06")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck6" style="width:150px;">여행</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C07" id="customCheck7" <%=cateList!=null && cateList.contains("C07")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck7" style="width:150px;">봉사</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="cateId" value="C08" id="customCheck8" <%=cateList!=null && cateList.contains("C08")?"checked":""%>>
						    <label class="custom-control-label" for="customCheck8" style="width:150px;">기타</label></span>
						    </div>
						    
						  </div>
						  <br />
						  <div class="form-group">
						    <label for="exampleInputPassword1">키워드</label>
						    <small id="emailHelp" class="form-text text-info">본인을 소개하는 키워드를 # 태그를 이용해 자유롭게 표현해주세요!</small>
						    <c:if test="${UserTMI.keyword eq ''}">
						    <input type="text" class="form-control" name="keyword" id="keyword" >
						    </c:if>
						    <c:if test="${UserTMI.keyword ne ''}">
						    <input type="text" class="form-control" name="keyword" id="keyword" value="${UserTMI.keyword}" >
						    </c:if>
						  </div>

<br />
						  <button type="submit" class="btn btn-block btn-secondary" onclick="return tmiInsert();">등록하기</button>
						</form>

		  		</div>
	  </div>

  </div>
</div>

					  <br />
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />

<script>

$('#blood').keyup(function(){
	$(this).val($(this).val().replace(" ", ""));
	$(this).val($(this).val().toUpperCase());
});
$('#MBTI').keyup(function(){
	$(this).val($(this).val().replace(" ", ""));
	$(this).val($(this).val().toUpperCase());
});


$('#mimgBtn').on('click', function() {
	$('#profileImgBtn').click();
});

function loadImg(value) {

	if (value.files && value.files[0]) {

		var reader = new FileReader();

		reader.onload = function(e) {
			$('#sampleImg').attr('src', e.target.result);
		}

		reader.readAsDataURL(value.files[0]);
	}
};

function isBlood(p) {
    var bloodChk = /^(A|B|O)$|(AB)$/;
    return bloodChk.test(p);
}

function isMBTI(p) {
	var MBTIchk = /^[E|I][S|N][F|T][P|J]$/;
	return MBTIchk.test(p);
}

function tmiInsert(){
	if($('#blood').val()=="" || isBlood($('#blood').val())){
		$("#bloodNoMsg").hide();
		$('#blood').addClass('success').removeClass('fail');
	}else if(!isBlood($('#blood').val())) {
        showErrorMsg($("#bloodNoMsg"),"정말 이 혈액형이 맞나요..?");
        $('#blood').addClass('fail').removeClass('success');
    }
	if($('#MBTI').val()=="" || isMBTI($('#MBTI').val())){
		$("#mbtiNoMsg").hide();
		$('#MBTI').addClass('success').removeClass('fail');
	}else if(!isMBTI($('#MBTI').val())) {
        showErrorMsg($("#mbtiNoMsg"),"MBTI 결과를 다시 확인해주세요!");
        $('#MBTI').addClass('fail').removeClass('success');
    }
	
	if($('.fail').length > 0){
		return false;
	}else{
		return true;
	}
}

function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}


</script>


<c:import url="/WEB-INF/views/common/footer.jsp" />

