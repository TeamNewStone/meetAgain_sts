<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp"/>
<script>
$('.nav-item').addClass('canSee').removeClass('cantSee');
</script>

        <div class="col-md-8 offset-md-2 content">
          <h2>댓글 관리</h2>

<div class="component">
<table class="table" style="text-align:center;margin:auto; width:130%;">
<input type="hidden" id="rcId" name="rcId" value="${report.rcId }" />
<tr>
	<th>모임명</th>
	<td>${report.gbTitle}</td>
	<th>작성자</th>
	<td>${report.tnickName}</td>
</tr>
<tr>
	<th>신고사유</th>
	<td>${report.rcInfo }</td>
	<th>신고자</th>
	<td>${report.nickName }</td>
</tr>
<tr>
	<th colspan="4">신고 상세 사유</th>
</tr>
<tr>
	<td colspan="4">
	<textarea name="" id="" cols="200" rows="10" readonly style="resize:none;">${report.rcContent }</textarea>	
	</td>
</tr>
<tr>
	<th colspan="4">댓글 상세 내용</th>
</tr>
<tr>
	<td colspan="4">
	<textarea name="" id="" cols="200" rows="10" readonly style="resize:none;">${report.CContent }</textarea>	
	</td>
</tr>
<tr>
	<td colspan="4">
		<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#handleModal">처리하기</button> &nbsp;
	</td>
</tr>
</table>
</div></div>
<!-- the modal -->
<div class="modal fade" id="handleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">어떻게 처리하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/admin/reportUpdate.do">
        <input type="hidden" id="rcId" name="rcId" value="${report.rcId }" />
        <input type="hidden" id="cId" name="cId" value="${report.CId }" />
        <div>
        <p style="color:#a3a3a3; font-size:15px">댓글 처리</p>
        <div class="custom-control custom-checkbox my-2">
		<input type="checkbox" class="custom-control-input" id="customCheck1" name="doDelete" checked>
		<label class="custom-control-label" for="customCheck1">삭제 여부</label>
		&nbsp;&nbsp;&nbsp;

        </div>
		
<div class="form-group">
  <select class="custom-select" name="rcInfo">
    <option value="스팸 / 광고" selected>스팸 / 광고</option>
    <option value="폭력적 또는 혐오스러운 콘텐츠">폭력적 또는 혐오스러운 콘텐츠</option>
    <option value="증오 또는 학대하는 콘텐">증오 또는 학대하는 콘텐츠</option>
    <option value="성적인 콘텐츠">성적인 콘텐츠</option>
    <option value="기타">기타</option>
  </select>
</div>

		
        </div>
        <br />
        <div>
        <p style="color:#a3a3a3; font-size:15px">회원 처리</p>
        <p style="font-size:15px; font-weight:bold;">${report.tnickName} (경고 ${report.warn_cnt}회)</p>
        <input type="hidden" name="warn_cnt" value=" ${report.warn_cnt }" />
<div class="form-group">
  <select class="custom-select" style="width:">
    <option value="1" selected>경고</option>
  </select>
</div>
        </div>
              <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info" onclick="reject();">Reject</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
</form>
</div>
</div>
</div></div>

<script>

function reject(){
	$.ajax({
		url : '${pageContext.request.contextPath}/admin/reportReject.do',
		data : {rcId : $('#rcId').val()},
		success : function(data){
			
		}
	});
}

</script>

<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>