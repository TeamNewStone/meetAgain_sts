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

				<form id="gbUpdateForm" action="${pageContext.request.contextPath}/sgroup/gbUpdate.do">
					<div class="read-top">
						<div id="title" class="text-left">
							<input type="hidden" id="gbId" name="gbId" value="${Gboard.gbId }" />
								<label>제목 : &nbsp;</label> <input type="text" class="form-control" id="gbTitle" name="gbTitle" style="width: 400px; display: inline" value="${Gboard.gbTitle}" />
						</div>
					</div>
					<div id="tempData" style="display: none">${Gboard.gbContent}
					</div>
					<script>
						$(function() {
							$('#gbContent').val($('#tempData').text());
						});
					</script>
					<div class="read-bt">

						<textarea id="gbContent" name="gbContent" cols="135" rows="15"
							style="resize: none;"></textarea>

					</div>
					<br />
					<div id="GboardBtn">

						<button type="submit" class="btn btn-outline-secondary">작성완료</button>
						<button type="button" class="btn btn-secondary" onclick="goGboard();">돌아가기</button>
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
	$('#nUpdateForm').submit(function() {
		var str = $('#gbContent').val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$('#gbContent').val(str);
		$.ajax({
			url : '${pageContext.request.contextPath}/sgroup/gbUpdate.do',
			data : {
				bId : $('#gbId'),
				bTitle : $('#gbTitle').val(),
				bContent : $('#gbContent')
			},
			success : function(data) {
				if (data == 1)
					alert('가나다');
				else
					alert('라마바');
			}
		});
	});
</script>

<!-- 	<script>
	$(function(){
		$('#summernote').summernote('editor.insertText', "${board.BContent}");
	
	</script> -->

<c:import url="/WEB-INF/views/common/footer.jsp" />