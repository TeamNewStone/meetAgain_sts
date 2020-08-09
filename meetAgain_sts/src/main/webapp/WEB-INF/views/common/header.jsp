<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>다시만나 - 특별한 사람들의 특별한 만남</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="A new design system for developing with less effort.">
    <meta name="author" content="BootstrapBay">
    <link href="${ pageContext.request.contextPath }/resources/img/fav02.png" rel="icon" type="image/png">
	
 	<script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js" ></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/summernote/summernote-lite.min.js"></script>  
    
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/lazy.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/demo.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mInsert.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/index.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/membership.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/serviceCenter.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/group.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<link href='${ pageContext.request.contextPath }/resources/css/main.css' rel='stylesheet' />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h" crossorigin="anonymous">
    
	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
  	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <link href="${ pageContext.request.contextPath }/resources/vendor/summernote/summernote-lite.min.css" rel="stylesheet">

<style>

@media(max-width :991px) {
	#login {
		text-align:left;
	}

}

@media(min-width :992px) {
	#login {
		position: absolute;
		right: 25%;
		top: 25%;
		text-align:left;
	}
	#userIcon {
		position: absolute;
		right: 20%;
		top: 15%;
	}
}

@media(min-width :1601px) {
	#login {
		position: absolute;
		right: 29%;
		top: 25%;
	}
	#userIcon {
		position: absolute;
		right: 25%;
		top: 15%;
	}
}

#noticePaging ul li{
	display : inline-block;
	text-align : center;
}

* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; }
</style>
  </head>
  <body class="index">

      <!--header 시작-->
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand" href="${ pageContext.request.contextPath }"><img src="/meetAgain/resources/img/logo.png" alt="Example Navbar 1" class="mr-2" height="30"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown-7" aria-controls="navbarNavDropdown-7"
          aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown-7">
	        <ul class="navbar-nav">
            <li class="nav-item dropdown" id="notice">
              <a class="nav-link" href="#" id="nav-inner-primary_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="goNotice();">공지사항</a>
            </li>
            <li class="nav-item dropdown" id="review">
              <a class="nav-link" href="#" id="nav-inner-primary_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="goGroup();">소모임</a>
            </li>
            </ul>

			<ul class="navbar-nav ml-auto" id="login-nav">
			<c:if test="${empty member}">
            <li class="nav-item dropdown text-white" id="login">
              <a class="nav-link" href="${ pageContext.request.contextPath }/member/login.do">로그인</a>
            </li>
            </c:if>
            <c:if test="${!empty member}">
            <li>
             <p style="color :#fff; width : 250px;margin-right: -4%; margin-top:5px" id="login"> ${member.nickName}님, 안녕하세요!</p>
            </li>
            <li class="nav-item dropdown" id="userIcon" style="cursor:pointer;">
           				<c:if test="${member.userImg eq null }">
							<img
								src="${ pageContext.request.contextPath }/resources/img/usericon.png"
								alt="usericon"
								class="test img-fluid rounded-circle" style="width: 60px; height:60px;">
						</c:if>
						<c:if test="${member.userImg ne null }"> 
							<img
								src="${ pageContext.request.contextPath }/resources/upload/userImg/${member.userImg}"
								alt="Raised circle image"
								class="test img-fluid rounded-circle"style="width: 60px; height:60px;">
						</c:if>
                   <!-- <img src="/meetAgain/resources/img/usericon.png" alt="usericon" data-toggle="dropdown" class="test img-fluid rounded-circle" style="width : 60px;"> -->
              <div class="dropdown-menu dropdown-menu-right dropMenuDiv" aria-labelledby="nav-inner-primary_dropdown_1">
                <!-- <a class="dropdown-item" href="${ pageContext.request.contextPath }/member/logout.do">로그아웃</a>-->
                <a class="dropdown-item" onclick="userLogout();">로그아웃</a>
                <a class="dropdown-item" href="${ pageContext.request.contextPath }/myPage/myPage1.do?uid=${member.userId}">마이페이지</a>
                <a class="dropdown-item" href="${ pageContext.request.contextPath }/myPage/myPage2.do?uid=${member.userId}">개인정보수정</a>
                <a class="dropdown-item" href="${ pageContext.request.contextPath }/member/membership.do">등급관리</a>
              </div>
            </li>
               </c:if>
          </ul>
          </div>
        </div>
    </nav>
    <script>

    // 화면크기가 992 미만일 경우 유저사진 notice li 위로 올리기
    $(function(){
	  	  var windowWidth = $(window).width();

	  	  if(windowWidth < 992){
	  		  $('#userIcon').insertBefore('#notice');
	  		  $('#userIcon').css('width','40px');
	  	  } 
	    });
    $('.test').on('click',function(){
    	$('.dropMenuDiv').toggle();
    });
    
    
    function goNotice(){
    	location.href='${ pageContext.request.contextPath }/board/notice.do';
    }
    
    function goGroup(){
    	location.href='${ pageContext.request.contextPath }/sgroup/group.do';
    }
    function userLogout(){
    	var confirm = window.confirm("로그아웃 하시겠습니까?");
    	if(confirm) location.href="${ pageContext.request.contextPath }/member/logout.do";
    }


    </script>
    <!-- header 끝 -->