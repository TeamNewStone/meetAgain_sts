<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp"/>


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
					  <form style="line-height:1em;"action="${ pageContext.request.contextPath }">
						  <div class="form-group" style="text-align:center;">
						  <img src="/meetAgain/resources/img/usericon.png" id="sampleImg" alt="usericon" class="img-fluid rounded-circle" style="width : 120px;">
						  <br />
						  <button type="button" id="mimgBtn">사진 첨부</button>
								<input type="file" name="userImg" id="profileImgBtn" style="display: none;"
								onchange="loadImg(this);" />

						  </div>
						  <div class="form-group">
						    <label for="blood">혈액형</label>
						    <input type="text" class="form-control" id="blood" maxlength="2" placeholder="ex) AB">
						  </div>
						  <div class="form-group">
						    <label for="constellation">별자리</label>
						    <input type="text" class="form-control" id="constellation" placeholder="염소자리" readonly>
						  </div>
						  <div class="form-group">
						    <label for="MBTI">MBTI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <button type="button" class="btn btn-outline-secondary" onclick="window.open('https://www.16personalities.com/ko','_blank')">테스트하러 가기</button></label><br />
						    <input type="text" class="form-control" id="MBTI" placeholder="ex) ISFP" >
						  </div>
						  <div class="form-group">
						    <label for="interest">주 관심사</label>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" id="customCheck1">
						    <label class="custom-control-label" for="customCheck1" style="width:150px;">운동</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" id="customCheck2">
						    <label class="custom-control-label" for="customCheck2">소통</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" id="customCheck3">
						    <label class="custom-control-label" for="customCheck3" style="width:150px;">공부</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" id="customCheck4">
						    <label class="custom-control-label" for="customCheck4">취업</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" id="customCheck5">
						    <label class="custom-control-label" for="customCheck5" style="width:150px;">음악 / 댄스</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" id="customCheck6">
						    <label class="custom-control-label" for="customCheck6">고상한 취미</label></span>
						    </div>
						  </div>
						  <br />
						  <div class="form-group">
						    <label for="exampleInputPassword1">키워드</label>
						    <small id="emailHelp" class="form-text text-info">본인을 소개하는 키워드를 # 태그를 이용해 자유롭게 표현해주세요!</small>
						    <input type="text" class="form-control" id="phoneNo" >
						  </div>

<br />
						  <button type="submit" class="btn btn-block btn-secondary" >등록하기</button>
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




</script>


<c:import url="/views/common/footer.jsp"/>

