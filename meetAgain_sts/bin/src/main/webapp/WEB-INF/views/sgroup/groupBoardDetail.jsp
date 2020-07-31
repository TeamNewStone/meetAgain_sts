<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br>
<br>
<br>
<br>
<div class="container" style="taxt-align: center;">
	<div class="row">
		<div class="col-12">
			<div class="content">
				<div class="read-top">
					<div class="subject">${Gboard.gbTitle}</div>
					<div id="noticeDate">${Gboard.gbDate}</div>
				</div>
				<div class="read-bt">
					<input type="hidden" id="gbContent" value="${Gboard.gbContent}" />
					${Gboard.gbContent}
				</div>
			</div>
		</div>
	</div>
	<br>
	<div id="GboardBtn">
		<!-- 수정하기 버튼은 admin만 보이게! -->
		<button type="button" class="btn btn-danger"
			onclick="goDelete();">삭제하기</button>
		<button type="button" class="btn btn-outline-secondary"
			onclick="goUpdate();">수정하기</button>
		<button type="button" class="btn btn-secondary" onclick="goGboard();">돌아가기</button>
	</div>
</div>
<script>
	function goGboard() {
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoard.do"
	}
	function goUpdate() {
		var gbId = ${Gboard.gbId};
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardUpdate.do?gbId="+ gbId;
	}
	function goDelete() {
		var gbId = ${Gboard.gbId};
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardDelete.do?gbId="+ gbId;
	}
</script>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<c:import url="/WEB-INF/views/common/footer.jsp" />