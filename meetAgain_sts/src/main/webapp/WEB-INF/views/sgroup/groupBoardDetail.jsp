<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="java.util.*, com.kh.meetAgain.sgroup.model.vo.*, com.kh.meetAgain.member.model.vo.*"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="container" style="taxt-align: center;">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />
	<div class="row">
		<div class="col-12">
			<div class="content" align="center">
				<div class="read-top">
					<div class="subject" name="gbTitle">${Gboard.gbTitle}</div>
					<div id="noticeDate">${Gboard.gbDate}</div>
				</div>
					<%-- <input type="hidden" id="gbContent" value="${Gboard.gbContent}" /> --%>
				<div class="read-md">
					<br> <br>
					<p>${Gboard.gbContent}</p>

				</div>
				<br> <br> <br> <br> <br>
				<div class="col-3"></div>
				<div class="col-3"></div>
				<div class="col-3"></div>
				<div class="col-3">

		<c:if test="${member.userId eq Gboard.userId }">
					<a class="btn_1" onclick="goDelete()">삭제하기</a>
        <a class="btn_1" onclick="goUpdate()">수정하기</a>
        </c:if>
        <a class="btn_1 checkout_btn_1" onclick="goBack()">뒤로 가기</a>

				<c:if test="${Gboard.userId ne member.userId }">
				<span data-toggle="modal" data-target="#boardReport">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-circle boardReport" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
				data-toggle="tooltip" data-placement="bottom" title="신고하기">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg>
				</span>
				</c:if>
					<%-- <a class="btn_1 checkout_btn_1" href="<%=request.getContextPath()%>/sgroup/groupBoard.do?gId=${gb.getGId()}">메뉴로 돌아가기</a> --%>


				</div>
				<div class="replyArea">
					<div class="replyWriteArea">
						<form
							action="${pageContext.request.contextPath }/sgroup/insertComment.do"
							method="post">
							<input type="hidden" name="userId" value="${member.userId}" /> <input
								type="hidden" name="gbId" value="${Gboard.gbId}" /> <input
								type="hidden" name="cRef" value="1" /> <input type="hidden"
								name="cLevel" value="1" /> <input type="hidden" name="cRec"
								value="0" /> <input type="hidden" name="cDel" value="N" /> <input
								type="hidden" name="gid" value="${gid}" />
							<table>
								<tr>
									<td><textArea rows="3" cols="80" id="cContent"
											name="cContent" style="resize: none;"></textArea></td>
									<td>
										<button type="submit" class="btn btn-outline-secondary"
											id="group-boardbtn">댓글 등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div id="replySelectArea">
						<!-- 게시글의 댓글 목록 구현부 -->
						<c:if test="${ list.size() ne 0 }">
							<c:forEach var="gbc" items="${ list }" varStatus="st">
								<%-- 댓글 목록이 있다면 --%>
								<table id="replySelectTable"
									style="margin-left : (${gbc.getCLevel()} - 1) * 15}px;
										   width : ${800 - ((bco.clevel - 1) * 15)}px;"
									class="replyList${gbc.getCLevel()}">
									<tr id="${gbc.getCId() }">
										<td rowspan="2"></td>
										<td>${gbc.getCDate()}${member.getNickName()}</td>
										<td align="center"><c:if
												test="${ member.userId eq gbc.getUserId()}">
												<input type="hidden" id="cId-${st.index }" name="cId" value="${gbc.getCId()}" />

												<button type="button" class="updateBtn"
													onclick="updateReply(this);">수정하기</button>
												<button type="button" class="updateConfirm"
													onclick="updateConfirm(this);" style="display: none;">수정완료</button> &nbsp;&nbsp;
												<button type="button" class="deleteBtn"
													onclick="deleteReply(this);">삭제하기</button>
											</c:if> &nbsp;
											<c:if test="${Gboard.userId ne member.userId }">
											<span data-toggle="modal" data-target="#commentReport" id="cReportSpan-${st.index }">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-circle boardReport" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
				data-toggle="tooltip" data-placement="bottom" title="신고하기">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg>
				</span>
				</c:if>
				<script>
				
	$(function(){
		
	$('#cReportSpan-${st.index }').click(function(){
		var cId = $(this).siblings('input').val();
		$('#cId').val(cId);
	});
	})
				</script>
											<c:if
												test="${ member.userId ne gbc.getUserId() and gbc.getCLevel() lt 3}">
												<input type="hidden" name="writer"
													value="${member.nickName}" />
												<input type="hidden" name="cRef" value="${gbc.getCId()}" />
												<input type="hidden" name="cLevel"
													value="${gbc.getCLevel()}" />
												<button type="button" class="btn btn-outline-secondary"
													onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
												<button type="button" class="insertConfirm"
													onclick="reConfirm(this);" style="display: none;">댓글
													추가 완료</button>

											</c:if> <c:if test="${ gbc.getCLevel() eq 3 }">
												<span> 마지막 레벨입니다.</span>
											</c:if></td>
									</tr>
									<tr class="comment replyList${ gbc.getCLevel()}">
										<td colspan="100"
											style="background: transparent; taxt-align: center;"><textarea
												class="form-control" style="resize: none;" cols="85"
												rows="1" readonly="readonly">${ gbc.getCContent()}</textarea>
										</td>
									</tr>
								</table>
							</c:forEach>
						</c:if>
						<c:if test="${ list.size() eq 0 }">
								댓글 목록이 없다면
								<p>
								현재 등록된 댓글의 내용이 없습니다. <br> 첫 댓글의 주인공이 되어 보세요!
							</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
</div>

