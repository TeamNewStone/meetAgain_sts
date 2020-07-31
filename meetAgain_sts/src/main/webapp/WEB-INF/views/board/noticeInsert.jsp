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
			
			<form id="nInsertForm" action="${pageContext.request.contextPath}/board/nInsert.do">
				<div class="read-top">
					<div id="title" class="text-left">
						<label>제목 : &nbsp;</label> <input type="text" class="form-control" name="bTitle" id="bTitle" style="width:400px; display:inline"/>
					</div>
				</div>
				<br />
				<div class="read-bt">
				
					 <textarea id="bContent" name="bContent" cols="135" rows="15" style="resize:none;"></textarea> 
				</div>
				<br />
	<div id="noticeBtn">

			<button type="submit" class="btn btn-outline-secondary" >작성완료</button>
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
$('#nInsertForm').submit(function(){
	var str = $('#bContent').val();

	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

	$('#bContent').val(str);
	$.ajax({
		url:'${pageContext.request.contextPath}/board/nInsert.do',
		data:{
			bTitle:$('#bTitle').val(),
			bContent:$('#bContent')
		}, success:function(data){
			if(data == 1) alert('가나다');
			else alert('라마바');
		}
	});
});

</script>
	

	
<c:import url="/WEB-INF/views/common/adminFooter.jsp" />