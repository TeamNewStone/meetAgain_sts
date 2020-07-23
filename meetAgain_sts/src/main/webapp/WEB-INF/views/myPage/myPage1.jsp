<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  #_fwfw{
   font-size: 20px;
 }
</style>

<c:import url="/views/common/header.jsp" />

<!-- <!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="A new design system for developing with less effort.">
    <meta name="author" content="BootstrapBay">

    <link href="${ pageContext.request.contextPath }/resources/img/favicon.ico" rel="icon" type="image/png">
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/lazy.css">
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/demo.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css">
  </head>
  <body class="profile">
    <nav class="navbar navbar-expand-md navbar-dark bg-primary mb-4 fixed-top">
    <div class="container">

      <a class="navbar-brand d-flex align-items-center" href="../../index.jsp"><img src="${ pageContext.request.contextPath }/resources/img/logo_white.svg" alt="Example Navbar 1" class="mr-2" height="30">다시 만나</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown-3" aria-controls="navbarNavDropdown-3"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse mr-auto" id="navbarNavDropdown-3">
        <ul class="navbar-nav ml-auto text-center">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="far fa-compass"></i>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="far fa-heart"></i>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="far fa-user"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav> -->

<!-- 마이페이지 메인 시작 -->
<div class="col-12"><br></div>
<div class="container">
  <div class="info">
    <div class="row">
	    <div class="col-12 col-md-4 text-center">
		    <img src="${ pageContext.request.contextPath }/resources/img/lorde.png" alt="Raised circle image" class="img-fluid rounded-circle shadow-lg" style="width: 180px;">
	    </div>
	    <div class="col-12 col-md-8 d-flex flex-column align-items-center align-items-lg-start">
		    <div class="d-flex flex-row align-items-start mt-3 mt-lg-0">
			    <div class="name">
		    		<h2 class="mb-0">에바 그린</h2>
			    </div>
			    
			    <form action="">
		    	<a href="#a" class="btn btn-primary btn-pill btn-sm ml-3 mt-1">팔로우하기</a>
		    	</form>
        </div>
        <br>
		    <div class="stats d-flex flex-row align-items-center align-items-lg-start text-center text-lg-left" id="_follow">
			    <div class="posts ml-2 ml-lg-0"><p class="lead" id="_fwfw"><b>134</b> 소모임</p></div>&nbsp;
			    <div class="posts"><p class="lead" id="_fwfw"><b>6.6m</b> 팔로워</p></div>&nbsp;
			    <div class="posts"><p class="lead" id="_fwfw"><b>201</b> 팔로잉</p></div>&nbsp;
          <div><button type="button" class="lead btn btn-sm btn-light" onclick="accountEdit();">정보수정</button></div>
		    </div>
		    <p class="lead mb-0 mt-2" style="color: green;"><b>나의 키워드</b>

		        <i class="fa fa-plus-circle" id="addKeyword" onclick="location.href='${ pageContext.request.contextPath }/#'"></i>
		    </p>
		    
        <p class="lead text-center text-lg-left">#키워드</p>
	    </div>
    </div>
  </div>
	<div class="navigation d-flex justify-content-center">
    <ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#myGroupList">
          <i class="fa fa-heart"></i> 나의 소모임
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#myPost">
          <i class="fa fa-list-alt"></i> 작성한 게시글
        </a>
      </li>      
    </ul>
  </div>
  
  <!-- 나의 소모임 시작 -->
  <!-- 카드 고정폭 500px 더보기 아래로-->
  <div class="profile profile-tabs tab-content">
    <div class="tab-pane fade show active" id="myGroupList">
				<!-- <div class="row">
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-4.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-5.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-6.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-7.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-8.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square" style="background-image:url('${ pageContext.request.contextPath }/resources/img/dog-3.jpg');"></div>
					</div>
				</div> -->
				<div class="row">
				
				<%-- <c:forEach var="Group" items="${cardGroupList}"> --%>
								
				  <div class="col-md-4" style="max-width: 500px;">
				    <div class="component">
				      <div class="card">
				        <div class="card-header">
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/dog-6.jpg" alt="dog">
				        </div>
				        <div class="card-body">				          
				          <h4 class="card-title mt-2">Getting Started With Your Puppy</h4>
				          <p class="card-text">This new addition to your family will require lots of love, attention and plenty of supplies. This new addition to your family will require lots of love, attention and plenty of supplies. This new addition to your family will require lots of love, attention and plenty of supplies. This new addition to your family will require lots of love, attention and plenty of supplies. </p>
				        </div>
				        <div class="card-footer">
				          <a href="#a" class="btn btn-outline-primary">Read More</a>
				        </div>
				      </div>
				    </div>
				  </div>
				  
				  <div class="col-md-4" style="max-width: 500px;">
				    <div class="component">
				      <div class="card">
				        <div class="card-header">
				          <img class="card-img" src="assets/img/dog-2.jpg" alt="dog">
				        </div>
				        <div class="card-body">				          
				          <h4 class="card-title mt-2">Woof! How to find dog-friendly beaches in Spain</h4>
				          <p class="card-text">Considering Spain's abundant coastline, beaches that do allow you to take your pooch to feel sand... </p>
				        </div>
				        <div class="card-footer">
				          <a href="#a" class="btn btn-outline-primary">Read More</a>
				        </div>
				      </div>
				    </div>
				  </div>
				  
				  <div class="col-md-4" style="max-width: 500px;">
				    <div class="component">
				      <div class="card">
				        <div class="card-header">
				          <img class="card-img" src="assets/img/dog-2.jpg" alt="dog">
				        </div>
				        <div class="card-body">				          
				          <h4 class="card-title mt-2">Woof! How to find dog-friendly beaches in Spain</h4>
				          <p class="card-text">Considering Spain's abundant coastline, beaches that do allow you to take your pooch to feel sand... </p>
				        </div>
				        <div class="card-footer">
				          <a href="#a" class="btn btn-outline-primary">Read More</a>
				        </div>
				      </div>
				    </div>
				  </div>
				  
				<%-- </c:forEach> --%>
				  
				</div>
				
				<div class="d-flex justify-content-center my-5">
					<a href="#a" class="btn btn-outline-primary btn-pill">더 보기</a>
				</div>
    </div>

    <!-- 작성한 게시물 -->
    <div class="tab-pane fade text-center" id="myPost">
      <%-- 게시물 리스트. --%>

		<%-- <c:forEach var="name" items="${myGroupList}" varStatus="status">
		
		</c:forEach> --%>

			<table class="table">

				<thead>
					<tr>
						<th>-</th>
						<th>모임명</th>
						<th>모임제목</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>굽남모임</td>
						<td>제목1</td>
					</tr>
				</tbody>
			</table>
			
      <p class="lead"><span class="text-danger"><i class="far fa-frown-open"></i></span>비어있음.</p>
      

		</div>    
  </div>

