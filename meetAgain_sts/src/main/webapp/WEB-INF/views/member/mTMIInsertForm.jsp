<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					  
					  <!-- 로그인 완료되면 value=${member.userId} 로 바뀌어야합니다 -->
					  <input type="hidden" name="userId" value="u20a001" />
					  
					  
						  <div class="form-group" style="text-align:center;">
						  <img src="/meetAgain/resources/img/usericon.png" id="sampleImg" alt="usericon" class="img-fluid rounded-circle" style="width : 120px;">
						  <br />
						  <button type="button" id="mimgBtn">사진 첨부</button>
								<input type="file" name="userImg" id="profileImgBtn" style="display: none;"
								onchange="loadImg(this);" />

						  </div>
						  <div class="form-group">
						    <label for="blood">혈액형</label>
						    <input type="text" class="form-control" id="blood" maxlength="2" name="blood" placeholder="ex) AB" style="text-transform:uppercase;">
						    <small><span class="error_next_box text-info" id="bloodNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  <div class="form-group">
						    <label for="constellation">별자리</label>
						    <input type="text" class="form-control" id="constellation" placeholder="염소자리" readonly>
						  </div>
						  <div class="form-group">
						    <label for="MBTI">MBTI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <button type="button" class="btn btn-outline-secondary" onclick="window.open('https://www.16personalities.com/ko','_blank')">테스트하러 가기</button></label><br />
						    <input type="text" class="form-control" id="MBTI" placeholder="ex) ISFP" name="MBTI" maxlength="4" style="text-transform:uppercase;" >
						    <small><span class="error_next_box text-info" id="mbtiNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  <div class="form-group">
						    <label for="interest">주 관심사</label>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C01" id="customCheck1">
						    <label class="custom-control-label" for="customCheck1" style="width:150px;">운동</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C02" id="customCheck2">
						    <label class="custom-control-label" for="customCheck2" style="width:150px;">친목</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C03" id="customCheck3">
						    <label class="custom-control-label" for="customCheck3" style="width:150px;">공부</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C04" id="customCheck4">
						    <label class="custom-control-label" for="customCheck4" style="width:150px;">취미생활</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C05" id="customCheck5">
						    <label class="custom-control-label" for="customCheck5" style="width:150px;">문화생활</label></span>
						    &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C06" id="customCheck6">
						    <label class="custom-control-label" for="customCheck6" style="width:150px;">여행</label></span>
						    </div>
						    <div class="custom-control custom-checkbox my-2">
						    <span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C07" id="customCheck7">
						    <label class="custom-control-label" for="customCheck7" style="width:150px;">봉사</label></span>
						     &nbsp;&nbsp;&nbsp;&nbsp;<span>
						    <input type="checkbox" class="custom-control-input" name="category" value="C08" id="customCheck8">
						    <label class="custom-control-label" for="customCheck8" style="width:150px;">기타</label></span>
						    </div>
						    
						  </div>
						  <br />
						  <div class="form-group">
						    <label for="exampleInputPassword1">키워드</label>
						    <small id="emailHelp" class="form-text text-info">본인을 소개하는 키워드를 # 태그를 이용해 자유롭게 표현해주세요!</small>
						    <input type="text" class="form-control" name="keyword" id="keyword" >
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
	    var checkArr = [];     // 배열 초기화
	    $("input[name='category']:checked").each(function(i) {
	        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    });
	 
	    $.ajax({
	        url: '${ pageContext.request.contextPath }/member/mCateUpdate.do'
	        , type: 'post'
	        , dataType: 'text'
	        , data: {
	            cateId: checkArr
	        }, success: function(data){
	        	console.log(data);
	        }
	    });
		
	}
	
	

}

function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}


</script>


<c:import url="/WEB-INF/views/common/footer.jsp" />

