<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다시만나-관리자페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="A new design system for developing with less effort.">
<meta name="author" content="BootstrapBay">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>
<link href="${ pageContext.request.contextPath }/resources/img/fav02.png" rel="icon" type="image/png">
<script
	src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link href="#" rel="icon" type="image/png">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/lazy.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/prism/prism.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/demo.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h"
	crossorigin="anonymous">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css">
<style>
* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; }
</style>
</head>
<body class="documentation language-html">

<nav class="navbar navbar-expand-md navbar-dark bg-primary" style="z-index:200;">
        <a class="navbar-brand"
			href="${ pageContext.request.contextPath }/views/admin/adMain.jsp"><img
			src="${ pageContext.request.contextPath }/resources/img/logo.png" alt="Example Navbar 1"
			class="ml-2" height="30"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown-3"
			aria-controls="navbarNavDropdown-3" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

</nav> 

<div class="container-fluid">
	<div class="row">
		<div class="col-12 col-md-4 offset-md-4">
			<div class="register-form">
				<div class="mb-7" style="line-height: 2em;">
					<br /> <br /> <br /> <br /> <br />
					<p style="font-size: 50px; font-weight: bold;">Login</p>
					<p class="lead" style="font-size: 13px; color: #a9a9a9;">로그인
						하시면 더욱 다양한 '다시만나'의 서비스를 즐기실 수 있습니다.</p>
					<hr />
				</div>
				<form>
					아이디 : <input type="text" class="form-control" />
				</form>
			</div>
		</div>
	</div>
</div>




















<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>