</div>

<!-- 마이페이지 메인 끝 -->
    
<!-- <footer class="footer-1 bg-light text-dark">
<div class="container">
<div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
	<div class="links">
		<ul class="footer-menu list-unstyled d-flex flex-row text-center text-md-left">
			<li><a href="https://bootstrapbay.com/" target="_blank">Store</a></li>
			<li><a href="https://bootstrapbay.com/about" target="_blank">About Us</a></li>
			<li><a href="https://bootstrapbay.com/blog/" target="_blank">Blog</a></li>
			<li><a href="https://bootstrapbay.com/terms" target="_blank">Terms & Conditions</a></li>
		</ul>
	</div>
	<div class="social mt-4 mt-md-0">
    <a class="twitter btn btn-outline-primary btn-icon" href="https://twitter.com/bootstrapbay" target="_blank">
      <i class="fab fa-twitter"></i>
      <span class="sr-only">View our Twitter Profile</span>
    </a>
    <a class="facebook btn btn-outline-primary btn-icon" href="https://www.facebook.com/bootstrapbayofficial/" target="_blank">
      <i class="fab fa-facebook"></i>
      <span class="sr-only">View our Facebook Profile
        <span>
    </a>
    <a class="github btn btn-outline-primary btn-icon" href="https://github.com/bootstrapbay" target="_blank">
      <i class="fab fa-github"></i>
      <span class="sr-only">View our GitHub Profile</span>
    </a>
  </div>
</div>
<div class="copyright text-center">
	<hr />
	<p class="small">&copy; 2019, made with <span class="text-danger"><i class="fas fa-heart"></i></span> by BootstrapBay</p>
</div>
</div>
</footer>

  </body>
</html> -->

 <c:import url="/views/common/footer.jsp" />

    <!-- 마인펭이지 메인 스크립트작성 -->
    <!--   jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js" ></script>	
      <!-- lazy javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/lazy.js"></script>
    
    <script>
      function accountEdit() {
        location.href="myPage2.jsp";
      }
    </script>
    










    
