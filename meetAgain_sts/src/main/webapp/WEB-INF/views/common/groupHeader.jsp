<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--===================== 소모임 페이지의 헤더 부분 =====================-->
<div id="groupHead"
	style="overflow: hidden; height: auto; display: flex; align-items: center;">
	<div id="gnameMenu" style="float: left; padding: 10px;">

		<img src="${ pageContext.request.contextPath }/resources/img/usericon.png" alt="usericon"
			data-toggle="dropdown" class="img-fluid rounded-circle"
			style="width: 70px; right: 5%; top: 5%;">
	</div>

	<div id="gname" style="float: left; padding: 10px;">		
		<button class="btn bg-transparent" onclick="location.href='${ pageContext.request.contextPath }/views/sgroup/groupDetail.jsp'"><h4>소모임 이름</h4></button>
	</div>
	<div id="btnMenu" style="margin-left: auto;">
<!-- 
		<ul	class="nav nav-pills nav-secondary d-flex flex-column flex-md-row text-center">
			<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="#groupBoard">게시판</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#groupMap">지도</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="/meetAgain/views/sgroup/groupCalendar.jsp">캘린더</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#profile2">사진첩</a>
			</li>
		</ul>
 -->
			<button id="group-boardbtn" class="btn btn-outline-secondary"
			onclick="location.href='${ pageContext.request.contextPath }/views/sgroup/groupBoard.jsp'">게시판</button>
			&nbsp;
			<button id="group-mapbtn" class="btn btn-outline-secondary"
			onclick="location.href='${ pageContext.request.contextPath }/views/sgroup/groupMap.jsp'">&nbsp;지도&nbsp;</button>
			&nbsp;
			<button id="group-calbtn" class="btn btn-outline-secondary"
			onclick="location.href='${ pageContext.request.contextPath }/views/sgroup/groupCalendar.jsp'">캘린더</button>
			&nbsp;
			<button id="group-albumbtn" class="btn btn-outline-secondary"
			onclick="location.href='${ pageContext.request.contextPath }/views/sgroup/groupAlbum.jsp'">사진첩</button>
	
	</div>
</div>
<hr />

<!--===================== 소모임 페이지의 헤더 부분 끝 =====================-->