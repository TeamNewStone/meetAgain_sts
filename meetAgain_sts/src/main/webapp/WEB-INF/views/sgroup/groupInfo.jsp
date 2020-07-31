<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<div class="intro">
		<div class="col-12">
			<div class="content">
				<div style="border-bottom:1px solid black">
					<p style="font-size:1.2em">모임 상세보기</p>
				</div>
				<div style="width: 50%; margin: 0 auto;">

				<svg width="1em" height="4em" viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:50px">
				  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M10.648 7.646a.5.5 0 0 1 .577-.093L15.002 9.5V13h-14v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
				  <path fill-rule="evenodd" d="M4.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<span style="font-size: smaller;">모임 대표 이미지</span>
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
				
				
				<table>
					<tr>
						<th>모임 타이틀</th>
						<td >${sgroup.getGTitle() }</td>
					</tr>
				
				</table>
				
				
				
				<div class="form-group">
				<p> 모임 타이틀 </p>
				<label>${sgroup.GTitle}</label>
				</div>

				<div class="form-group">
				<p> * 모임 장소 </p>
				<label>${sgroup.GPlace}</label>
				</div>
				
				<div class="form-group">
				<p style="margin-bottom:-1px"> * 모임 장소 선택 </p>
				<input type="text" class="form-control2" id="zipCode1" name="zipCode"
				       placeholder="우편번호" style="width: 150px;" required readonly >
				<button type="button" class="btn btn-secondary mb-2" onclick="addrSearch1();">검색</button>
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
				function test33(X, Y, userX, userY){
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
					
					test33(X, Y, userX, userY);
									
				});

			</script>
				<p>모임 연령대</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck1" name="limitGroup" value="10대">
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
					<button type="submit" class="btn btn-secondary">작성완료</button>
				</div>
				</div>
			</div>
			</div>
		</div>
	</div>



<c:import url="/WEB-INF/views/common/footer.jsp" />