<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
	<title>이용자 동의 후 개인정보를 추가 수집하는 경우</title>
	<style type="text/css">
		*{ margin:0; padding:0; font-size:12px; font-family: '나눔고딕', NanumGothic, '맑은 고딕', 'Malgun Gothic', '돋움', Dotum, '굴림', Gulim, sans-serif;}
		img,
		fieldset{ border:none;}
		legend{ display:none;}
		em{ font-style:normal;}
		select{ height:19px;}

		/* Layout */
		#wrap {
			position:relative;
			overflow:hidden;
			width:100%;
			min-width:320px;
			max-width:880px;
		}
		#header {
			position: relative;
			background:url(https://s.pstatic.net/static/rules/bg_header.gif) repeat-x left top;
			height:35px;
		}
		#content {
			padding:20px 0 12px;
			border-bottom:1px solid #e4e4e4;
		}
		.headerline {
			margin-top:-2px;
			padding:0 0 11px 2px;
			color:#444;
		}
		.headerline p {
			line-height:18px;
		}
		.headerline .str1 {
			color:#258102;
		}
		.m_contents {
			height:655px;
			padding: 1px 15px 0;
			overflow:auto;
			-webkit-overflow-scrolling: touch;
		}
		.inner_border {
			padding: 14px 7px 6px;
			color:#444;
		}
		.inner_border .list1 {
			margin-bottom:8px;
		}
		.inner_border ul {
			margin-top:4px;
		}
		.inner_border li {
			list-style:none;
			padding-left:9px;
			padding-bottom:3px;
			background:url(https://s.pstatic.net/static/rules/bu_dot.gif) no-repeat 1px 5px;
			line-height:18px;
		}
		#footer{
			border-top:3px solid #f9f9f9;
			text-align:center;
			padding:7px 0 15px 0;
			margin:0 20px;
		}
		#footer * { vertical-align:top;}
		#footer input{ margin:0 1px 0 0;}
		#footer .ing{ padding:8px 0 0 0;}
		#footer .company{ display: none}

		@media only screen and (max-width: 1024px) {
			#wrap {
				max-width: 100%;
			}

			#content {
				max-width: 460px;
				margin: 0 auto;
				padding: 0 12px 38px;
				border-bottom: 0;
			}

			.m_contents {
				padding: 20px 0 0;
				height: 100%;
			}

			#footer {
				height: 53px;
				background-color: #f4f4f4;
				border-top: 1px solid #cdccd1;
				padding: 0;
				margin: 0;
			}

			#footer .company {
				display: block;
				line-height: 53px;
				font-size: 12px;
				color: #9f9f9f;
			}

			#footer .btn_close {
				display: none;
			}
		}



		/* Content */
		.btn_back {
			display: none;
		}
		h1 {
			position: relative;
			font-size: 13px;
			font-weight: bold;
			color:#ffffff;
			padding:11px 0 0 24px;
		}
		h1:before {
			content: '';
			display: inline-block;
			position: absolute;
			left: 15px;
			width: 5px;
			height: 7px;
			margin-top: 4px;
			background:url(https://s.pstatic.net/static/rules/bu_h1.gif);
		}
		h2{ color:#444;}
		h2 strong{ color:#268102;}
		h3{ padding:0 0 0 14px; color:#444; background:url(https://s.pstatic.net/static/rules/bu_h3.gif) no-repeat 1px 0;}

		.tbl_type {border-collapse:collapse;}
		.tbl_type caption{visibility:hidden;top:0;left:0;overflow:hidden;width:0;height:0;font-size:0;line-height:0}
		.tbl_type td, th {padding:7px 7px 3px 7px; border:1px solid #ccc;}
		.tbl_type th {background:#f7f7f7; text-align:center;}

		@media only screen and (max-width: 1024px) {
			h1{
				padding: 11px 0 0 0;
				text-align: center;
			}
			h1:before {
				content: none;
			}
			.tbl_type td, th {
				padding: 13px 14px 10px;
			}
			.btn_back {
				display: block;
				width: 35px;
				height: 35px;
				position: absolute;
				left: 6px;
				background: url(https://static.nid.naver.com/images/ui/myinfo/m_sp_member_20170807.png) -8px -248px;
				-webkit-background-size: 150px auto;
				background-size: 150px auto;
			}
		}
	</style>
</head>
<body cz-shortcut-listen="true" style="">
<div id="wrap" class="w360">
	<div id="header"><a href="javascript:history.back();" class="btn_back" alt="뒤로가기 버튼"></a>
		<h1>이용자 동의 후 개인정보를 추가 수집하는 경우</h1>
	</div>
	<div id="content">
		<div class="m_contents">
			<div class="headerline">
				<p><strong class="str1">개인정보 추가 수집에 대한 동의</strong>란, <strong class="str2">네이버 아이디를 이용한 부가서비스 및 맞춤식 서비스 이용시 또는 이벤트 응모 과정에서 회원가입시 수집하지 않았던 개인정보를 추가로 수집할 때에 이용자들에게 고지하고 동의를 받는 경우</strong>를 말합니다.</p>
			</div>
			<div class="inner_border">
				<table cellpadding="0" cellspacing="0" class="tbl_type" style="height: 2842px;"><caption>서비스별 수집하는 개인정보 항목</caption>
					<thead>
					<tr style="height: 14px;">
						<th scope="col" style="height: 14px; width: 69px;">서비스명</th>
						<th scope="col" style="height: 14px; width: 766px;">수집하는 개인정보 항목</th>
					</tr>
					</thead>
					<tbody>
					<tr style="height: 154px;">
						<td style="height: 154px; width: 69px;">고객센터</td>
						<td style="height: 154px; width: 766px;">&lt;게시중단 요청 서비스&gt;<br>- 접수자 정보: [필수] 이름, 휴대전화번호, 이메일주소, [선택] 주소<br>- 대상자 정보: [필수] 이름, (휴대)전화번호, 신분증 사본, 위임장 (접수자와 대상자가 동일인일 경우, 대상자 정보를 별도로 수집하지 않음)<br>- 위임장 정보: 위임인의 성명/생년월일/(휴대)전화번호/주소, 대리인의 성명/생년월일/주소<br><br>&lt;문의하기/신고하기&gt;<br>- 전화고객센터 : 발신전화번호<br>- 웹고객센터 : 이메일 주소<br><br>※ 고객센터로 문의/신고 시 위와 같은 정보를 수집할 수 있으며, 문의/신고 유형에 따라 휴대폰 번호, 신분증 사본 등 회원님께서 추가로 입력하시는 개인정보가 있을 수 있습니다</td>
					</tr>
					<tr style="height: 98px;">
						<td style="height: 98px; width: 69px;">그라폴리오 후원</td>
						<td style="height: 98px; width: 766px;">
							<p>&lt;창작자센터 가입(개인)&gt;</p>
							<p>[필수] : 이름, 이메일주소, 휴대전화번호, 계좌정보(예금주, 은행명, 계좌번호), 주민등록번호 (단, 계좌정보와 주민등록번호는 정산이 필요한 시점에서 세법 등 관련 법령에 의해 수집함)</p>
							<p>&nbsp;</p>
							<p>&lt;창작자센터 가입(사업자)&gt;</p>
							[필수] 업체명, 대표자명, 이메일주소, 휴대전화번호, 사업자 주소, 계좌정보(예금주, 은행명, 계좌번호), 사업자등록증 사본, 입금계좌신고서(법인사업자에 한해 수집하며, 담당자 이름/(휴대)전화번호/이메일주소가 포함됨)</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 카페</td>
						<td style="height: 28px; width: 766px;">
							<p>&lt;중고나라 상품거래 게시글 작성 시&gt;</p>
							[선택] 상품거래 게시글에 포함된 판매자 연락처 정보(유무선 전화번호 및 네이버/카카오톡/구글 등의 ID)</td>
					</tr>
					<tr style="height: 126px;">
						<td style="height: 126px; width: 69px;">네이버 게임 &gt;<br>채널링 연동 센터</td>
						<td style="height: 126px; width: 766px;">&lt;퍼블리셔 등록&gt;<br>[필수] 관리자 휴대전화번호, 퍼블리셔명(개발사)<br><br>&lt;개발자 등록&gt;<br>[필수] 성명, 이메일, 휴대전화번호<br>[선택] 직책(급), 유선전화<br><br>&lt;게임 등록&gt;<br>[필수] 정산담당자, 장애 모니터 수신인, CS담당자의 이름•이메일주소•(휴대)전화번호</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 블로그</td>
						<td style="height: 28px; width: 766px;">
							<p>&lt;모바일 홈소개&gt;</p>
							<p>[선택] 주소, (휴대)전화번호&nbsp;</p>
						</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 쇼핑</td>
						<td style="height: 28px; width: 766px;">
							<p>&lt;내 사이즈 등록&gt;</p>
							<p>[선택] 키, 체중, 신발/상의/하의 사이즈</p>
						</td>
					</tr>
					<tr style="height: 42px;">
						<td style="height: 42px; width: 69px;">네이버 스마트플레이스</td>
						<td style="height: 42px; width: 766px;">휴대전화번호(업체 전화번호에 휴대전화번호 입력 시에만 수집)</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 열린연단</td>
						<td style="height: 28px; width: 766px;">[필수] 이름, (휴대)전화번호, 이메일 주소, 성별, 연령대</td>
					</tr>
					<tr style="height: 70px;">
						<td style="height: 70px; width: 69px;">헬로! 아티스트</td>
						<td style="height: 70px; width: 766px;">
							<p>&lt;작가 신청&gt;</p>
							<p>[필수] 이름, 휴대전화번호, 이메일 주소, 학력</p>
							<p></p>
							<p>&lt;작가 등록&gt;</p>
							[필수] 이름, 휴대전화번호, 주소</td>
					</tr>
					<tr style="height: 70px;">
						<td style="height: 70px; width: 69px;">온스테이지</td>
						<td style="height: 70px; width: 766px;">
							<p>&lt;뮤지션 신청&gt;</p>
							<p>[필수] 이름, 휴대전화번호, 이메일 주소</p>
							<p></p>
							<p>&lt;뮤지션 등록&gt;</p>
							[필수] 이메일 주소, 이름, 휴대전화번호, 소속회사, 담당자 휴대전화번호, 담당자 이름, 담당자 이메일 주소</td>
					</tr>
					<tr style="height: 112px;">
						<td style="height: 112px; width: 69px;">네이버 예약</td>
						<td style="height: 112px; width: 766px;">
							<p>&lt;예약자 정보&gt;<br>[필수] 이름, (휴대)전화번호, 주소(배송, 방문 등 필요한 경우에 한함)<br>[선택] 이메일주소</p>
							<p>※ (해외 이용자의 비회원 예약 시) [필수] 이름, 이메일 주소, [선택] (휴대)전화번호<br><br>&lt;파트너센터 업체정보 등록&gt;<br>[필수] 이메일 주소, 휴대전화번호, 유선전화번호, 업체정보(대표자명, 업체명, 주소)<br>[선택] 사업자등록증, 통신판매업 신고증, 알림 수신용 연락처(이메일 주소, 휴대전화번호)</p>
						</td>
					</tr>
					<tr style="height: 56px;">
						<td style="height: 56px; width: 69px;">네이버 개발자센터<br>&gt; API 제휴신청</td>
						<td style="height: 56px; width: 766px;">[필수] 회사이름</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 지도</td>
						<td style="height: 28px; width: 766px;">
							<p>&lt;즐겨찾기&gt;</p>
							[선택] 집, 회사(또는 학교) 주소</td>
					</tr>
					<tr style="height: 126px;">
						<td style="height: 126px; width: 69px;">네이버 톡톡<br>파트너센터</td>
						<td style="height: 126px; width: 766px;">&lt;서비스 가입&gt;<br>[필수] 휴대전화번호, 이메일 주소<br><br>&lt;프로필 등록&gt;<br>[필수] 이미지, 프로필명<br>[선택] 주소, (휴대)전화번호, 홈페이지 주소<br><br>&lt;대표계정 등록&gt;<br>대표자명, 증빙서류(유형에 따라 사업자등록증, 해외사업자등록증과 대표자 신분증, 고유번호증 중 1)</td>
					</tr>
					<tr style="height: 56px;">
						<td style="height: 56px; width: 69px;">메일 &gt; 외부<br>메일 등록하기</td>
						<td style="height: 56px; width: 766px;">외부메일의 아이디(또는 이메일 주소), 비밀번호</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">모바일 인증</td>
						<td style="height: 28px; width: 766px;">휴대전화번호</td>
					</tr>
					<tr style="height: 168px;">
						<td style="height: 168px; width: 69px;">뮤지션 리그</td>
						<td style="height: 168px; width: 766px;">
							<p>&lt;서비스 가입&gt;</p>
							<p>- [필수] 뮤지션의 성명, 프로필 이미지</p>
							<p>&nbsp;</p>
							<p>&lt;뮤지션리그 마켓(개인)&gt;</p>
							<p>- 기본정보: [필수] 국가, 이름, 주소, 주민등록번호 또는 외국인등록번호<br>- 담당자 정보: [필수] 이름, 전화번호, 이메일 주소<br>- 거래처등록서류: [필수] 신분증사본</p>
							<p>&nbsp;</p>
							<p>&lt;뮤지션리그 마켓(사업자)&gt;</p>
							- 기본정보: [필수] 국가, 대표자명, 주소<br>- 담당자 정보: [필수] 이름, 전화번호, 이메일 주소<br>- 거래처등록서류: [필수] 사업자등록증</td>
					</tr>
					<tr style="height: 14px;">
						<td style="height: 14px; width: 69px;">본인확인</td>
						<td style="height: 14px; width: 766px;">이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대전화번호 및 통신사(휴대폰 인증시), 내/외국인 정보</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">부동산 관리센터</td>
						<td style="height: 28px; width: 766px;">개설등록증, 사업자등록증, 대표자명, 중개업소 연락처(대표 전화번호 및 휴대전화번호), 프로필사진</td>
					</tr>
					<tr style="height: 56px;">
						<td style="height: 56px; width: 69px;">빌링</td>
						<td style="height: 56px; width: 766px;">- 신용카드 결제 시: 카드사명, 카드번호(일부) 등<br>- 휴대전화 결제 시: 이동전화번호, 통신사, 결제 승인번호 등<br>- 계좌이체 시: 은행명, 계좌번호 등<br>- 상품권 이용 시: 상품권 번호</td>
					</tr>
					<tr style="height: 98px;">
						<td style="height: 98px; width: 69px;">애드포스트</td>
						<td style="height: 98px; width: 766px;">&lt;개인 회원&gt;<br>[필수] 이메일 주소, 주소, 주민번호 또는 외국인등록번호(세법에 따라 매출 발생 이후 수집)<br>[선택] 은행 계좌정보(계좌주명, 은행명, 계좌번호), 휴대전화번호<br><br>&lt;사업자 회원&gt;<br>[필수] 업체명, 대표자명, 이메일 주소, 주소<br>[선택] 휴대전화번호, 계좌정보(계좌주명, 은행명, 계좌번호), 대표 전화번호, 대표 팩스번호, 사업자등록증 사본, (법인의 경우) 법인인감증명서</td>
					</tr>
					<tr style="height: 42px;">
						<td style="height: 42px; width: 69px;">이벤트 당첨 시<br>경품배송</td>
						<td style="height: 42px; width: 766px;">- 모바일 상품: 휴대폰 번호<br>- 배송 상품: 주소, 전화번호</td>
					</tr>
					<tr style="height: 350px;">
						<td style="height: 350px; width: 69px;">인물검색<br>본인참여 서비스</td>
						<td style="height: 350px; width: 766px;">
							<p>&lt;서비스 이용 동의&gt;<br>- [필수] 이메일주소, [선택] 휴대전화번호</p>
							<p></p>
							<p>&lt;신청자 정보 확인&gt;<br>- 본인일 경우 : 휴대전화 및 아이핀을 이용한 본인인증(이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대전화번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보가 회원정보에 입력됩니다.), 신분증 사본을 이용한 본인인증(주민등록번호 후반의 7자리와 주소는 마스킹 처리)</p>
							<p>- 가족일 경우 : 위임장(위임인 이름/생년월일/성별/전화번호/이메일주소/예명 또는 그룹명, 대리인 이름/생년월일/전화번호/이메일주소/네이버 ID), 위임인 및 대리인의 신분증 사본(주민등록번호 후반의 7자리와 주소는 마스킹 처리), 관계증빙 서류(위임인의 인감증명서 또는 본인서명사실확인서 중 택일)<br>- 관계자일 경우 : 소속사(팀) 이름, 위임장(위임인 이름/생년월일/성별/전화번호/이메일주소/예명 또는 그룹명, 대리인 이름/생년월일/전화번호/이메일주소/네이버 ID), 위임인 및 대리인의 신분증 사본(주민등록번호 후반의 7자리와 주소는 마스킹 처리), 관계증빙 서류(대리인의 재직증명서, 위임인의 인감증명서 또는 본인서명사실확인서 중 택일)</p>
							<p>- 기타 대리인일 경우 : 위임장(위임인 이름/생년월일/성별/전화번호/이메일주소/예명 또는 그룹명, 대리인 이름/생년월일/전화번호/이메일주소/네이버 ID), 위임인 및 대리인의 신분증 사본(주민등록번호 후반의 7자리와 주소는 마스킹 처리), 위임인의 인감증명서 또는 본인서명사실확인서</p>
							<p></p>
							<p>* 등록되는 인물이 미성년자인 경우 : 주민등록등본, 가족관계증명서 등 법정대리인의 법정대리관계를 확인할 수 있는 서류</p>
							<p></p>
							<p>&lt;인물정보 관리&gt;<br>- 연예인: [필수] 이름(대표명), 직업, 작품<br>- 그 외 직업군: [필수] 이름(대표명), 직업, 소속, 경력사항<br>- [선택] 이미지, 이름(한자명, 본명), 생년월일/사망년월일, 신체정보(키, 몸무게, 성별, 혈액형), 출생지, 종교, 가족사항, 데뷔, 학력사항, 수상내역, 사이트(공식사이트, 블로그, 트위터, 페이스북, 미니홈피, 유튜브, 인스타그램 등)<br>- 인물정보 기재를 위해 제출한 증빙자료(제출한 자료에 따라 인물 정보로 등록되는 개인정보가 포함될 수 있음)</p>
						</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">주소록</td>
						<td style="height: 28px; width: 766px;">&lt;암호잠금 이용 시&gt; 이메일 주소</td>
					</tr>
					<tr style="height: 14px;">
						<td style="height: 14px; width: 69px;">쥬니버앱</td>
						<td style="height: 14px; width: 766px;">아이의 애칭, 성별, 생년월일(생일),&nbsp;아이 또는 가족 등의 얼굴 사진</td>
					</tr>
					<tr style="height: 42px;">
						<td style="height: 42px; width: 69px;">지식iN &gt; 파트너센터</td>
						<td style="height: 42px; width: 766px;">[필수] 제안자명, 이메일 주소, 전화번호, 신청서<br>[선택] 지식iN에 답변한 네이버 ID</td>
					</tr>
					<tr style="height: 98px;">
						<td style="height: 98px; width: 69px;">포스트 후원</td>
						<td style="height: 98px; width: 766px;">
							<p>&lt;창작자센터 가입&gt;<br>1. 개인<br>[필수] : 이름, 이메일주소, 휴대전화번호, 계좌정보(예금주, 은행명, 계좌번호), 주민등록번호 (단, 계좌정보와 주민등록번호는 정산이 필요한 시점에서 수집함)</p>
							<p>2. 사업자<br>[필수] 업체명, 대표자명, 이메일주소, 휴대전화번호, 사업자 주소, 계좌정보(예금주, 은행명, 계좌번호), 사업자등록증 사본, 입금계좌신고서(법인사업자에 한해 수집하며, 담당자 이름/(휴대)전화번호/이메일주소가 포함됨)</p>
						</td>
					</tr>
					<tr style="height: 224px;">
						<td style="height: 224px; width: 69px;">네이버TV &gt; 크리에이터 스튜디오</td>
						<td style="height: 224px; width: 766px;">
							<p>&lt;채널 개설 시&gt;<br>[선택] 운영자 닉네임</p>
							<p></p>
							<br>
							<p>&lt;정산 요청 시&gt;<br>- 법인/개인사업자의 경우: [필수]사업자 정보(대표자명, 주소), 정산 신청자 정보(이름, 전화번호, 이메일주소), 계좌정보(은행명, 계좌번호, 예금주 이름), 사업자등록증, 통장사본<br>- 개인의 경우: [필수]이름, 주민등록번호(또는 외국인 등록번호), 거주국가, 주소, 정산 신청자 정보(이름, 전화번호, 이메일 주소), 계좌정보(은행명, 계좌번호, 예금주 이름), 주민등록증(또는 외국인등록증, 여권) 사본, 통장사본,&nbsp;만19세 미만 미성년자의 경우에는 법정대리인 동의서(이름, 생년월일, 주소, 전화번호, 미성년자와의 관계) 및 신분증(주민등록증, 운전면허증, 외국인등록증, 여권) 사본</p>
						</td>
					</tr>
					<tr style="height: 98px;">
						<td style="height: 98px; width: 69px;">클로바</td>
						<td style="height: 98px; width: 766px;">
							<p>[필수] 서비스 실행 및 청취 모드 상태에서의 이용자 음성명령 언어 정보, 단말기 주소록에 저장된 이름, 위치정보(GPS), 주문정보, 로그기록, 서비스 이용기록 등 서비스 이용 과정에서 자동으로 생성되는 정보 <br>[선택] 주소정보</p>
							<p></p>
							<p>&lt;아이 정보 등록 시&gt;</p>
							<p>[필수] 이름, 생년월일, 성별</p>
							<p>[선택] 학교정보(학교명)</p>
						</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 클라우드</td>
						<td style="height: 28px; width: 766px;">
							<p>콘텐츠 內 객체(인물, 동물, 식물, 사물, 배경 등) 정보(원본 정보 및 특징 정보), 메타 데이터 정보</p>
						</td>
					</tr>
					<tr style="height: 210px;">
						<td style="height: 210px; width: 69px;">해피빈</td>
						<td style="height: 210px; width: 766px;">&lt;해피로그 신청 시&gt;<br>- 신청 시: [필수] 단체정보(대표자 이름, 대표자 약력), 담당자 이름, 담당자 직통 전화번호, 담당자 (휴대)전화번호, 담당자 이메일 주소<br>- 승인 후: [필수] 담당자 이름, 담당자 직통전화번호, 담당자 (휴대)전화번호, 담당자 이메일주소<br><br>&lt;펀딩 개설&gt;<br>[필수] 담당자 이름, (휴대)전화번호<br><br>&lt;펀딩 후원&gt;<br>[선택] 이름, 주소, (휴대)전화번호, 주민등록번호(기부금 영수증 발급 희망 시)<br><br>&lt;기부금 영수증 발급&gt;<br>[필수] 이름, 주민등록번호​​<br><br>&lt;제휴 제안 신청​&gt;<br>[필수] 회사(기관)명, 담당자 이름, (휴대)전화번호​</td>
					</tr>
					<tr style="height: 56px;">
						<td style="height: 56px; width: 69px;">QR코드<br>서비스 &gt; 연락처<br>첨부하기</td>
						<td style="height: 56px; width: 766px;">[선택] 이름, 휴대폰 번호, 전화번호, 사진, 팩스번호, 이메일 주소, 홈페이지 주소, 회사명, 주소</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">오디오 클립</td>
						<td style="height: 28px; width: 766px;">
							<p>&lt;소리 스튜디오 가입 시&gt;<br>[필수] 회사(기관)명(법인, 개인사업자에 한해 수집), 이름, 아이디, 이메일주소, 전화번호</p>
						</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">네이버 친구 서비스</td>
						<td style="height: 28px; width: 766px;">
							<p>휴대전화 주소록에 저장된 지인 연락처 정보(이름 및 (휴대)전화번호)</p>
						</td>
					</tr>
					<tr style="height: 28px;">
						<td style="height: 28px; width: 69px;">그라폴리오</td>
						<td style="height: 28px; width: 766px;">
							<p>[필수] 이름, 영문명, 이메일, 프로필이미지<br>[선택] 국가, 공개이메일</p>
						</td>
					</tr>
					<tr style="height: 98px;">
						<td style="width: 69px; height: 98px;">지식iN eXpert</td>
						<td style="width: 766px; height: 98px;">
							<p>&lt;개인 상담자&gt;</p>
							<p>[필수] 상담분야, 소속제휴사, 사업장주소, 이메일 주소, 고객센터 전화번호, 담당자 정보(담당자명, 휴대전화번호, 이메일주소), 매출 발생 이후 주민등록번호 ,계좌정보(은행명, 예금주명, 계좌번호), 증빙서류(통장/주민등록증 사본)</p>
							<p></p>
							<p>&lt;사업자 상담자&gt;</p>
							<p>[필수] 상담분야, 소속제휴사, 대표자명, 사업장 주소, 이메일 주소, 고객센터 전화번호, 계좌정보(은행명, 예금주명, 계좌번호), 증빙서류(통장사본/인감증명서/사업자등록증 사본), 담당자 정보(담당자명, 휴대전화번호, 이메일 주소) [선택] 통신판매업신고증 사본</p>
						</td>
					</tr>
					<tr style="height: 14px;">
						<td style="width: 69px; height: 14px;">셀렉티브</td>
						<td style="width: 766px; height: 14px;">
							<p>이메일주소, 연락처, SNS URL</p>
						</td>
					</tr>
					<tr style="height: 14px;">
						<td style="width: 69px; height: 14px;">인플루언서</td>
						<td style="width: 766px; height: 14px;">
							<p>인플루언서 서비스 아이디, 닉네임</p>
						</td>
					</tr>
					<tr>
						<td style="width: 69px;">클로바더빙</td>
						<td style="width: 766px;">
							<p>이름(또는 기업명), 직업</p>
						</td>
					</tr>
					</tbody>
				</table>
				<br><br>
				<p></p>
				<div class="headerline">
					<p><strong class="str2">네이버에 로그인하지 않거나, 회원이 아니어도 네이버에서 제공하는 다양한 부가서비스를 이용할 수 있으며, 이 과정에서 개인정보를 추가로 수집하는 경우 이용자에게 고지하고 동의를 받고 있습니다.</strong></p>
				</div>
				<div class="inner_border">
					<table cellpadding="0" cellspacing="0" class="tbl_type" style="height: 20px;"><caption>서비스별 수집하는 개인정보 항목</caption>
						<thead>
						<tr style="height: 14px;">
							<th scope="col" style="height: 14px; width: 69px;">서비스명</th>
							<th scope="col" style="height: 14px; width: 766px;">개인정보 수집 및 이용</th>
						</tr>
						</thead>
						<tbody>
						<tr style="height: 80px;">
							<td style="height: 80px; width: 69px;">Clova Speech</td>
							<td style="height: 80px; width: 766px;">* 수집하는 개인정보 항목 : 신청정보([필수] 이름 또는 기업명, 이메일주소 [선택] 직업, 관심 활용 분야, 기업 형태), 음성정보<br>* 개인정보의 수집 및 이용 목적 : 신청정보 - 음성 인식 기능 사용자 확인 및 연락, 음성 인식 기능 사용자 분석 및 통계, 음성정보 - 음성 인식 기능 체험 경험 제공<br>* 개인정보의 이용 및 보유기간 : 신청정보 - 1년간 보관 후 파기, 음성정보 - 음성 인식 기능 제공 후 별도 보관없이 지체없이(일주일 이내) 파기</td>
						</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<div id="footer"><a href="#" onclick="window.close();" class="btn_close"><img src="https://s.pstatic.net/static/rules/btn_close.gif" alt="닫기" width="40" height="23"></a> <span class="company">© NAVER Corp.</span></div>
	</div>
	<div id="footer"><a href="#" onclick="window.close();" class="btn_close"><img src="https://s.pstatic.net/static/rules/btn_close.gif" alt="닫기" width="40" height="23"></a> <span class="company">© NAVER Corp.</span></div>
</div>
<p>
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">   if(!wcs_add) var wcs_add = {};   wcs_add['wa'] = '8571383a2f3640';   wcs_do(); </script>
</p>
<script type='text/javascript' src='//wcs.naver.net/wcslog.js'></script> <script type='text/javascript'>   if(!wcs_add) var wcs_add = {};   wcs_add['wa'] = '8571383a2f3640';   wcs_do(); </script></body>
</html>
