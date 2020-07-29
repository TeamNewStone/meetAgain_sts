<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로워</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/serviceCenter.css">
</head>
<body>
<div class="row bootstrap snippets" >
        <div class="comment-wrapper">
            <div class="panel panel-info">
            <div class="panel-heading" style="text-align:center;">
                    <h4>follower</h4>
                </div>
                <hr />
                <div class="panel-body">
                   
                    <div class="clearfix"></div>
                    <ul class="media-list">
                    <c:if test="${list ne null }">
                    <c:forEach items="${list }" var="f">
                        <ul class="media" style="border-bottom-width: 1px;padding-bottom: 20px;padding-left: 60px;">
                            
                            <div class="media-body">
                            	<%-- <c:if test=""></c:if>
                            	<img src="${ pageContext.request.contextPath }/resources/img/usericon.png" alt="사용자사진" /> --%>    
                                <a href="#" class="nav-link">${f.nickName}</a>
                                
                            </div>
                        </ul>
                    </c:forEach>
                    </c:if>


                    </ul>
                </div>
            </div>

    </div>
</div>

</body>
</html>