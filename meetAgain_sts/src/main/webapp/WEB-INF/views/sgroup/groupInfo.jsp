<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />




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
<div class="rows">
	<div class="col-md-10 offset-md-1">
		<div class="component">
			<div class="card">
				<div class="row"></div>
				<div class="row">
					<img src="../../resources/img/mamekim.jpg"
						style="width: 40%; display: block; margin: 0px auto;">
				</div>
				<div class="card-body">
					<div class="row">
						<span class="badge badge-secondary mb-2"
							style="display: block; margin: 0px auto;">excercise</span>
					</div>
					<div class="row">
						<h4 class="card-title" style="display: block; margin: 0px auto;">송파구
							팔굽치 단련 모임</h4>
						<br /> <br /> <br />
					</div>
					<div class="rows">
						<div class="row margin-top: 10px;">
							<div class="col-md-3 text-center"></div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">송파구</div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">지역</div>
							<div class="col-md-3 text-center"></div>
						</div>
						<div class="row margin-top: 10px;">
							<div class="col-md-3 text-center"></div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">모임
								종류</div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">운동</div>
							<div class="col-md-3 text-center"></div>
						</div>
						<div class="row margin-top: 10px;">
							<div class="col-md-3 text-center"></div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">단기/정기</div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">단기</div>
							<div class="col-md-3 text-center"></div>
						</div>
						<div class="row margin-top: 10px;">
							<div class="col-md-3 text-center"></div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">송파구</div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">지역</div>
							<div class="col-md-3 text-center"></div>
						</div>
						<div class="row margin-top: 10px;">
							<div class="col-md-3 text-center"></div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">인원
								수</div>
							<div class="col-md-3 text-center" style="padding-top: 10px;">1</div>
							<div class="col-md-3 text-center"></div>
						</div>
						<div class="form-group ">
							<div class="rows">
								<div class="row">
									<div class="custom-control custom-radio col-4"></div>
									<div class="custom-control custom-radio col-1">
										<input type="radio" id="whatever" name="gender"
											class="custom-control-input" checked disabled> <label
											class="custom-control-label" for="whatever">성별 무관</label>
									</div>
									<div class="custom-control custom-radio col-1">
										<input type="radio" id="man" name="customRadio2"
											class="custom-control-input" disabled> <label
											class="custom-control-label" for="man">남자</label>
									</div>
									<div class="custom-control custom-radio col-1">
										<input type="radio" id="woman" name="customRadio2"
											class="custom-control-input" disabled> <label
											class="custom-control-label" for="woman">여자</label>
									</div>
									<div class="custom-control custom-radio col-5"></div>
								</div>
								<div class="row">
									<div class="custom-control custom-checkbox col-4 "></div>
									<div class="custom-control custom-checkbox col-1 ">
										<input type="checkbox" class="custom-control-input" id="teens"
											name="ages" checked disabled> <label
											class="custom-control-label" for="teens">10대</label>
									</div>
									<div class="custom-control custom-checkbox col-1">
										<input type="checkbox" class="custom-control-input"
											id="2teens" name="ages" disabled> <label
											class="custom-control-label" for="2teens">20대</label>
									</div>
									<div class="custom-control custom-checkbox col-1">
										<input type="checkbox" class="custom-control-input"
											id="3teens" name="ages" disabled> <label
											class="custom-control-label" for="3teens">30대</label>
									</div>
									<div class="custom-control custom-checkbox col-1">
										<input type="checkbox" class="custom-control-input"
											id="4teens" name="ages" disabled> <label
											class="custom-control-label" for="4teens">40대</label>
									</div>
									<div class="custom-control custom-checkbox col-1">
										<input type="checkbox" class="custom-control-input"
											id="5teens" name="ages" disabled> <label
											class="custom-control-label" for="5teens">50대</label>
									</div>
									<div class="custom-control custom-checkbox col-3 "></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="rows">
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<br><br><br><br><p>날짜 API 넣을 곳</p><br><br><br><br>
							<div class="col-4"></div>
						</div>
					</div>
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
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
		<div class="modal fade" id="glassAnimals" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Here is a
							modal</h5>
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
		<footer class="footer-1 bg-light text-dark">
			<div class="container">
				<div
					class="d-flex flex-column flex-md-row justify-content-between align-items-center">
					<div class="links">
						<ul
							class="footer-menu list-unstyled d-flex flex-row text-center text-md-left">
							<li><a href="https://bootstrapbay.com/" target="_blank">Store</a></li>
							<li><a href="https://bootstrapbay.com/about" target="_blank">About
									Us</a></li>
							<li><a href="https://bootstrapbay.com/blog/" target="_blank">Blog</a></li>
							<li><a href="https://bootstrapbay.com/terms" target="_blank">Terms
									&amp; Conditions</a></li>
						</ul>
					</div>
					<div class="social mt-4 mt-md-0">
						<a class="twitter btn btn-outline-primary btn-icon"
							href="https://twitter.com/bootstrapbay" target="_blank"> <i
							class="fab fa-twitter"></i> <span class="sr-only">View our
								Twitter Profile</span>
						</a> <a class="facebook btn btn-outline-primary btn-icon"
							href="https://www.facebook.com/bootstrapbayofficial/"
							target="_blank"> <i class="fab fa-facebook"></i></a> <a
							class="github btn btn-outline-primary btn-icon"
							href="https://github.com/bootstrapbay" target="_blank"> <i
							class="fab fa-github"></i> <span class="sr-only">View our
								GitHub Profile</span>
						</a>
					</div>
				</div>
				<div class="copyright text-center">
					<hr />
					<p class="small">
						&copy; 2019, made with <span class="text-danger"><i
							class="fas fa-heart"></i></span> by BootstrapBay
					</p>
				</div>
			</div>
		</footer>


		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../../resources/vendor/jquery/jquery.min.js"></script>
		<script src="../../resources/vendor/popper/popper.min.js"></script>
		<script src="../../resources/vendor/bootstrap/bootstrap.min.js"></script>

		<!-- optional plugins -->
		<script src="../../resources/vendor/nouislider/js/nouislider.min.js"></script>

		<!--   lazy javascript -->
		<script src="../../resources/js/lazy.js"></script>
		</body>
		<c:import url="/views/common/footer.jsp" />
		</html>