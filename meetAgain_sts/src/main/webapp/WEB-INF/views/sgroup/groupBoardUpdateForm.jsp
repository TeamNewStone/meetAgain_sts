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
				<form id="gbUpdateForm" action="${pageContext.request.contextPath}/sgroup/gbUpdate.do"
				method="post" enctype="multipart/form-data">
					<div class="read-top">
						<div id="title" class="text-left">
							<input type="hidden" id="gbId" name="gbId" value="${Gboard.gbId}" />
							<input type="hidden" id="gid" name="gid" value="${gid}" />
								<label>제목 : &nbsp;</label>
								<input type="text" class="form-control" id="gbTitle" name="gbTitle" style="width: 400px; display: inline" value="${Gboard.gbTitle}" />
						</div>
					</div>
					<textarea id="summernote" class="gbContent" style="height: 800px;"
			name="gbContent">${Gboard.gbContent}
					</textarea>
					<script>
						$(function() {
							$('#gbContent').val($('#summernote').text());
						});
					</script>
					<div class="read-bt">

					
					<br />
					<div align="center">
			<button type="submit" class="btn btn-outline-secondary">수정완료</button>
			<button type="button" class="btn btn-secondary" onclick="goBack();">돌아가기</button>
		</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script
	src="${ pageContext.request.contextPath }/resources/vendor/summernote/summernote-lite.min.js"></script>

<br />
<br />
<br />
<br />
<br />
<script>
$(function() {
	$("#group-boardbtn").attr('class', 'btn btn-secondary');
});
var check = $('#summernote').summernote(
		{
			height : 300,
			toolbar : [ [ 'style', [ 'bold', 'italic', 'underline' ] ],
					[ 'font', [ 'strikethrough' ] ],
					[ 'fontsize', [ 'fontsize' ] ],
					[ 'fontname', [ 'fontname' ] ],
					[ 'color', [ 'forecolor', 'backcolor' ] ],
					[ 'para', [ 'paragraph' ] ], [ 'table', [ 'table' ] ],
					[ 'insert', [ 'link', 'picture' ] ] 
			], callbacks : {
		         onImageUpload : function(files, editor,
		               welEditorble) {
		            data = new FormData();
		            data.append("file", files[0]);
		            
		            $.ajax({
		               data : data,
		               type : "post",
		               url : '${pageContext.request.contextPath}/sgroup/aImgInsert.do', // servlet url
		               cache : false,
		               contentType : false,
		               processData : false,
		               success : function(fileUrl) {
		                  check.summernote('insertImage', fileUrl);
		                  alert("이미지 등록 성공!" + fileUrl);
		               },
		               error : function(request, status, error) {
		                  alert("code:" + request.status + "\n"
		                        + "message:"
		                        + request.responseText + "\n"
		                        + "error:" + error);
		               }
		            });
		         }
				      }
		});

$(function() {
	$('.note-btn-group').children('button').removeClass('dropdown-toggle');
});
	$('#gbUpdateForm').submit(function() {
		var str = $('#gbContent').val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$('#gbContent').val(str);
		$.ajax({
			url : '${pageContext.request.contextPath}/sgroup/gbUpdate.do',
			data : {
				gbId : $('#gbId'),
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
<script>
function goBack() {
	location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardDetail.do?gbId="
			+${Gboard.gbId}+"&gid="+${gid};
}

</script>
<!-- 	<script>
	$(function(){
		$('#summernote').summernote('editor.insertText', "${board.BContent}");
	
	</script> -->

<c:import url="/WEB-INF/views/common/footer.jsp" />