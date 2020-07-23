<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />
<br />
<br />
<br />
<br />
<div class="container" style="taxt-align: center;">
	<div class="row">
		<div class="col-12">
			<div class="content">
				<div class="read-top">
					<div class="subject">이벤트 안내</div>
					<div id="noticeDate">2020.07.01</div>
				</div>
				<div class="read-bt">
					2020년 5월 18일 동아제약 공식 브랜드몰 :Dmall 디몰이 그랜드 오픈 하였습니다.<br />
					'건강한 삶' 의 기준을 만들고자<br />
					끝없이 고민하는 동아제약 브랜드의 생각과<br />
					
					일상의 소중함을 일깨워 주는 소소하지만 공감가는<br />
					우리들의 이야기를 전하고자 합니다.<br />
					반복되는 일상 속, 순간마다 느끼는 감정과 상황들이<br />
					익숙하지만 늘 설레이고픈 당신을 위해<br />
					디몰이 하루를 시작할 수 있는 에너지와 건강을 드릴게요.<br />
					오늘도 스마일  :D몰 하세요~*<br />
					자꾸 만나고 싶은 :D몰이 될게요~*
				</div>
			</div>
		</div>
	</div>
	<br />
	<div id="noticeBtn">
			<!-- 수정하기 버튼은 admin만 보이게! -->
			<button type="button" class="btn btn-outline-secondary">수정하기</button>
			<button type="button" class="btn btn-secondary" onclick="goNotice();">돌아가기</button>
	</div>
</div>
<script>
	function goNotice(){
		location.href="${ pageContext.request.contextPath }/views/board/notice.jsp"
	}
</script>
<br />
<br />
<br />
<br />
<br />
<c:import url="/views/common/footer.jsp" />