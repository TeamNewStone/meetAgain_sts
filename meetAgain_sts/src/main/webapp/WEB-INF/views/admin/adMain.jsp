<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/adminHeader.jsp" />
<br>
<br />
<br />
<br />
<div class="container">
	<div class="row text-center">
		<div class="col-sm-12 col-md-12 col-lg-6">
			<h4 style="display: inline;">7월 첫째주 모임이 제일 많이 생성된 지역</h4>
			<!-- button that opens the modal -->
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#exampleModal">Edit</button>

			<!-- the modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">차트 수정</h5>
						</div>
						<div class="modal-body">
							<p class="text-left">카테고리</p>
							<div class="form-group">
								<select class="custom-select">
									<option selected>-- 선택 --</option>
									<option value="1">이 달 가장 모임이 많이 생성된 지역</option>
									<option value="2">10대에게 인기 있는 모임</option>
									<option value="3">20대에게 인기 있는 모임</option>
								</select>
							</div>

							<p class="text-left">그래프</p>
							<div class="form-group">
								<select class="custom-select">
									<option selected>-- 선택 --</option>
									<option value="1">원형 그래프</option>
									<option value="2">막대 그래프</option>
									<option value="3">Three</option>
								</select>
							</div>
							<p class="text-left">타이틀</p>
							<div class="form-group">
								<input type="text" class="form-control" id="chartTitle">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success">완료</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal 끝 -->
			<div id="piechart" style="width: 100%; height: 500px;"></div>
		</div>
		<div class="col-sm-12 col-md-12 col-lg-6">
			<h4 style="display: inline;">7월 첫째주 모임이 제일 많이 생성된 지역</h4>

			<!-- button that opens the modal -->
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#exampleModal">Edit</button>

			<!-- the modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">차트 수정</h5>
						</div>
						<div class="modal-body">
							<p class="text-left">카테고리</p>
							<div class="form-group">
								<select class="custom-select">
									<option selected>-- 선택 --</option>
									<option value="1">이 달 가장 모임이 많이 생성된 지역</option>
									<option value="2">10대에게 인기 있는 모임</option>
									<option value="3">20대에게 인기 있는 모임</option>
								</select>
							</div>

							<p class="text-left">그래프</p>
							<div class="form-group">
								<select class="custom-select">
									<option selected>-- 선택 --</option>
									<option value="1">원형 그래프</option>
									<option value="2">막대 그래프</option>
									<option value="3">Three</option>
								</select>
							</div>
							<p class="text-left">타이틀</p>
							<div class="form-group">
								<input type="text" class="form-control" id="chartTitle">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success">완료</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal 끝 -->

			<div id="curve_chart" style="width: 100%; height: 500px"></div>
		</div>
	</div>
</div>

<script>
	$(function(){
		console.log($(window).width());
	})
</script>
</body>
</html>







<%-- <c:import url="/views/common/adminFooter.jsp" /> --%>