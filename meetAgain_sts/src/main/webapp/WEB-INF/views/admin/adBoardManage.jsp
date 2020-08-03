<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp"/>
<script>
$('.nav-item').addClass('canSee').removeClass('cantSee');
</script>

        <div class="col-md-8 offset-md-2 content">
          <h2>게시글 관리</h2>

<div class="component">
<table class="table" style="text-align:center;margin:auto; width:100%;">
<colgroup>
<col width="5%"/>
<col width="20%"/>
<col width="30%"/>
<col width="15%"/>
<col width="15%"/>
<col width="15%"/>
</colgroup>
<thead>
<tr>
	<th>No.</th>
	<th>모임명</th>
	<th>게시글 제목</th>
	<th>신고 사유</th>
	<th>신고자</th>
	<th>상태</th>
</tr>
</thead>
<tbody>
<c:if test="${!empty list}">
<c:forEach items="${list }" var="r">
<tr id="${r.rcId }">
	<input type="hidden" id="rcId" value="${r.rcId }" />
	<td>${ r.rcId }</td>
	<td>${ r.GTitle }</td>
	<td>${ r.gbTitle }</td>
	<td>${ r.rcInfo }</td>
	<td>${ r.nickName }</td>
	<input type="hidden" id="stmt" value="${r.stmt }" />
	<td>${ r.stmt }</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty list}">
<tr>
	<td colspan="6">신고 내역이 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
</div>

<script>
$(function(){
		$("tr[id]").mouseenter(function(){
			if($(this).children().eq(6).val() == 'N'){
				
			$(this).css({"background":"#cedced", "cursor":"pointer"});
			}
		
		}).mouseout(function(){
			
			$(this).css({"background":"white"});
			
		}).click(function(){
			if($(this).children().eq(6).val() == 'N'){
			var rcId = $('#rcId').val();
			location.href="${pageContext.request.contextPath}/admin/adBoardDetail.do?rcId="+rcId;
			}
		});
		
	});


</script>

</div>


<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>