<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp"/>

<div class="col-md-8 offset-md-2 content">
  <h2>게시글 관리</h2>

<div class="component" style="text-align:center;">
	<table id="noticeTable" class=" table table-hover">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="15%"/>
		</colgroup>
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
	<c:out value="${pageBar}" escapeXml="false"/>
	<div id="noticeBtn">
		<button type="button" class="btn btn-outline-secondary" onclick="noticeInsert();">작성하기</button>
	</div>
</div>
</div>


<script>
$(function() {
	$("tr[id]").click(function() {
		var bId = $(this).attr("id");
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

<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>