<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--footer 시작 -->
<footer class="footer-1 bg-light text-dark">
<div class="container">
<div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
	<div class="links">
		<p>&nbsp;&nbsp;Site Map </p>
		<ul class="footer-menu list-unstyled d-flex flex-row text-center text-md-left">
			<li><a href="/meetAgain/views/board/notice.jsp">공지사항</a></li>
			<li><a href="/meetAgain/views/board/faq.jsp">자주묻는 질문</a></li>
		</ul>
		<br />
		<ul class="footer-menu list-unstyled d-flex flex-row text-center text-md-left">
			<li><a href="https://bootstrapbay.com/blog/">마이페이지</a></li>
			<li><a href="/meetAgain/views/board/review.jsp">리뷰</a></li>
		</ul>
		
	</div>
	<div class="social mt-4 mt-md-0">
	<p>Contact Us
		<svg width="1.3em" height="1.6em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  	<path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
		</svg>
	</p>
    <p>
      Team NewStone <br>
            서울특별시 강남구 역삼동 <br>
            호산빌딩 KH정보교육원 352 Class <br>
      031-123-4567 <br>
    </p>
  </div>
</div>
<div class="copyright text-center">
  <hr />
    <a href="#">서비스이용약관</a> | 
    <a href="#">개인정보 취급 약관</a>
	<p class="small">&copy; 2020, NewStone <span class="text-danger"><i class="fas fa-heart"></i></span> All rights reserved</p>
</div>
</div>
</footer>
<!-- footer 끝 -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<%--     <script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script> --%>
    <script src="${ pageContext.request.contextPath }/resources/vendor/popper/popper.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/bootstrap.min.js" ></script>

    <!-- optional plugins -->
    <script src="${ pageContext.request.contextPath }/resources/vendor/nouislider/js/nouislider.min.js"></script>

    <!-- prism for code documentation -->
    <script src="${ pageContext.request.contextPath }/resources/vendor/prism/prism.js"></script>

    <!--   lazy javascript -->
    <script src="${ pageContext.request.contextPath }/resources/js/lazy.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/demo.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/graph.js"></script>  
 </body>
</html>