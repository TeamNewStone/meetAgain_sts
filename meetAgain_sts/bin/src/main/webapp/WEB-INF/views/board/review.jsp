<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<br>
	<br>
	<div class="header">
		<h1>리뷰</h1>
	</div>
	<br>
	<div class="row">
	<c:choose>
	<c:when test = "${empty rvlist}">
	<div style = "color : gray; text-align : center; margin : 0 auto;">등록된 리뷰 리스트가 없습니다.</div>
	</c:when>
	<c:otherwise>
	<c:forEach items="${rvlist}" var="rv">
	<c:set var="content" value="${rv.getRvContent()}"/>
		 <div class="col-md-3 offset-md-1">
          <div class="component">
						<div class="card">
							<div class="card-header">
							<c:if test="${rv.getRvImage() != null}">
							<img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/reviewImg/${rv.getRvImage()}">
							</c:if>
						  	<c:if test="${rv.getRvImage() == null}">
							<img class="card-img" src="/meetAgain/resources/img/fav01.png">
							</c:if>
							</div>
						  <div class="card-body">
							  <span class="badge badge-success mb-2">
							<c:if test="${rv.getCateId() eq 'C01'}">운동</c:if>
							<c:if test="${rv.getCateId() eq 'C02'}">친목</c:if>
							<c:if test="${rv.getCateId() eq 'C03'}">공부</c:if>
							<c:if test="${rv.getCateId() eq 'C04'}">취미생활</c:if>
							<c:if test="${rv.getCateId() eq 'C05'}">문화생활</c:if>
							<c:if test="${rv.getCateId() eq 'C06'}">여행</c:if>
							<c:if test="${rv.getCateId() eq 'C07'}">봉사</c:if>
							<c:if test="${rv.getCateId() eq 'C08'}">기타</c:if>
							</span>
						    <h4 class="card-title">${rv.getGTitle()}</h4>
						    <p class="card-text">
						    
							<c:choose>
					        <c:when test="${fn:length(content) gt 20}">
					        <c:out value="${fn:substring(content, 0, 19)}...">
					        </c:out></c:when>
					        <c:otherwise>
					        <c:out value="${rv.getRvContent()}">
					        </c:out></c:otherwise>
							</c:choose>

							</p>
						    <!-- 20자까지 보여주기 -->
						  </div>
						  <div class="card-footer">
								<button type="button" id="rvBtn" class="btn btn-outline-secondary" data-rid="${rv.getRvId() }"
								data-title="${rv.getGTitle()}" data-cate="${rv.getCateId()}" data-star="${rv.getRvStar()}"
								data-content="${rv.getRvContent() }" data-img = "${rv.getRvImage() }"
								data-sdate="${rv.getCreateDate()}" data-edate="${rv.getDurate()}" data-like="${rv.getRvLike() }"
								>자세히보기</button> &nbsp;
								<span class="badge badge-danger fas fa-heart" id="rvLike" style="float:right;">${rv.getRvLike() }</span>
								<!-- 10 : 도움이 된 (좋아요) 수 -->
						  </div>
						</div>
          </div>
        </div>
	</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
	
	<!-- --------------------------------------------modal 영역---------------------------------------------- -->
	
	<div class="modal fade" id="handleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <div style="float:left;">
        <h4 class="modal-title" id="exampleModalLabel">
        <span id="modal-title"></span>
        <span class="badge badge-success mb-2" id="modal-cate">Study</span><br />
        
        </h4>
        <h6 id = "modal-date" style="font-weight:normal;color:#9c9c9c;">2020/02/19 ~ 2020/08/10</h6>
        </div>
        <div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></div>
      </div>
      <div class="modal-body">
      <p id="star_grade">
      별점 : 
	   </p>
        <form action="#">
        <div class="card-header">
        <img class="modal-img" src="/meetAgain/resources/img/dog-1.jpg" style="width : 100%;">
        </div>
        <div class="card-body custom-control custom-checkbox my-2">
		<textarea class="form-control" rows="5" style="resize:none;" readonly >
	</textarea>
        </div>
		   <br />
</form>
        </div>
              <div class="modal-footer">
              <input type="hidden" id="userId" value="${member.userId }" />
              <input type="hidden" name="rvId"  id="reviewId"/>
        <p style="font-size:15px;">이 리뷰가 도움이 되셨나요?
        <button type="button" class="btn btn-outline-danger btn-icon btn-sm" id="likeBtn"><i class="fas fa-heart"></i></button>
        <span id="heartrate" >30</span>
        </p>
      </div>
        

</div>
</div>
</div>
</div>
<br>
<br>

<script>
$(function(){

	$(".btn-outline-secondary").click(function(){
		
		var gtitle = $(this).data('title');
		var sdate = $(this).data('sdate');
		var edate = $(this).data('edate');
		var cate = $(this).data('cate');
		var like = $(this).data('like');
		var content = $(this).data('content');
		var star = $(this).data('star');
		var img = $(this).data('img');
		var id = $(this).data('rid');
		var starcount;
	
		
		
		if(cate=="C01") category="운동";
		else if(cate=="C02") category="친목";
		else if(cate=="C03") category="공부";
		else if(cate=="C04") category="취미생활";
		else if(cate=="C05") category="문화생활";
		else if(cate=="C06") category="여행";
		else if(cate=="C07") category="봉사";
		else if(cate=="C08") category="기타";
		
		if(star==1) starcount = "별점 : ★";
		else if(star==2) starcount = "별점 : ★★";
		else if(star==3) starcount = "별점 : ★★★";
		else if(star==4) starcount = "별점 : ★★★★";
		else if(star==5) starcount = "별점 : ★★★★★";
		else starcount = "별점 : ";
		
		$("#star_grade").html(starcount);
		$("#modal-date").html(sdate+" ~ "+edate);
		$("#modal-title").html(gtitle);
		$("#modal-cate").html(category);
		$(".form-control").val(content);
		$("#heartrate").html(like);
		$("#reviewId").val(id);
		
		if(img!='') $(".modal-img").attr('src','${ pageContext.request.contextPath }/resources/upload/reviewImg/'+img);
		else $(".modal-img").attr('src','/meetAgain/resources/img/fav01.png');
	
		
		$("#handleModal").modal();
	
		return false;
	}); 
	$("#handleModal").on('hide.bs.modal',function(){
		console.log("콘솔끔!");
		location.reload();
	});
	$("#likeBtn").click(function(){
		
		var rvid = $("#reviewId").val();
		var userid;
		
		if($("#userId").val()!='') {
			userid = $("#userId").val();
			
			$.ajax({
				url : "helpRv.do",
				data : {
					rvid : rvid,
					userid : userid
				},
				success : function(data){
					if(data.result==false)	alert("에러 발생!");
					else{
						$("#heartrate").html(data.like);
					}
				},
				error : function(){
					alert("에러 발생");
				}
			});		
		}
		
		console.log("userid:"+userid+"/rvid:"+rvid);
	});
});

</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />