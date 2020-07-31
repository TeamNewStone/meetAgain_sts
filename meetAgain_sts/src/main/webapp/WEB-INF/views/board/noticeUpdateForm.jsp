<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp" />
<br />
<br />
<br />
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="content">
			
			<form id="nUpdateForm" action="${pageContext.request.contextPath}/board/nUpdate.do">
				<div class="read-top">
					<div id="title" class="text-left">
					<input type="hidden" id="bId" name="bId" value="${board.BId }" />
						<label>제목 : &nbsp;</label> <input type="text" class="form-control" id="bTitle" name="bTitle" style="width:400px; display:inline" value="${board.BTitle }"/>
					</div>
				</div>
				<br />
				<div class="read-bt">
					<textarea id="bContent" name="bContent" cols="135" rows="15" style="resize:none;">${board.BContent}</textarea>
					
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
		$('#nUpdateForm').submit(function(){
			var str = $('#bContent').val();

			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

			$('#bContent').val(str);
			$.ajax({
				url:'${pageContext.request.contextPath}/board/nUpdate.do',
				data:{
					bId:$('#bId'),
					bTitle:$('#bTitle').val(),
					bContent:$('#bContent')
				}, success:function(data){
					if(data == 1) alert('수정을 완료하였습니다.');
					else alert('수정에 실패하였습니다. 다시 시도해 주세요.');
				}
			});
		});
		
		function goNotice(){
			location.href="${pageContext.request.contextPath}/admin/adNoticeManage.do";
		}
	</script>
	
<!-- 	<script>
	$(function(){
		$('#summernote').summernote('editor.insertText', "${board.BContent}");
	
	</script> -->
	
<c:import url="/WEB-INF/views/common/adminFooter.jsp" />