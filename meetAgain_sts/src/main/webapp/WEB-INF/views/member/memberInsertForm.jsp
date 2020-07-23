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
						  <h1>회원가입</h1>
					  <br />
					  </div>
					  <form style="line-height:1em;">
						  <div class="form-group">
						    <label for="Email1">* 이메일</label>
						    <input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="123@example.com" readonly>
						    <!-- <small id="emailHelp" class="form-text text-info">We'll never share your email with anyone else.</small> -->
						  </div>
						  <div class="form-group">
						    <label for="userName">* 이름</label>
						    <input type="text" class="form-control" id="userName" placeholder="홍길동" readonly>
						  </div>
						  <div class="form-group">
						    <label for="NickName">*닉네임</label>
						    <input type="text" class="form-control" id="NickName" placeholder="2자 이상 6자 이하로 작성해주세요." maxlength="6" required>
						    <small><span class="error_next_box text-info" id="nickNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  <div class="form-group">
						    <label for="gender">* 성별</label><br />
						    <label class="box-radio-input"><input type="radio" name="gender" value="옵션1" checked="checked" disabled><span>남자</span></label>
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="box-radio-input"><input type="radio" name="gender" value="옵션2" disabled><span>여자</span></label>
						  </div>
						  <div class="form-group">
						    <label for="birthday">* 생년월일</label>
						    <input type="text" class="form-control" id="birthday" placeholder="1990-01-01" readonly>
						  </div>
						  <div class="form-group">
						    <label for="phoneNo">* 전화번호</label>
						    <input type="text" class="form-control" id="phoneNo" placeholder="'-'없이 번호만 입력해주세요. ex)01012345678" required>
						    <small><span class="error_next_box" id="iphoneNoMsg" style="display:none;color:red;" aria-live="assertive"></span></small>
						  </div>
						  
						  <div class="form-group">
							<label for="zipCode" style="display:block;">* 주소(집)</label>
								<input type="text" class="form-control2" id="zipCode1"
									name="zipCode" placeholder="우편번호" style="width:50px important;" required>
								<button type="button" class="btn btn-secondary mb-2" value="1" onclick="addrSearch1();">검색</button>
								<input type="text" class="form-control" id="address1"
									name="address1" placeholder="상세주소" required>
						</div>
						
						<div class="form-group">
							<label for="zipCode" style="display:block;">주소(직장)</label>
								<input type="text" class="form-control2" id="zipCode2"
									name="zipCode" placeholder="우편번호" style="width:50px important;">
								<button type="button" class="btn btn-secondary mb-2" value="2" onclick="addrSearch2();">검색</button>
								<input type="text" class="form-control" id="address2"
									name="address" placeholder="상세주소">
						</div>
						
						<div class="form-group">
							<label for="zipCode" style="display:block;">주소(관심)</label>
								<input type="text" class="form-control2" id="zipCode3"
									name="zipCode" placeholder="우편번호" style="width:50px important;">
								<button type="button" class="btn btn-secondary mb-2" value="3" onclick="addrSearch3();">검색</button>
								<input type="text" class="form-control" id="address3"
									name="address" placeholder="상세주소" >
						</div>
<br />
						  <button type="submit" class="btn btn-block btn-secondary" onclick="return send();">가입하기</button>
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

$('#phone').keyup(function(){
	var phoneChk = /^[0-9]$/;
	if(!phoneChk.test($(this).val())){
		$(this).val($(this).val().replace(phoneChk,''));
		$(this).focus();
	}
	

	
});


function isCellPhone(p) {
    var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
    return regPhone.test(p);
}

function send(){
    if(!isCellPhone($('#phoneNo').val())) {
        showErrorMsg($("#iphoneNoMsg"),"형식에 맞지 않는 번호입니다.");
        return false;
    }else{
    	$("#iphoneNoMsg").hide();
    }
    
    if($('#NickName').val().length < 2){
    	showErrorMsg($("#nickNoMsg"),"최소 2자 이상 입력해야 합니다.");
        return false;
    }else{
    	$("#nickNoMsg").hide();
    }
}
function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}


// 참조 API : http://postcode.map.daum.net/guide
function addrSearch1() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#zipCode1').val(data.zonecode); //5자리 새우편번호 사용

					$('#address1').val(fullAddr);

					// 커서를 상세주소 필드로 이동한다.
					$('#address1').focus();
				}
			}).open();
};
//참조 API : http://postcode.map.daum.net/guide
function addrSearch2() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#zipCode2').val(data.zonecode); //5자리 새우편번호 사용

					$('#address2').val(fullAddr);

					// 커서를 상세주소 필드로 이동한다.
					$('#address2').focus();
				}
			}).open();
};
//참조 API : http://postcode.map.daum.net/guide
function addrSearch3() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#zipCode3').val(data.zonecode); //5자리 새우편번호 사용

					$('#address3').val(fullAddr);

					// 커서를 상세주소 필드로 이동한다.
					$('#address3').focus();
				}
			}).open();
};




</script>


<c:import url="/views/common/footer.jsp"/>

