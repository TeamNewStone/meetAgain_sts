<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/adminHeader.jsp"/>


        <div class="col-md-8 offset-md-2 content">
        
          <h2>회원 관리</h2>
<span>
  <select class="custom-select" style="display:inline; width:10%;">
    <option selected>이름</option>
    <option value="1">가입일자</option>
    <option value="2">회원등급</option>
    <option value="3">경고횟수</option>
  </select>
    <select class="custom-select" style="display:inline; width:10%;">
    <option selected>오름차순</option>
    <option value="1">내림차순</option>
  </select>
  <button id="mSearch" style="border:0px;background-color:white;" onclick="search();"><img src="${ pageContext.request.contextPath }/resources/img/search.png" alt="search"></button>
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
<c:forEach var="i" begin="1" end="3">
<tr>
	<td>test ${ i }</td>
	<td>M</td>
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
			location.href="${ pageContext.request.contextPath }/views/admin/adMemberDetail.jsp";
			//console.log($(this).parent().children().eq(0).text());
		
			//var nno = $(this).parent().children().eq(0).text();
			
			
			<%-- location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno; --%>
		});
	});

function search(){
	// 정렬
}
</script>



<c:import url="/views/common/adminFooter.jsp"/>