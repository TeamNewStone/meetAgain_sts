<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="java.util.*, com.kh.meetAgain.sgroup.model.vo.*, com.kh.meetAgain.member.model.vo.*"%>

<c:import url="/WEB-INF/views/common/header.jsp" />

<br>
<br>
<br>
<br>
<div class="container" style="taxt-align: center;">
	<div class="row">
		<div class="col-12">
			<div class="content" align="center">
				<div class="read-top">
					<div class="subject">${Gboard.gbTitle}</div>
					<div id="noticeDate">${Gboard.gbDate}</div>
				</div>
				<div class="read-md">
					<input type="hidden" id="gbContent" value="${Gboard.gbContent}" />
					<br> <br>
					<p>${Gboard.gbContent}</p>

				</div>
				<br> <br> <br> <br> <br>
				<div class="col-3"></div>
				<div class="col-3"></div>
				<div class="col-3"></div>
				<div class="col-3">
					<a class="btn_1" onclick="goDelete()">삭제하기</a>
					<a class="btn_1" onclick="goUpdate()">수정하기</a>
<%-- 					<a class="btn_1 checkout_btn_1" href="<%=request.getContextPath()%>/sgroup/groupBoard.do?gId=${gb.getGId()}">메뉴로 돌아가기</a> --%>

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
								value="0" /> <input type="hidden" name="cDel" value="N" />
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
							<c:forEach var="gbc" items="${ list }">
								<%-- 댓글 목록이 있다면 --%>
								<table id="replySelectTable"
									style="margin-left : (${gbc.getCLevel()} - 1) * 15}px;
										   width : ${800 - ((bco.clevel - 1) * 15)}px;"
									class="replyList${gbc.getCLevel()}">
									<tr>
										<td rowspan="2"></td>
										<td>${gbc.getCDate()}</td>
										<td align="center"><c:if
												test="${ member.userId eq gbc.getUserId()}">
												<input type="hidden" name="cId" value="${gbc.getCId()}" />

												<button type="button" class="updateBtn"
													onclick="updateReply(this);">수정하기</button>

												<button type="button" class="updateConfirm"
													onclick="updateConfirm(this);" style="display: none;">수정완료</button> &nbsp;&nbsp;
												<button type="button" class="deleteBtn"
													onclick="deleteReply(this);">삭제하기</button>
											</c:if> <c:if
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
<script>
	function goGboard() {
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoard.do"
	}
	function goUpdate() {
		var gbId = $
		{
			Gboard.gbId
		}
		;
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardUpdate.do?gbId="
				+ gbId;
	}
	function goDelete() {
		var gbId = $
		{
			Gboard.gbId
		}
		;
		location.href = "${ pageContext.request.contextPath}/sgroup/groupBoardDelete.do?gbId="
				+ gbId;
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

		location.href = "${ pageContext.request.contextPath}/sgroup/commentUpdate.do?"
				+ "cId=" + cId + "&gbId=" + gbId + "&cContent=" + content;
	}

	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cId = $(obj).siblings('input').val();

		// 게시글 번호 가져오기
		var gbId = "${Gboard.gbId}";

		location.href = "${ pageContext.request.contextPath}/sgroup/commentDelete.do"
				+ "?cId=" + cId;
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