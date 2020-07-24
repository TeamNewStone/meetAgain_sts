<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br />
<br />
<br />
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="content">
			
			<form action="${pageContext.request.contextPath}/board/nUpdate.do">
				<div class="read-top">
					<div id="title" class="text-left">
						<label>제목 : &nbsp;</label> <input type="text" class="form-control" name="title" style="width:400px; display:inline" value="${board.BTitle }"/>
					</div>
				</div>
				<div class="read-bt">
				
				<div id="summernote" style="height:800px;"></div>
					<!-- <textarea name="content" cols="135" rows="15" style="resize:none;"></textarea> -->
				</div>
				<br />
	<div id="noticeBtn">

			<button type="submit" class="btn btn-outline-secondary">작성완료</button>
			<button type="button" class="btn btn-secondary" onclick="goNotice();">돌아가기</button>
	</div>
			</form>	
				
			</div>
		</div>
	</div>
	<br />
</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	
	
	<script>
	$(function(){
		$('#summernote').summernote('editor.insertText', "${board.BContent}");
		 $('#summernote').summernote({
		 height : 300,	 
		 toolbar: [
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline']],
			    ['font', ['strikethrough']],
			    ['fontsize', ['fontsize']],
			    ['fontname', ['fontname']],
			    ['color', ['forecolor', 'backcolor']],
			    ['para', ['paragraph']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			  ]
		 });
		 
		}
	);
	
	</script>
	
<c:import url="/WEB-INF/views/common/footer.jsp" />