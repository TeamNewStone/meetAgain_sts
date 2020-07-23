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

<!-- 비어있는 소모임 -->
<!-- <p class="lead"><span class="text-danger"><i class="far fa-frown-open"></i></span>비어있음.</p> -->

<!-- 마이페이지 메인 시작 -->
<div class="col-12"><br></div>

<div class="container">

	<div class="info">

		<div class="row">
			<div class="col-12 col-md-4 text-center">
				<img
					src="${ pageContext.request.contextPath }/resources/img/lorde.png"
					alt="Raised circle image"
					class="img-fluid rounded-circle shadow-lg" style="width: 180px;">
				<div>
					<hr>
				</div>
				<div>
					<button type="button" class="lead btn btn-sm btn-light"
						onclick="accountEdit();">회원정보수정</button>
					<button type="button" class="lead btn btn-sm btn-light"
						onclick="rateEdit();">등급관리</button>
					<!-- <button type="button" class="lead btn btn-sm btn-light">프로필편집</button> -->
				</div>
			</div>
			<div
				class="col-12 col-md-8 d-flex flex-column align-items-center align-items-lg-start">
				<div class="d-flex flex-row align-items-start mt-3 mt-lg-0">
					<div class="name">
						<h2 class="mb-0">에바 그린</h2>

					</div>

					<form action="">
						<a href="#a" class="btn btn-primary btn-pill btn-sm ml-3 mt-1">팔로우하기</a>
					</form>
				</div>
				<br>
				<div
					class="stats d-flex flex-row align-items-center align-items-lg-start text-center text-lg-left"
					id="_follow">
					<div class="posts ml-2 ml-lg-0">
						<p class="lead" id="_fwfw">
							<b>134</b> 소모임
						</p>
					</div>
					&nbsp;
					<div class="posts">
						<p class="lead" id="_fwfw">
							<b>6.6m</b> 팔로워
						</p>
					</div>
					&nbsp;
					<div class="posts">
						<p class="lead" id="_fwfw">
							<b>201</b> 팔로잉
						</p>
					</div>
					&nbsp;

				</div>
				<p class="lead mb-0 mt-2" style="color: green;">
					<b>나의 키워드</b>
				</p>
				<%-- 		        <i class="fa fa-plus-circle" id="addKeyword" onclick="location.href='${ pageContext.request.contextPath }/#'"></i> --%>

				<p class="lead text-center text-lg-left">#키워드</p>
			</div>
		</div>

	</div>

	<div class="navigation d-flex justify-content-center">
    <ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#myGroupList">
          <i class="fa fa-heart"></i> 내가 가입한 소모임
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#myCreatedGroupList">
          <i class="fa fas fa-seedling"></i> 내가 만든 소모임
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
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/dog-6.jpg" alt="dog">
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
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/dog-6.jpg" alt="dog">
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
	    <div class="tab-pane fade" id="myCreatedGroupList">
		    
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
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/dog-7.jpg" alt="dog">
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
				          <img class="card-img" src="${ pageContext.request.contextPath }/resources/img/dog-6.jpg" alt="dog">
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
	     
 		</div>

	</div>

</div>

<!-- 마이페이지 메인 끝 -->

<!-- 마인펭이지 메인 스크립트작성 -->
<!--   jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js"></script>
<!-- lazy javascript -->
<script src="${ pageContext.request.contextPath }/resources/js/lazy.js"></script>

<script>
	function accountEdit() {
		location.href = "myPage2.jsp";
	}
	function rateEdit() {
		location.href = "";
	}
</script>

<c:import url="/views/common/footer.jsp" />









    
