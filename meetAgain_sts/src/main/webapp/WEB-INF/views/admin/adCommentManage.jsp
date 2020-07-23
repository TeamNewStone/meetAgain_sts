<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/adminHeader.jsp"/>
<script>
$('.nav-item').addClass('canSee').removeClass('cantSee');
</script>

        <div class="col-md-8 offset-md-2 content">
          <h2>댓글 관리</h2>

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
	<th>댓글 내용</th>
	<th>신고 회원</th>
	<th>신고 사유</th>
	<th>신고자</th>
	<th>상태</th>
</tr>
</thead>
<tbody>
<c:forEach var="i" begin="1" end="3">
<tr>
	<td>${ i }</td>
	<td>test ${ i }</td>
	<td>test ${ i }</td>
	<td>test ${ i }</td>
	<td>test ${ i }</td>
	<td>test ${ i }</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
<script>
$(function(){
		
		$(".table td").mouseenter(function(){
			$(this).parent().css({"background":"#cedced", "cursor":"pointer"});
		
		}).mouseout(function(){
			
			$(this).parent().css({"background":"white"});
		
		}).click(function(){
			location.href="/meetAgain/views/admin/adCommentDetail.jsp";
			//console.log($(this).parent().children().eq(0).text());
		
			//var nno = $(this).parent().children().eq(0).text();
			
			<%-- location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno; --%>
		});
	});


</script>




<c:import url="/views/common/adminFooter.jsp"/>