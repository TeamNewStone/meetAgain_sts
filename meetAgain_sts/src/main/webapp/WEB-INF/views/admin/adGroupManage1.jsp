<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/adminHeader.jsp" />
<div class="rows">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10 content">
			<br>
			<button type="button" class="btn btn-secondary btn-pill"
			onclick="location.href='/meetAgain/views/admin/adGroupManage1.jsp'">진행 중인 모임</button>
			<button type="button" class="btn btn-outline-secondary btn-pill"
			onclick="location.href='/meetAgain/views/admin/adGroupManage2.jsp'">종료
				된 모임</button>
			<div class="rows">
				<div class="row">
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid"
										src="../../resources/img/mountainGangster1.jpg"
										style="width: 100%; display: block;margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">camping</span>
									<h5 class="card-title">캠핑모임1</h5>
									<p class="card-text">초빙강사 밥굽남...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid"
										src="../../resources/img/mountainGangster2.jpg"
										style="width: 100%; display: block;margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">camping</span>
									<h5 class="card-title">캠핑모임2</h5>
									<p class="card-text">분반입니다...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid"
										src="../../resources/img/mountainGangster3.jpg"
										style="width: 100%;display: block;margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">cook</span>
									<h5 class="card-title">굽남 요리교실</h5>
									<p class="card-text">야외에서 할겁니다...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid"
										src="../../resources/img/mountainGangster4.jpg"
										style="width: 100%; display: block;margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">drink</span>
									<h5 class="card-title">야유회</h5>
									<p class="card-text">밖에서 할겁니다...</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</div>
</div>
<c:import url="/views/common/adminFooter.jsp"/>