<!-- 게시글 신고 modal -->
<div class="modal fade" id="boardReport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/sgroup/bReportInsert.do">
        <input type="hidden" name="gbId" value="${Gboard.gbId}" />
        <input type="hidden" name="targetId" value="${Gboard.userId }" />
        <input type="hidden" name="userId" value="${member.userId }" />
        <div>
        <p style="color:#a3a3a3; font-size:15px">신고 사유</p>
		
<div class="form-group">
  <select class="custom-select" name="rcInfo">
    <option value="스팸 / 광고" selected>스팸 / 광고</option>
    <option value="폭력적 또는 혐오스러운 콘텐츠">폭력적 또는 혐오스러운 콘텐츠</option>
    <option value="증오 또는 학대하는 콘텐츠">증오 또는 학대하는 콘텐츠</option>
    <option value="성적인 콘텐츠">성적인 콘텐츠</option>
    <option value="기타">기타</option>
  </select>
</div>

		
        </div>
        <br />
        <div>
        <p style="color:#a3a3a3; font-size:15px">상세 사유</p>
<div class="form-group">
        <textarea name="rcContent" id="rcContent" class="form-control" rows="5" style="resize:none"></textarea>
</div>
        </div>
              <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
        

</form>
</div>
</div>
</div>
</div>


<!-- 댓글 신고 modal -->
<div class="modal fade" id="commentReport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath }/sgroup/cReportInsert.do">
        <input type="hidden" id="cId" name="cId" value="" />
        <input type="hidden" name="gbId" value="${Gboard.gbId}" />
        <input type="hidden" name="targetId" value="${Gboard.userId }" />
        <input type="hidden" name="userId" value="${member.userId }" />
        <div>
        <p style="color:#a3a3a3; font-size:15px">신고 사유</p>
		
<div class="form-group">
  <select class="custom-select" name="rcInfo">
    <option value="스팸 / 광고" selected>스팸 / 광고</option>
    <option value="폭력적 또는 혐오스러운 콘텐츠">폭력적 또는 혐오스러운 콘텐츠</option>
    <option value="증오 또는 학대하는 콘텐츠">증오 또는 학대하는 콘텐츠</option>
    <option value="성적인 콘텐츠">성적인 콘텐츠</option>
    <option value="기타">기타</option>
  </select>
</div>

		
        </div>
        <br />
        <div>
        <p style="color:#a3a3a3; font-size:15px">상세 사유</p>
<div class="form-group">
        <textarea name="rcContent" id="rcContent" class="form-control" rows="5" style="resize:none"></textarea>
</div>
        </div>
              <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
        

</form>
</div>
</div>
</div>
</div>






<script>
	// 	function goGboard() {
	// 		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoard.do"
	// 	}
	function goUpdate() {
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardUpdate.do?gbId="+ ${Gboard.gbId} + "&gid=" + ${gid};
	}
	function goDelete() {
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardDelete.do?gbId="+ ${Gboard.gbId} + "&gid=" + ${gid};
	}
	function goBack() {
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoard.do?gid="+ ${gid};
	}

	function updateReply(obj) {
		// 현재 위치와 가장 근접한 textarea 접근하기
		$(obj).parent().parent().next().find('textarea').removeAttr('readonly');

		// 수정 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.updateConfirm').css('display', 'inline');

		// 수정하기 버튼 숨기기
		$(obj).css('display', 'none');
	}

	function updateConfirm(obj) {
		// 댓글의 내용 가져오기
		var content = $(obj).parent().parent().next().find('textarea').val();

		// 댓글의 번호 가져오기
		var cId = $(obj).siblings('input').val();

		// 게시글 번호 가져오기
		var gbId = "${Gboard.gbId}";

		location.href = "${ pageContext.request.contextPath}/sgroup/commentUpdate.do?gid="+${gid}+"&cId=" + cId + "&gbId=" + gbId + "&cContent=" + content;
		}

	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cId = $(obj).siblings('input').val();

		// 게시글 번호 가져오기
		var gbId = "${Gboard.gbId}";

		location.href = "${ pageContext.request.contextPath}/sgroup/commentDelete.do?cId="
				+ cId + "&gbId=" + gbId + "&gid=" + ${gid};
		}

	function reComment(obj) {
		// 추가 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.insertConfirm').css('display', 'inline');

		// 클릭한 버튼 숨기기
		$(obj).css('display', 'none');

		// 내용 입력 공간 만들기
		var htmlForm = '<tr class="comment"><td></td>'
				+ '<td colspan="3" style="background : transparent;">'
				+ '<textarea class="reply-content" style="background : white; resize:none;" cols="105" rows="2"></textarea>'
				+ '</td>' + '</tr>';

		$(obj).parents('table').append(htmlForm);

	}

	function reConfirm(obj) {
		// 댓글의 내용 가져오기

		// 참조할 댓글의 번호 가져오기
		var cRef = $(obj).siblings('input[name="cRef"]').val();
		var cLevel = Number($(obj).siblings('input[name="cLevel"]').val()) + 1;

		console.log(cRef + " : " + cLevel);

		// 게시글 번호 가져오기
		var gbId = "${Gboard.gbId}";
		;
		var parent = $(obj).parent().parent();
		var grandparent = parent.parent();
		var siblingsTR = grandparent.siblings().last();

		var content = siblingsTR.find('textarea').val();

		location.href = "${ pageContext.request.contextPath}/sgroup/insertComment.do"
				+ '?getUserId='
				+ getUserId
				+ '&replyContent='
				+ cContent
				+ '&gbId=' + gbId + '&cRef=' + cRef + '&cLevel=' + cLevel;
	}
</script>

<script>
	console.log("${list}");
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />