<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<%-- <div class="container">
	<div class="row">
		<div class="col-md-3">
			<h2>모임 만들기</h2>
			<div class="dropdown"></div>

		</div>
		<div class="col-md-6">
			<div class="mx-auto">&nbsp;</div>
		</div>
	</div>
	<div class="col-md-3"></div>
	<div class="card">
		<div class="row"></div>
		<div class="row">
			<img src="${pageContext.request.contextPath }/resources/img/mamekim.jpg"
				style="width: 450px; display: block; margin: 0px auto; height: 550px;">
		</div>
		<div class="card-body">
			<div class="row">
				<span class="badge badge-secondary mb-2"
					style="display: block; margin: 0px auto;">excercise</span>
			</div>
			<div class="row">
				<h4 class="card-title" style="display: block; margin: 0px auto;">송파구
					팔굽치 단련 모임</h4>
				<br>
				<br>
				<br>
			</div>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="rows">
						<div class="row margin-top: 10px;">
							<div class="col-md-6 text-center" style="padding-top: 10px;">지역</div>
							<div class="col-md-6">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">사는 지역</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="#">주소</a> <a
											class="dropdown-item" href="#">주소</a> <a
											class="dropdown-item" href="#">주소</a>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-6 text-center" style="padding-top: 10px;">모임
								종류</div>
							<div class="col-md-6">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle "
										type="button" id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										style="padding-left: 32px; padding-right: 32px;">운동</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="#">운동</a> <a
											class="dropdown-item" href="#">악기</a> <a
											class="dropdown-item" href="#">공부</a>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-6 text-center" style="margin-top: 10px;">단기/장기</div>
							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle " type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"
									style="padding-left: 32px; padding-right: 32px; margin-left: 15px;">단기</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#">장기</a> <a
										class="dropdown-item" href="#">단기</a>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-6 text-center" style="margin-top: 5px;">회비
								여부</div>
							<div class="col-md-6" style="padding-left: 0px;">
								<input type="checkbox" name="joinFee" value="fee" checked /> 금액
								: <input type="text" name="" value="" style="width: 78px;" />
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-6 text-center">인원 수</div>
							<div class="col-md-6" style="padding-left: 50px;">
								<select class="headCount" style="width: 49px;">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="form-group ">
				<div class="rows">
					<div class="row">
						<div class="custom-control custom-radio col-4"></div>
						<div class="custom-control custom-radio col-1">
							<input type="radio" id="whatever" name="customRadio2"
								class="custom-control-input" checked> <label
								class="custom-control-label" for="whatever">성별 무관</label>
						</div>
						<div class="custom-control custom-radio col-1">
							<input type="radio" id="man" name="customRadio2"
								class="custom-control-input"> <label
								class="custom-control-label" for="man">남자</label>
						</div>
						<div class="custom-control custom-radio col-1">
							<input type="radio" id="woman" name="customRadio2"
								class="custom-control-input"> <label
								class="custom-control-label" for="woman">여자</label>
						</div>
						<div class="custom-control custom-radio col-5"></div>
					</div>
					<div class="row">
						<div class="custom-control custom-checkbox col-4 "></div>
						<div class="custom-control custom-checkbox col-1 ">
							<input type="checkbox" class="custom-control-input" id="teens"
								name="ages" checked> <label class="custom-control-label"
								for="teens">10대</label>
						</div>
						<div class="custom-control custom-checkbox col-1">
							<input type="checkbox" class="custom-control-input" id="2teens"
								name="ages"> <label class="custom-control-label"
								for="2teens">20대</label>
						</div>
						<div class="custom-control custom-checkbox col-1">
							<input type="checkbox" class="custom-control-input" id="3teens"
								name="ages"> <label class="custom-control-label"
								for="3teens">30대</label>
						</div>
						<div class="custom-control custom-checkbox col-1">
							<input type="checkbox" class="custom-control-input" id="4teens"
								name="ages"> <label class="custom-control-label"
								for="4teens">40대</label>
						</div>
						<div class="custom-control custom-checkbox col-1">
							<input type="checkbox" class="custom-control-input" id="5teens"
								name="ages"> <label class="custom-control-label"
								for="5teens">50대</label>
						</div>
						<div class="custom-control custom-checkbox col-3 "></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<div class="card">
						<div class="card-body">날짜 API 넣을 곳</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>

			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<div class="card">
						<div class="card-body">강해지고 싶은자...</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
	<br> <br> <br> <br> <br> <br> <br> <br>
	<br> <br>
	<div class="modal fade" id="glassAnimals" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Here is a modal</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Modals are a simple way to display
					information upon request. They let you easily add another layer
					upon your site and give you the possibility to create popups.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-success">View More</button>
				</div>
			</div>
		</div>
	</div> 
	</div> --%>

