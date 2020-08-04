<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp"/>


        <div class="col-md-8 offset-md-2 content">
        
          <h2>회원 관리</h2>
<span>
<form action="adMemberManageOrder.do">
  <select class="custom-select" style="display:inline; width:10%;" id="orderBy" name="orderBy">
    <option value="userName" selected>이름</option>
    <option value="enrollDate">가입일자</option>
    <option value="mLevel">회원등급</option>
    <option value="warn_Cnt">경고횟수</option>
  </select>
    <select class="custom-select" style="display:inline; width:10%;" id="howOrder" name="howOrder">
    <option value="asc" selected>오름차순</option>
    <option value="desc">내림차순</option>
  </select>
  <button type="submit" id="mSearch" style="border:0px;background-color:white;" onclick="search();"><img src="${ pageContext.request.contextPath }/resources/img/search.png" alt="search"></button>
</form>
</span>
<div class="component">
<table class="table" style="text-align:center;margin:auto; width:100%;">
<colgroup>
<col width="15%"/>
<col width="10%"/>
<col width="20%"/>
<col width="20%"/>
<col width="15%"/>
<col width="10%"/>
</colgroup>
<thead>
<tr>
	<th>이름</th>
	<th>성별</th>
	<th>생년월일</th>
	<th>가입일자</th>
	<th>회원등급</th>
	<th>경고횟수</th>
</tr>
</thead>
<tbody>
<c:if test="${!empty list}">
<c:forEach items="${list }" var="m">
<tr id="${m.userId }">
	<td>${ m.userName }</td>
	<td>${ m.gender }</td>
	<td>${ m.birthday }</td>
	<td>${ m.enrollDate }</td>
	<c:if test="${ m.MLevel == 0 }">
	<td>일반 등급</td>
	</c:if>
	<c:if test="${ m.MLevel == 1 }">
	<td>프리미엄 등급</td>
	</c:if>
	<td>${ m.warn_Cnt }</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty list }">
<tr>
	<td colspan="6">아직 다시만나 이용자가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
</div>
<c:out value="${pageBar}" escapeXml="false"/>
</div>
<script>
$(function(){
		
		$("tr[id]").mouseenter(function(){
			$(this).css({"background":"#cedced", "cursor":"pointer"});
		
		}).mouseout(function(){
			
			$(this).css({"background":"white"});
		
		}).click(function(){
			var userId=$(this).attr("id");
			location.href="${ pageContext.request.contextPath }/admin/adMemberDetail.do?userId="+userId;

		});
	});

function search(){
	// 정렬
	/* location.href="${pageContext.request.contextPath}/admin/adMemberManageOrder.do"; */
	
}
</script>



<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>