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
	<script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script> 
    <script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery-ui.min.js"></script>
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
                    <ul class="media-list" style="text-align:center;padding-left: 20px;">
                    <c:if test="${list ne null }">
                    <c:forEach items="${list }" var="f" varStatus="st">
                        <ul class="media" id="mediaItem" style="margin:auto;padding-left: 20px;" onclick="mediaItemfn();">
                            
                            <div class="media-body">
                            	<%-- <c:if test=""></c:if>
                            	<img src="${ pageContext.request.contextPath }/resources/img/usericon.png" alt="사용자사진" /> --%>    
                            	<input type="hidden" id="userId-${st.index}" value="${f.userId}" />
                                <p class="nav-link">${f.nickName}</p>
                                
                            </div>
                        </ul>
                    </c:forEach>
                    </c:if>


                    </ul>
                </div>
            </div>

    </div>
</div>

<script>
$('#mediaItem').click(function() {
	window.close();
	var listSize = '${list.size()}';
	console.log(listSize);
	for(var i = 0; i < listSize; i++){
		var userId = $('#userId-'+i).val();
		opener.location.href='${pageContext.request.contextPath}/myPage/myPage1.do?uid='+userId;
		
	}
}).mouseenter(function() {
	$(this).css({
		"cursor" : "pointer"
	});

});


</script>

</body>
</html>