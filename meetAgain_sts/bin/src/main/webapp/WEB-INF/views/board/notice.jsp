<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="container" style="taxt-align: center;">
	<div class="intro">
		<div class="row">
			<div class="col-12">
				<h1>공지사항</h1>
				<br />
				
				<table id="noticeTable" class=" table table-hover">
					<thead style="background-color:#122b5f;color:white;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					</thead>
					<c:if test="${list ne null }">
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.BId}">
						<td>${b.BId}</td>
						<td>${b.BTitle}</td>
						<td>${b.nickName}</td>
						<td>${b.BDate}</td>
						<td>${b.BRate }</td>
					</tr>
					</c:forEach>
					</c:if>
				</table>


			</div>
		</div>
		<!-- 작성하기 버튼은 admin만 보이게! -->
		<div id="noticeBtn">
			<button type="button" class="btn btn-outline-secondary" onclick="noticeInsert();">작성하기</button>
		</div>
	</div>
</div>
				<c:out value="${pageBar}" escapeXml="false"/>		
<!-- <div style="width: 10%; margin: 0 auto; text-align: center;">
	<ul class="pagination">
		<li class="page-item disabled"><a class="page-link" href="#a"><i
				class="fas fa-long-arrow-alt-left"></i></a></li>
		<li class="page-item active"><a class="page-link" href="#a">1</a>
		</li>
		<li class="page-item"><a class="page-link" href="#a">2</a></li>
		<li class="page-item"><a class="page-link" href="#a">3</a></li>
		<li class="page-item"><a class="page-link" href="#a"><i
				class="fas fa-long-arrow-alt-right"></i></a></li>
	</ul>
</div> -->
<!-- 임시 : 데이터 삽입 후 삭제! -->
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<script>
	$(function() {
		$("tr[id]").click(function() {
			var bId = $(this).attr("id");
			//location.href="${ pageContext.request.contextPath }/views/board/noticeDetail.do?noticeNo=" + noticeNo;
			location.href = "${pageContext.request.contextPath}/board/noticeDetail.do?bId="+bId;

		}).mouseenter(function() {
			$(this).parent().css({
				"cursor" : "pointer"
			});

		})
	});
	
	function noticeInsert(){
		location.href="${pageContext.request.contextPath}/board/noticeInsert.do";
	}
</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />
