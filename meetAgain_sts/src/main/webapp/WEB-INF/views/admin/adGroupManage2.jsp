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
			<button type="button" class="btn btn-outline-secondary btn-pill"
				onclick="location.href='/meetAgain/views/admin/adGroupManage1.jsp'">진행
				중인 모임</button>
			<button type="button" class="btn btn-secondary btn-pill"
				onclick="location.href='/meetAgain/views/admin/adGroupManage2.jsp'">종료
				된 모임</button>
			<br>
			<div class="rows">
				<div class="row">
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid" src="../../resources/img/rebuild.png"
										style="width: 100%; display: block; margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">Hobby</span>
									<h5 class="card-title">송파구 코딩 설명회</h5>
									<p class="card-text">간단한 설명...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid" src="../../resources/img/rebuild.png"
										style="width: 100%; display: block; margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">Hobby</span>
									<h5 class="card-title">송파구 코딩 설명회</h5>
									<p class="card-text">간단한 설명...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid" src="../../resources/img/rebuild.png"
										style="width: 100%; display: block; margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">Hobby</span>
									<h5 class="card-title">송파구 코딩 설명회</h5>
									<p class="card-text">간단한 설명...</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="component">
							<div class="card">
								<div class="card-header">
									<img class="img-fluid" src="../../resources/img/rebuild.png"
										style="width: 100%; display: block; margin: 0px auto; width: 271px; height: 117px;">
								</div>
								<div class="card-body" style="height: 100%;">
									<span class="badge badge-secondary mb-2">Hobby</span>
									<h5 class="card-title">송파구 코딩 설명회</h5>
									<p class="card-text">간단한 설명...</p>
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