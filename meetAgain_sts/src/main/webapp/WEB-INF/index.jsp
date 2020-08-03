<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="reviewTitle" value="헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 국회는 의장 1인과 부의장 2인을 선출한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다."/>

<c:import url="/WEB-INF/views/common/header.jsp" />

<!-- 메인 배너 시작 -->
<div class="row"> 
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
   <!--  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/meetAgain/resources/img/BANNER1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/meetAgain/resources/img/BANNER2.jpg" alt="Second slide">
    </div>
   <!--  <div class="carousel-item">
      <img class="d-block w-100" src="/meetAgain/resources/img/dog-4.jpg" alt="Third slide">
    </div> -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<!-- 메인배너 끝 -->

  <!-- 차트 시작 -->
<div class="page-hero" id="banner">
  	<div class="container">
      <div class="row"> 
        <div class="col-sm-12 col-md-12 col-lg-6">
          <h4>7월 첫째주 모임이 제일 많이 생성된 지역</h4>
          <div id="piechart" style="width:100%; height:500px;"></div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-6">
          <h4>7월 첫째주 모임이 제일 많이 생성된 지역</h4>
          <div id="curve_chart" style="width: 100%; height: 500px"></div>
      </div>
      </div>
    </div>
	</div> 
  <!-- 차트 끝-->

<!-- 공지사항 시작-->
<div class="intro bg-light">
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="header">
        <h2>공지사항</h2>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="section desc">
	    <div class="row">
		    <div class="col-12 col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
		    </div>
	    </div>
    </div>
  </div>
</div>
<!-- 공지사항 끝 -->


    <!-- 리뷰 시작 -->
    <div class="section">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="header">
          	<h2>리뷰</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 offset-md-2">
          <div class="component">
						<div class="card">
							<div class="card-header">
						  	<img class="card-img" src="/meetAgain/resources/img/dog-1.jpg" alt="dog">
							</div>
						  <div class="card-body">
							  <span class="badge badge-success mb-2">Study</span>
						    <h4 class="card-title">352_프로그래밍</h4>
						    <p class="card-text">
						    
							<c:choose>
					        <c:when test="${fn:length(reviewTitle) gt 20}">
					        <c:out value="${fn:substring(reviewTitle, 0, 19)}...">
					        </c:out></c:when>
					        <c:otherwise>
					        <c:out value="${reviewTitle}">
					        </c:out></c:otherwise>
							</c:choose>

							</p>
						    <!-- 20자까지 보여주기 -->
						  </div>
						  <div class="card-footer">
								<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#handleModal">자세히보기</button> &nbsp;
								<span class="badge badge-danger fas fa-heart" style="float:right;">10</span>
								<!-- 10 : 도움이 된 (좋아요) 수 -->
						  </div>
						</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="component">
            <div class="card">
							<div class="card-header">
						  	<img class="card-img" src="/meetAgain/resources/img/dog-2.jpg" alt="dog">
							</div>
						  <div class="card-body">
							  <span class="badge badge-warning mb-2">Vacation</span>
						    <h4 class="card-title">Woof! How to find</h4>
						    <p class="card-text">Considering Spain's abundant coastline... </p>
						  </div>
						  <div class="card-footer">
								<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exReviewInsert">자세히보기</button> &nbsp;
								
						  </div>
						</div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="component">
						<div class="card">
							<div class="card-header">
						  	<img class="card-img" src="/meetAgain/resources/img/dog-3.jpg" alt="dog">
							</div>
						  <div class="card-body">
							  <span class="badge badge-secondary mb-2">Hobby</span>
						    <h4 class="card-title">Getting Started With Your Puppy</h4>
						    <p class="card-text">This new addition to your family will ... </p>
						  </div>
						  <div class="card-footer">
								<a href="#a" class="btn btn-outline-primary">Read More</a>
						  </div>
						</div>
          </div>
        </div>
      </div>

    </div>
<!-- 리뷰 끝 -->

<!-- 리뷰 자세히보기 the modal -->
<div class="modal fade" id="handleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <div style="float:left;">
        <h4 class="modal-title" id="exampleModalLabel">352_프로그래밍
        <span class="badge badge-success mb-2">Study</span><br />
        
        </h4>
        <h6 style="font-weight:normal;color:#9c9c9c;">2020/02/19 ~ 2020/08/10</h6>
        </div>
        <div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></div>
      </div>
      <div class="modal-body">
      <p id="star_grade">
      별점 : 
      <c:forEach var="i" begin="1" end="5">
        ★
       </c:forEach>
	   </p>
        <form action="#">
        <div class="card-header">
        <img class="card-img" src="/meetAgain/resources/img/dog-1.jpg" alt="dog">
        </div>
        <div class="card-body custom-control custom-checkbox my-2">
		<textarea class="form-control" rows="5" style="resize:none;" readonly >
		${reviewTitle }
	</textarea>

        </div>

		
        <br />

</form>
        </div>
              <div class="modal-footer">
        <p style="font-size:15px;">이 리뷰가 도움이 되셨나요?
        <button type="button" class="btn btn-outline-danger btn-icon btn-sm"><i class="fas fa-heart"></i></button>
        30
        </p>
      </div>
        

</div>
</div>
</div>






<br><br><br>
<script>


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
  //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
  this.rate = newrate;
  let items = document.querySelectorAll('.rate_radio');
  items.forEach(function(item, idx){
      if(idx < newrate){
          item.checked = true;
      }else{
          item.checked = false;
      }
  });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

$(function(){
$('[name=upFile]').on('change',function(){
    //var fileName = $(this).val();//C:\fakepath\파일명
    //var fileName = this.files[0].name;//파일명(javascript)
    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
	//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
    console.log($(this).val());
    $(this).next('.custom-file-label').html(fileName);
})
});
</script>
 <c:import url="/WEB-INF/views/common/footer.jsp" />


