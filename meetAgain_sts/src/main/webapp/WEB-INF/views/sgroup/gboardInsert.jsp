<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

	<form action="${pageContext.request.contextPath }/sgroup/gbInsert.do"
		method="post">
		<div id="titleArea">
			<input type="hidden" name="gId" value="${ param.gId}"/>
			<input type="hidden" name="userId" value="${member.getUserId() }"/>
			
			<input type="text" class="form-control" id="gbTitle" name="gbTitle"
				placeholder="제목을 입력하세요" />
		</div>
		<br />
		<textarea id="summernote" class="gbContent" style="height: 800px;"
			name="gbContent"></textarea>
		<br />
		<div align="center">
			<button type="submit" class="btn btn-outline-secondary">작성하기</button>
		</div>
	</form>
	<br /> <br /> <br />
</div>
<script
	src="${ pageContext.request.contextPath }/resources/vendor/summernote/summernote-lite.min.js"></script>

<script>
	$(function() {
		$("#group-boardbtn").attr('class', 'btn btn-secondary');
	});
	$('#summernote').summernote(
			{
				height : 300,
				toolbar : [ [ 'style', [ 'bold', 'italic', 'underline' ] ],
						[ 'font', [ 'strikethrough' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[ 'fontname', [ 'fontname' ] ],
						[ 'color', [ 'forecolor', 'backcolor' ] ],
						[ 'para', [ 'paragraph' ] ], [ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture' ] ], ]
			});
	$(function() {
		$('.note-btn-group').children('button').removeClass('dropdown-toggle');
	});

	$('#post').submit(function() {
		var str = $('.gbContent').val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$('#gbContent').val(str);
		$.ajax({
			url : '/meetAgain/sgroup/gbInsert.do',
			data : {
				gbId : $('#gbId').val(),
				gId : $('#gId').val(),
				userId : $('userId').val(),
				nickName : $('nickName').val(),
				gbTitle : $('#gbTitle').val(),
				gbContent : $('#gbContent').val(),
				gbDel : $('#gbDel').val()

			},
			success : function(data) {
				if (data == 1)
					alert('가나다');
				else
					alert('라마바');
			}
		});
		console.log(gbTitle);
	});
</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />