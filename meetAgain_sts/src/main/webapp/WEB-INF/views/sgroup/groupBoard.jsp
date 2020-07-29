<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />
	<!--===================== 소모임 페이지의 바디 부분 =====================-->

	<div id="tableArea">
		<table class="table" align="center" id="listArea" style="width: 100%;">
			<tr>
				<th width="13%">글번호</th>
				<th width="44%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th> 
				<th width="13%">조회수</th>
			</tr>
			<c:if test="${list ne null }">
			<c:forEach items="${list}" var="gb">
				<tr id="${gb.gbId}">
					<td>${gb.gbId}</td>
					<td>${gb.gbTitle}</td>
					<td>${gb.nickName}</td> <!-- 해결 -->
					<td>${gb.gbDate}</td>
					<td>${gb.gbRate}</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
	</div>

	<div style="width: 33%; float: left;">
		<button class="btn btn-secondary" onclick="gboardInsert()">작성하기</button>
	</div>

	<div style="width: 34%; float: left;">
		<%-- 페이지 처리 --%>
		<ul class="pagination pagination-sm" align="center">
			<li class="page-item disabled"><a class="page-link" href="#a"><i
					class="fas fa-long-arrow-alt-left"></i></a></li>
			<li class="page-item active"><a class="page-link" href="#a">1</a>
			</li>
			<li class="page-item"><a class="page-link" href="#a">2</a></li>
			<li class="page-item"><a class="page-link" href="#a">3</a></li>
			<li class="page-item"><a class="page-link" href="#a"><i
					class="fas fa-long-arrow-alt-right"></i></a></li>
		</ul>
	</div>

	<div class="searchArea" style="width: 33%; float: left;">
		<div align="right">
			<select id="searchCondition" name="searchCondition">
				<option>--</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="search">
			<button class="btn btn-secondary btn-sm" type="submit">검색하기</button>
		</div>
	</div>
	<br /> <br /> <br /> <br />
</div>

<script>
// 	$(function() {
// 		$("#group-boardbtn").attr('class', 'btn btn-secondary');
// 		$("tr[id]")
// 				.click(
// 						function() {
// 							var gbId = $(this).attr("id");
// 							location.href = "${pageContext.request.contextPath}/sgroup/groupDetail.do?gbId="
// 									+ gbId;

// 						}).mouseenter(function() {
// 					$(this).parent().css({
// 						"cursor" : "pointer"
// 					});

// 				})
// 	});

	function gboardInsert() {
		location.href = "${pageContext.request.contextPath}/sgroup/gboardInsert.do";
	}
</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />