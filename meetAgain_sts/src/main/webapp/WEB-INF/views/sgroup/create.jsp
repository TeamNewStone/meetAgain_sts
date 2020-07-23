<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />



<div class="container">
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
			<img src="../../resources/img/mamekim.jpg"
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


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../../resources/vendor/popper/popper.min.js"></script>
	<script src="../../resources/vendor/bootstrap/bootstrap.min.js"></script>

	<!-- optional plugins -->
	<script src="../../resources/vendor/nouislider/js/nouislider.min.js"></script>

	<!--   lazy javascript -->
	<script src="../../resources/js/lazy.js"></script>
</div>
<c:import url="/views/common/footer.jsp" />
