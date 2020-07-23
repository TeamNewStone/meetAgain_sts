<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  #Btn{
    font-size: 10px;
  }
  #textFm{
    font-size: 10px;
    margin-top: 10px;
  }
</style>

<!-- 우편번호 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<c:import url="/views/common/header.jsp" />

<!-- 기본정보수정 시작 -->
<div class="col-12"><br></div>
<div class="container">
  <div class="info">
    <div class="row">
	    <div class="col-12 col-md-4 text-center">
		    <img src="${ pageContext.request.contextPath }/resources/img/lorde.png" alt="Raised circle image" class="img-fluid rounded-circle shadow-lg" style="width: 180px;">
	    </div>
	    
      <div class="col-12 col-md-4">
        <div class="row">            
          <div class="col-12 text-left"><p style="font-size: 20px; font-weight: bold;">? 님의 기본정보 : </p></div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">닉네임 : </p></div>
          <div class="col-12 col-md-9"><input type="text" class="form-control" name="nickName"></div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">비밀번호 : </p></div>
          <div class="col-12 col-md-9"><input type="password" class="form-control" name="password"></div>
          <div class="col-12 col-md-3 text-right"><p id="textFm" style="width: 75px;">비밀번호확인 : </p></div>
          <div class="col-12 col-md-9"><input type="password" class="form-control" name="password"></div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">휴대폰 : </p></div>
          <div class="col-12 col-md-9"><input type="text" class="form-control" name="phone"></div>
          

          <div class="col-12 col-md-3 text-right"><p id="textFm">주소 (기본) : </p></div>          
          <div class="col-12 col-md-9 text-right">
            <div class="input-group">
              <input type="text" class="form-control" name="address1">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" onclick="addressSearchBtn1();">검색</button>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">주소 상세 : </p></div>
          <div class="col-12 col-md-9"><input type="text" class="form-control" name="addressDetail1"></div>


          <div class="col-12 col-md-3 text-right"><p id="textFm">직장 : </p></div>
          <div class="col-12 col-md-9 text-right">
            <div class="input-group">
              <input type="text" class="form-control" name="address2">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" onclick="addressSearchBtn2();">검색</button>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">직장 상세 : </p></div>
          <div class="col-12 col-md-9"><input type="text" class="form-control" name="addressDetail2"></div>              


          <div class="col-12 col-md-3 text-right"><p id="textFm">선택 : </p></div>
          <div class="col-12 col-md-9 text-right">
            <div class="input-group">
              <input type="text" class="form-control" name="address3">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" onclick="addressSearchBtn3();">검색</button>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-3 text-right"><p id="textFm">선택 상세 : </p></div>
          <div class="col-12 col-md-9"><input type="text" class="form-control" name="addressDetail3"></div>                                                   
        </div>
        
        <div class="col-12"><hr></div>
        
        <div class="row">
          <div class="col-12 col-md-4">
          <button type="button" class="btn btn-outline-primary btn-pill" onclick="mainMyPage();" id="Btn">마이페이지</button></div>
          <div class="col-12 col-md-4">
          <button type="button" class="btn btn-outline-primary btn-pill" onclick="memberOther();" id="Btn">부가정보</button></div>
          <div class="col-12 col-md-4">
          <button type="button" class="btn btn-outline-primary btn-pill" id="Btn">수정완료</button></div>              
        </div>            

      </div>

    </div>
  </div>

</div>

<!-- 기본정보수정 끝 -->

<c:import url="/views/common/footer.jsp" />

    <!-- 기본정보 스크립트 작성 -->
    <!--   jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js" ></script>
      <!-- lazy javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/lazy.js"></script>        
        
    <script>
      function mainMyPage() {
        location.href="myPage1.jsp";
      }
      function memberOther() {        
        location.href="${ pageContext.request.contextPath }/views/member/mTMIInsertForm.jsp";
      }    
     /*  function addressSearchBtn2() {
        var url = "mapMarker.jsp";
        var name = "지도팝업";
        var option = "width=650px, height=650px";
        window.open(url, name, option);
      } */
    </script>

    <script>
      function addressSearchBtn1() {
      // 참조 API : http://postcode.map.daum.net/guide
          new daum.Postcode({
              oncomplete: function(data) {
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
                  if(data.userSelectedType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  $('[name=address1]').val(fullAddr);
                  $('[name=addressDetail1]').val(data.zonecode); //5자리 새우편번호 사용

                  // 커서를 상세주소 필드로 이동한다.
                  $('[name=addressDetail1]').focus();
              }
          }).open();
      };
      
      function addressSearchBtn2() {
          // 참조 API : http://postcode.map.daum.net/guide
              new daum.Postcode({
                  oncomplete: function(data) {
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
                      if(data.userSelectedType === 'R'){
                          //법정동명이 있을 경우 추가한다.
                          if(data.bname !== ''){
                              extraAddr += data.bname;
                          }
                          // 건물명이 있을 경우 추가한다.
                          if(data.buildingName !== ''){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                          fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      $('[name=address2]').val(fullAddr);
                      $('[name=addressDetail2]').val(data.zonecode); //5자리 새우편번호 사용

                      // 커서를 상세주소 필드로 이동한다.
                      $('[name=addressDetail2]').focus();
                  }
              }).open();
          };
      
      function addressSearchBtn3() {
          // 참조 API : http://postcode.map.daum.net/guide
              new daum.Postcode({
                  oncomplete: function(data) {
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
                      if(data.userSelectedType === 'R'){
                          //법정동명이 있을 경우 추가한다.
                          if(data.bname !== ''){
                              extraAddr += data.bname;
                          }
                          // 건물명이 있을 경우 추가한다.
                          if(data.buildingName !== ''){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                          fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      $('[name=address3]').val(fullAddr);
                      $('[name=addressDetail3]').val(data.zonecode); //5자리 새우편번호 사용

                      // 커서를 상세주소 필드로 이동한다.
                      $('[name=addressDetail3]').focus();
                  }
              }).open();
          };
  </script>

  