<div class="container">
	<div class="intro">
		<div class="col-12">
			<div class="content">
				<div style="border-bottom:1px solid black">
					<p style="font-size:1.2em">모임 생성하기</p>
				</div>
				<svg width="1em" height="4em" viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M10.648 7.646a.5.5 0 0 1 .577-.093L15.002 9.5V13h-14v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
				  <path fill-rule="evenodd" d="M4.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<span style="font-size: smaller;">모임 대표 이미지</span>
				
				
			<div class="row">
				<div class="sgroupPicture" id="imgArea" style="display:inline">
					<img src="${pageContext.request.contextPath}/resources/img/dog-3.jpg" style="width:400px; height:300px;" id="sampleImg"><br /><br>
					<div style="width:400px; text-align:center;">
						<button type="button" class="btn btn-secondary" id="mimgBtn" style="background:#ffb5b6; border:#ffb5b6;">사진 첨부</button>
					</div>
				<input type="file" name="sgroupImg" id="profileImgBtn" style="display: none;" onchange="loadImg(this);" />
				</div> 

			<div style="display : inline; margin-left:10%">
				<div class="form-group">
				<span> 지역 선택 : </span>
				  <select class="custom-select" style="display:inline">
				    <option selected>--내가 설정한 주소--</option>
				    <option value="1">주소1</option>
				    <option value="2">주소2</option>
				    <option value="3">주소3</option>
				  </select>
				</div>
				
				<div class="form-group">
				<span> 모임 카테고리 : </span>
				  <select class="custom-select" style="display:inline">
				    <option selected>--카테고리--</option>
				    <option value="1">주소1</option>
				    <option value="2">주소2</option>
				    <option value="3">주소3</option>
				  </select>
				</div>
				
				<div class="form-group">
				<span> 기간  </span>
				  <select class="custom-select" style="display:inline">
				    <option selected>--기간--</option>
				    <option value="1">단기</option>
				    <option value="2">장기</option>
				  </select>
				</div>
				
				<div class="form-group">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" id="customSwitch1" checked>
				    <label class="custom-control-label" for="customSwitch1">회비여부</label>
				  </div>
				  <input type="number" class="form-control" placeholder="회비 금액을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <span> 인원수 </span>
				  <input type="number" class="form-control" id="maxNum" placeholder="인원은 최소 2명 / 최대 30명 입니다.">
				</div>
				
				<p>성별 선택</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline">
				    <input type="radio" id="customRadio1" name="gender" class="custom-control-input" checked>
				    <label class="custom-control-label" for="customRadio1">성별무관</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio2" name="gender" class="custom-control-input">
				    <label class="custom-control-label" for="customRadio2">남</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio3" name="gender" class="custom-control-input">
				    <label class="custom-control-label" for="customRadio3">여</label>
				  </div>
				</div>
				
				<p>모임 연령대</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck1">
				    <label class="custom-control-label" for="customCheck1">10대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck2">
				    <label class="custom-control-label" for="customCheck2">20대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck2">
				    <label class="custom-control-label" for="customCheck3">30대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck4">
				    <label class="custom-control-label" for="customCheck4">40대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck5">
				    <label class="custom-control-label" for="customCheck5">50대</label>
				  </div>
				</div>
				
				<p>공개 여부</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" id="private">
				    <label class="custom-control-label" for="private">비공개</label>
				  </div>
				</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script>
	$('#imgArea').on('click', function() {
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
	
	$('#maxNum').on('keyup', function() {
	    if (/\D/.test(this.value)) {
	        this.value = this.value.replace(/\D/g, '')
	        alert('숫자만 입력가능합니다.');
	    } else {
			  if (this.value > 30) {
			      this.value = null;
			      alert('모임 인원은 30명까지 가능합니다.');
			  } else if (this.value < 2){
				  this.value = null;
				  alert('모임 최소 인원은 2명부터 가능합니다.');
			  }
	    }
	});
	
	
</script>







<c:import url="/WEB-INF/views/common/footer.jsp" />
