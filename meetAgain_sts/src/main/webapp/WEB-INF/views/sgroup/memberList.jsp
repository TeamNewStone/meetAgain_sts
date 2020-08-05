<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
<c:import url="/WEB-INF/views/common/groupHeader.jsp" />
	<!--===================== 소모임 페이지의 바디 부분 =====================-->
	<h4>모임장</h4>
	<div id="gLeader" style="overflow: hidden; height: auto; display: flex; align-items: center;">
		<c:forEach var="jo" items="${joing }">
			<c:if test="${jo.getIsCpt()=='Y'}">
				<div id="userPic" style="float: left; padding: 10px;">
					<c:if test="${jo.getUserImg() eq null }">
					<img src="/meetAgain/resources/img/usericon.png" alt="usericon"
						data-toggle="dropdown" class="img-fluid rounded-circle"
						style="width: 70px; right: 5%; top: 5%;">
					</c:if>
					<c:if test="${jo.getUserImg() ne null }">
					<img src="${ pageContext.request.contextPath }/resources/upload/userImg/${jo.getUserImg()}" alt="usericon"
						data-toggle="dropdown" class="img-fluid rounded-circle"
						style="width: 70px; right: 5%; top: 5%;">
					</c:if>
			
		</div>
		<div id="userName" style="float: left; padding: 10px;">
				<h5>${jo.getNickName()}</h5>
		</div>
			</c:if>
		</c:forEach>
	</div>
	<br />
	<div id="gMember">
	<h4>회원 리스트</h4>
	<table cellpadding="5px" style="width: 100%;">
	<tr>
		<td>
		<div id="gLeader" style="overflow: hidden; height: auto; display: flex; align-items: center;">
		<c:forEach var="jo" items="${joing }">
			<c:if test="${jo.getIsCpt()=='N'}">
				<div id="userPic" style="float: left; padding: 10px;">
				<c:if test="${jo.getUserImg() eq null }">
					<img src="/meetAgain/resources/img/usericon.png" alt="usericon" data-toggle="dropdown" class="img-fluid rounded-circle"
					style="width: 70px; right: 5%; top: 5%;">
				</c:if>
				<c:if test="${jo.getUserImg() ne null }">
					<img src="${ pageContext.request.contextPath }/resources/upload/userImg/${jo.getUserImg()}" alt="usericon" data-toggle="dropdown" class="img-fluid rounded-circle"
					style="width: 70px; right: 5%; top: 5%;">
				</c:if>
		</div>
		<div id="userName" style="float: left; padding: 10px;">
			<h5>${jo.getNickName() }</h5>
		</div>
		</c:if>
		</c:forEach>
	</div>
		</td>
	</tr>
	</table>
	</div>
	
	<div>
		
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	</div>
<c:import url="/WEB-INF/views/common/footer.jsp" />