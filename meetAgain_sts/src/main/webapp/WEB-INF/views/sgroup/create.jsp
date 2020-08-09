<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:import url="/WEB-INF/views/common/header.jsp" />
<form action="${ pageContext.request.contextPath }/sgroup/sgroupCreateEnd.do" method="post" enctype="multipart/form-data" onsubmit="return validate(this);">
<div class="container">
	<div class="intro">
		<div class="col-12">
			<div class="content">
				<div style="border-bottom:1px solid black">
					<p style="font-size:1.2em">모임 생성하기</p>
				</div>
				<div style="margin-left: 5%;">
				<svg width="1em" height="4em" viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M10.648 7.646a.5.5 0 0 1 .577-.093L15.002 9.5V13h-14v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
				  <path fill-rule="evenodd" d="M4.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<span style="font-size: smaller;">모임 대표 이미지</span>
				
				
			<div class="row">
			<input type="hidden" name="userId" value="${member.userId }"/>
			<input type="hidden" id="birthday" name="birthday" value="${ member.birthday }" />
			
<!-- 			<script>
				$('#birthday').val().substr(2,2);
			</script> -->
				<div class="sgroupPicture" id="imgArea" style="display:inline; margin-top:-15px;width:400px; height:350px;" >
					<img src="${pageContext.request.contextPath}/resources/img/dog-3.jpg" style="width:400px; height:300px;" id="sampleImg"><br /><br>
					<div style="width:400px; text-align:center;">
						<button type="button" class="btn btn-secondary" id="mimgBtn" style="background:#ffb5b6; border:#ffb5b6;">사진 첨부</button>
					</div>
				<input type="file" name="sgroupImg" id="groupImgBtn" style="display: none;" onchange="loadImg(this);" />
				</div> 
			<div style="display : inline; margin-left:10%">
			<p>* 모임 타이틀</p>
			<div class="form-group">
			  <input type="text" class="form-control" id="gTitle" name="gTitle" placeholder="모임의 타이틀을 작성해주세요." required style="margin-top:-15px">
			</div>
		
				<div class="form-group">
				<span> * 지역 선택 : </span>
				  <select class="custom-select" id="address1" style="display:inline" required>
				    <option selected>--내가 설정한 주소--</option>
				    <option value="${member.address1 }">${member.address1 }</option>
				    <c:if test="${ !empty member.address2 && member.address3}">
				    <option value="${member.address2 }">${member.address2 }</option>
				    <option value="${member.address3 }">${member.address3 }</option>
				    </c:if>
				  </select>
				</div>
				
				<div class="form-group">
				<p style="margin-bottom:-1px"> * 모임 장소 선택 </p>
				<input type="text" class="form-control2" id="zipCode1" name="zipCode"
				       placeholder="우편번호" style="width: 150px;" required readonly >
				<button type="button" class="btn btn-secondary mb-2" style="background:#132742; border : #132742;" onclick="addrSearch1();">검색</button>
				<input type="text" class="form-control" id="gPlace"
					   name="gPlace" placeholder="상세주소" required>
				</div>
				
				<div class="form-group">
				<span> * 모임 카테고리 : </span>
				  <select class="custom-select" id="cateId" name="cateId" style="display:inline">
				    <option selected>--카테고리--</option>
				    <option value="C01">운동</option>
				    <option value="C02">친목</option>
				    <option value="C03">공부</option>
				    <option value="C04">취미생활</option>
				    <option value="C05">문화생활</option>
				    <option value="C06">여행</option>
				    <option value="C07">봉사</option>
				    <option value="C08">기타</option>
				  </select>
				</div>
				
				<div class="form-group">
				<span> 기간  </span>
				  <select class="custom-select" id="gType" name="gType" style="display:inline" required>
				    <option selected>--기간--</option>
				    <option value="S">단기</option>
				    <option value="L">장기</option>
				  </select>
				</div>
				
				<p>시작 날짜 </p>
				<input type="text" id="startDate" class="form-control" style="margin-top:-15px; background:white" readonly/>
				<p id="durateP" style="display:none;">종료 날짜</p>
				<input type="text" id="durate" class="form-control" style="display:none; margin-top:-15px" readonly/>
				<div id="datepicker"></div>
				<label id="noticeDurate" style="color:red; display:none;">*일반회원일 경우 모임 연장 불가</label>
				
				<script>
					
					$("#gType").on("change", function(){
						 if($(this).val()=='L'){
							 $('#durate').css('display', 'block').attr('name', 'durate');
							 $('#durateP').css('display', 'block');
							 $('#noticeDurate').css('display', 'block');
							 $('#startDate').removeAttr('name');
						 } else if($(this).val()=='S'){
							 $('#durate').css('display', 'none').removeAttr('name');
							 $('#durateP').css('display', 'none');
							 $('#noticeDurate').css('display', 'none');
							 $('#startDate').attr('name', 'durate');
						 }
					});
				</script>
				
				<div class="form-group">
				  <div class="custom-control custom-switch my-2">
				  	<input type="hidden" name="charge" id="charge" value="N"/>
				    <input type="checkbox" class="custom-control-input" id="chargeCheck" name="chargeCheck" value="N">
				    <label class="custom-control-label" for="chargeCheck">회비여부</label>
				  </div>
				  <input type="hidden" id="gFee" name="gFee">
				  <input type="text" id="gFeeCopy" class="form-control" numberonly="true" placeholder="회비 금액을 입력해주세요." style="display:none;">
				</div>
				<script>
				$('#gFeeCopy').focusout(function(){
					var origin = $('#gFeeCopy').val();
					$('#gFee').val(origin);
					$('#gFeeCopy').val(parseInt($('#gFeeCopy').val()).toLocaleString());
					
				});
				</script>
				
				<div class="form-group">
				  <span> * 인원수 </span>
				  <input type="text" class="form-control" id="maxNum" name="maxNum" numberonly="true" placeholder="인원은 최소 2명 / 최대 30명 입니다." required>
				</div>
				
				<p>성별 선택</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline">
				    <input type="radio" id="customRadio1" name="limitGroup" value="A" class="custom-control-input" checked>
				    <label class="custom-control-label" for="customRadio1">성별무관</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio2" name="limitGroup" value="M"class="custom-control-input">
				    <label class="custom-control-label" for="customRadio2">남</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio3" name="limitGroup" value="F" class="custom-control-input">
				    <label class="custom-control-label" for="customRadio3">여</label>
				  </div>
				</div>
				<div id="map"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d68e73a49c2fc0deedbcbca59ca49574&libraries=services,clusterer,drawing"></script>
				<script>
				
				// 거리계산 함수
				function distance(X, Y, userX, userY){
					var polyline=new kakao.maps.Polyline({
						path : [
						new kakao.maps.LatLng(Y,X),
						new kakao.maps.LatLng(userY,userX)
						]
					});
					
					return Math.round(polyline.getLength());
				}
				
				var coords, userAdr;
				var X, Y, userX, userY;
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
				var map = new kakao.maps.Map(container, options);
				var geocoder = new kakao.maps.services.Geocoder();
				
				
				$('#gPlace').blur(function(){
					// 사용자가 고른 모임장소 좌표
					geocoder.addressSearch($('#gPlace').val(), function(result, status) {
					    if (status === kakao.maps.services.Status.OK) {
					        
					        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        console.log(coords);
					        
					        X = coords.getLng();
							Y = coords.getLat();
					    }
					});
					
					// 사용자가 선택한 주소 좌표
					geocoder.addressSearch($('#address1').val(), function(result, status) {
					    if (status === kakao.maps.services.Status.OK) {
					        
					        userAdr = new kakao.maps.LatLng(result[0].y, result[0].x);
					        console.log(userAdr);
					        
					        userX = userAdr.getLng();
							userY = userAdr.getLat();
					    }
					});
				
					distance(X, Y, userX, userY);									
				});
			
			</script>
				<p>모임 연령대</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck1" name="limitGroup" value="10대" >
				    <label class="custom-control-label" for="customCheck1">10대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck2" name="limitGroup" value="20대">
				    <label class="custom-control-label" for="customCheck2">20대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck3" name="limitGroup" value="30대">
				    <label class="custom-control-label" for="customCheck3">30대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck4" name="limitGroup" value="40대">
				    <label class="custom-control-label" for="customCheck4">40대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck5" name="limitGroup" value="50대">
				    <label class="custom-control-label" for="customCheck5">50대</label>
				  </div>
				</div>
				
				<!-- #private 값이 on일경우 공개 , off일 경우 비공개!! -->
				<p>공개 여부</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" id="private" value="N" style="background:#132742;">
				    <label class="custom-control-label" for="private">비공개</label>
				  </div>
				  <input type="text" id="gPwd" name="gPwd" class="form-control" numberonly="true" maxlength="4" placeholder="모임 비밀번호  4자리를 입력해주세요." style="display:none;">
				</div>
				
				<p>모임승인제</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-switch my-2">
				  	<input type="hidden" name="joinType" id="joinType" value="F" />
				    <input type="checkbox" class="custom-control-input" name="joinTypeCheck" id="joinTypeCheck">
				    <label class="custom-control-label" for="joinTypeCheck">모임 승인제</label>
				  </div>
				</div>
				
				<p> 모임 소개 </p>
				 <div class="form-group">
				    <textarea class="form-control" id="exampleFormControlTextarea1" name="gIntro" rows="5" placeholder="자유롭게 모임 소개글을 작성해주세요~!" required></textarea>
				  </div>
				<div style="width: 400px; text-align: center;">
					<button type="submit" class="btn btn-secondary" style="background:#132742; border:#132742;">작성완료</button>
				</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</div>
	</form>

