<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />
<div class="container">
	<c:import url="/views/common/groupHeader.jsp" />
	
	<form action="post">
	<div id="titleArea">
	<input type="text" class="form-control" name = "title" placeholder="제목을 입력하세요"/>
	</div>
	<br />
	<div id="summernote" style="height:800px;"></div>
	<br /> 
	<div align ="center">
	<button type="submit" class="btn btn-outline-secondary">작성하기</button>	
	
	</div>
	</form>
	<br /> <br /> <br />
</div>

<script>
$(function(){
	$("#group-boardbtn").attr('class','btn btn-secondary');
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
$(function(){
	   $('.note-btn-group').children('button').removeClass('dropdown-toggle');
	});
</script>
<c:import url="/views/common/footer.jsp" />