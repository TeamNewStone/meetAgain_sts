<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />
<br />
<br />
<br />
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="content">
				<div class="read-top">
					<div id="title" class="text-left">
						<label>제목 : &nbsp;</label> <input type="text" class="form-control" style="width:400px; display:inline"/>
					</div>
				</div>
				<div class="read-bt">
					<textarea name="content" cols="135" rows="15" style="resize:none;"></textarea>
				</div>
			</div>
		</div>
	</div>
	<br />
	<div id="noticeBtn">
			<!-- 수정하기 버튼은 admin만 보이게! -->
			<button type="button" class="btn btn-outline-secondary">작성완료</button>
			<button type="button" class="btn btn-secondary" onclick="goNotice();">돌아가기</button>
	</div>
</div>
	<br />
	<br />
	<br />
	<br />
	<br />
<c:import url="/views/common/footer.jsp" />