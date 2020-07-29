<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로잉</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/serviceCenter.css">
</head>
<body>
<div class="row bootstrap snippets" >
        <div class="comment-wrapper">
            <div class="panel panel-info">
                <div class="panel-body">
                   
                    <div class="clearfix"></div>
                    <ul class="media-list">
                    <c:if test="${list ne null }">
                    <c:forEach items="${list }" var="f">
                        <ul class="media">
                            
                            <div class="media-body" style="border-bottom-width: 1px;padding-bottom: 20px;padding-left: 60px;">
                            	<%-- <c:if test="${empty f.userImg}">
                            	<img src="${ pageContext.request.contextPath }/resources/img/usericon.png" alt="사용자사진" />     
                            	</c:if>
                            	<c:if test="${!empty f.userImg}">
                            	<img src="${ pageContext.request.contextPath }/resources/img/${f.userImg}" alt="사용자사진" />     
                            	</c:if> --%>
                                <a href="#" class="nav-link">${f.nickName}</a>
                                
                            </div>
                        </ul>
                    </c:forEach>
                    </c:if>
                    <c:if test="${empty list}">
                    
                    </c:if>

                    </ul>
                </div>
            </div>

    </div>
</div>

</body>
</html>