<script>
// form 정규식
$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
function validate(){
	var gPwd = $("#gPwd");
	var gFeeCopy = $("#gFeeCopy");
	var charge = $("#charge").val();
	var tePrivate = $("#private").val();
	var maxNum = $('#maxNum');
	var userLevel = ${member.getMLevel()};
	if(tePrivate=='Y' && gPwd.val().trim().length<4){
		
		alert("모임 비밀번호는 4자리이어야 합니다.");
		gPwd.focus();
		return false;
		
	} else if(charge=='Y' && gFeeCopy.val().trim().length==0){
		alert("회비 금액을 입력해주세요.");
		gFeeCopy.focus();
		return false;
	} else if(maxNum.val()<2 ||maxNum.val()>30 ){
		alert("모임 인원은 최소 2명 / 최대 30명 입니다.");
		maxNum.focus();
		return false;
	} else if($("#gType").children().first().is(":selected")){
		alert("기간을 선택해주세요.");
		return false;
	} else if($("#address1").children().first().is(":selected")){
		alert("지역을 선택해주세요.");
		return false;
	} else if($("#cateId").children().first().is(":selected")){
		alert("카테고리를 선택해주세요.");
		return false;
	}  else if($('#startDate').val().length==0){
		alert("시작 날짜를 선택해주세요.");
		return false;
	} else if(distance(X, Y, userX, userY) > 10000){
		alert('선택한 주소의 10km이내의 장소를 선택해주세요.');
		return false;
	} else if ($('#gPlace').val().length==0){
		alert('모임 장소를 선택해주세요.');
		return false;
	} else if (userLevel==1){
		if ($('#durate').val().length==0){
			alert('종료날짜를 선택해주세요.');
			return false;
		}
	}
	
}
	$('#mimgBtn').on('click', function() {
		$('#groupImgBtn').click();
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
	
	
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	};
	
	
	
	$(function(){
		
		$('#chargeCheck').change(function(){
			
			if($('#chargeCheck').is(":checked")){
				$("#gFeeCopy").css('display', 'block');
				$("#charge").val('Y');
				
			} else {
				$("#gFeeCopy").css('display', 'none');
				$("#charge").val('N');
			}
		});
		
		$('#private').change(function(){
			if($('#private').is(":checked")){
				$('#gPwd').css('display', 'block');
				$("#private").val('Y');
			} else {
				$('#gPwd').css('display', 'none');
				$("#private").val('N');
			}
		});
		$('#joinTypeCheck').change(function(){
			if($('#joinTypeCheck').is(":checked")){
				
				$("#joinType").val('C');
			} else {
				$("#joinType").val('F');
			}
		});
		
		
		
		$( "#startDate" ).datepicker({ 
			dateFormat: 'yy-mm-dd' , 
			minDate: new Date()
			
		});
		$( "#durate" ).datepicker({ 
			dateFormat: 'yy-mm-dd' , 
			minDate: new Date()
			
		});
		
		$("#gType").on("change", function(){
	        console.log($(this).val());
	        var userLevel = ${member.getMLevel()};
	        console.log("니등급.." +userLevel);
	        if($(this).val()=='L' && userLevel==0){
	        	
	        	$("#startDate").on("change", function(){
	    			var year = $( "#startDate" ).val().split("-")[0];
	    			var mon = $( "#startDate" ).val().split("-")[1];
	    			var day = $( "#startDate" ).val().split("-")[2];
	    			var date = new Date(year, mon-1, day);
	    			date.setMonth(date.getMonth() + 3);
	    			
	    			date = getFormatDate(date);
	    			
	    			minDate = new Date();
	    			
	    			durate.minDate = date;
	    			console.log("endDate.minDate : " + date);
	    			$('#durate').val(durate.minDate);
	    		
	    		});
	    	
	    	} else if(userLevel==1){
	    		$('#durate').removeAttr('readonly');
	    	}
	    });
	 });
	
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
						$('#gPlace').val(fullAddr);
						// 커서를 상세주소 필드로 이동한다.
						$('#gPlace').focus();
					}
				}).open();
	};
	
</script>
<script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script> 
<script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery-ui.min.js"></script>
<c:import url="/WEB-INF/views/common/footer.jsp" />