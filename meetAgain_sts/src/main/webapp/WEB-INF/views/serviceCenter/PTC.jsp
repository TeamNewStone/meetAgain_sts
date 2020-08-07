<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
ul li {
  list-style-type:none;  
}
</style>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="container">
<div class="intro">
<div class="row">
<div class="col-12">
<h2>다시만나 개인정보 취급방침</h2>
<br />
<div class="section">
<h5>1. 수집하는 개인정보의 항목 및 수집방법</h5><br />
			<h6>가. 수집하는 개인정보의 항목</h6>
			<p class="depth2">첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.</p>
			
			<p class="depth2">&lt;회원가입&gt;</p>
			<ul class="depth2 ex">
				<li><span class="first_letter">-</span> 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호, 만14세 미만 아동의 경우 법정대리인 정보 (법정대리인의 이름, DI, 휴대폰 번호가 수집되며, 아동이 성년이 될 때까지 보관됩니다.)</li>
				<li><span class="first_letter">-</span> 선택항목 : 비상 연락용 이메일 주소 (선택항목은 입력하지 않아도 회원가입이 가능합니다.)</li>
			</ul>
			<p class="depth2">&lt;단체아이디 회원가입&gt;</p>
			<ul class="depth2 ex">
				<li><span class="first_letter">-</span> 필수항목 : 단체아이디, 단체이름, 법인명(단체명), 대표자명, 사업장 소재지, 대표 전화번호, 관리자 이이디, 관리자 휴대폰번호, 관리자 부서/직위</li>
				<li><span class="first_letter">-</span> 선택항목 : 대표 팩스번호 (선택항목은 입력하지 않아도 회원가입이 가능합니다.)</li>
			</ul>
			
			<p class="depth2">둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
			<ul class="depth2">
				<li>- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 기기정보</li>
			</ul>
			<p class="depth2">셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.</p>
			<ul class="depth2">
				<li>- <a href="privacy_agreement.html" target="_blank" onclick="window.open('${pageContext.request.contextPath}/serviceCenter/privacy_agreement.do','','width=880, height=780, scrollbars=yes, resizable=yes');return false;">개인정보 추가 수집에 대해 동의를 받는 경우</a></li>
			</ul>
			<p class="depth2">넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.</p>
			<ul class="depth2">
				<li>- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보</li>
			</ul>
			<p class="depth2">다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.</p>
			<ul class="depth2">
				<li>- 신용카드 결제시 : 카드사명, 카드번호 등 </li>
				<li>- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등 </li>
				<li>- 계좌이체시 : 은행명, 계좌번호 등 </li>
				<li>- 상품권 이용시 : 상품권 번호</li>
			</ul>

			<h6>나. 개인정보 수집방법</h6>
			<p class="depth2">회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
			<ul class="depth2">
				<li>- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청 </li>
				<li>- 협력회사로부터의 제공</li>
				<li>- 생성정보 수집 툴을 통한 수집</li>
			</ul>
<br /><br />
<h5>2. 개인정보의 수집 및 이용목적</h5><br />

			
			<h6>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</h6>
			<p class="depth2">컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심</p>
			<h6>나. 회원관리</h6>
			<p class="depth2">회원제 서비스 제공, 개인식별, 네이버 이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용 행위 제재, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인</p>

			<h6>다. 신규 서비스 개발 및 <strong class="emp">마케팅&middot;광고에의 활용</strong></h6>

			<p class="depth2">신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, <strong class="emp">이벤트 정보 및 참여기회 제공, 광고성 정보 제공</strong>, 접속빈도 파악, 회원의 서비스이용에 대한 통계</p>
<br /><br />			
<h5>3. 개인정보의 공유 및 제공</h5>
			
			<p class="depth1 mt20">회사는 이용자들의 개인정보를 &quot;2. 개인정보의 수집목적 및 이용목적&quot;에서 고지한 범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br />
			‘네이버 아이디로 로그인’ 기능을 네이버 외의 웹사이트에서 사용하시는 회원의 경우, ‘<a href="https://nid.naver.com/user2/privacycenter/info.nhn?m=viewNaverIdLoginRule">네이버 아이디로 로그인 운영정책</a>’이 적용됨을 알려 드립니다.</p>

			<h6>가. 이용자가 사전에 동의 한 경우</h6>
			<p class="depth2">
				- 네이버 게임<br />
				- 네이버 연계 서비스
			</p>
			<h6>나. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</h6>
<br /><br />
<h5>4. 개인정보의 보유 및 이용기간</h5>

			<p class="depth1 mt20">이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 보존 이유를 위해 명시한 기간 동안 보존합니다.</p>
			<h6>가. 회사 내부 방침에 의한 정보보유 사유</h6>
			<ul class="depth2 mt10">

			<li>- 부정이용기록(부정가입, 징계기록 등의 비정상적 서비스 이용기록)
				<ul>
				<li>보존 항목 : 가입인증 휴대폰 번호, 만14세 미만 회원의 경우 법정대리인 DI</li>
				<li>보존 이유 : 부정 가입 및 이용 방지</li>
				<li>보존 기간 : 1년</li>
				<li>※ ‘부정이용기록’이란 부정 가입 및 운영원칙에 위배되는 게시글 작성 등으로 인해 회사로부터 이용제한 등을 당한 기록입니다.</li>
				</ul>
			</li>
			</ul>
			<h6>나. 관련법령에 의한 정보보유 사유</h6>

			<p class="depth2">상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
			<ul class="depth2 mt10">
			<li>- 계약 또는 청약철회 등에 관한 기록
				<ul>
				<li>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 </li>
				<li>보존 기간 : 5년 </li>
				</ul>

			</li>

			<li>- 대금결제 및 재화 등의 공급에 관한 기록
				<ul>
				<li>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 </li>
				<li>보존 기간 : 5년 </li>
				</ul>
			</li>
			<li>- 전자금융 거래에 관한 기록
				<ul>
				<li>보존 이유 : 전자금융거래법</li>
				<li>보존 기간 : 5년</li>
				</ul>
			</li>
			<li>- 소비자의 불만 또는 분쟁처리에 관한 기록
				<ul>

				<li>보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 </li>

				<li>보존 기간 : 3년</li>
				</ul>
			</li>
			<li>- 웹사이트 방문기록
				<ul>
				<li>보존 이유 : 통신비밀보호법 </li>
				<li>보존 기간 : 3개월 </li>

				</ul>
			</li>
			</ul>
<br /><br />
<h5>5. 개인정보 파기절차 및 방법</h5>

			<p class="depth1 mt20">이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br />

				회사의 개인정보 파기절차 및 방법은 다음과 같습니다.</p>
			<h6>가. 파기절차</h6>
			<ul class="depth2 mt10 ex">

			<li><span class="first_letter">-</span> 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.</li>
			<li><span class="first_letter">-</span> 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.</li>

			</ul>
			<h6>나. 파기방법</h6>
			<ul class="depth2 mt10">

			<li>- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
			<li>- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. </li>
			</ul>
<br /><br />
<h5>6. 이용자 및 법정대리인의 권리와 그 행사방법</h5>

			<ul class="depth1 mt20 ex">

			<li><span class="first_letter">-</span> 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며, 회사의 개인정보의 처리에 동의하지 않는 경우 동의를 거부하거나 가입해지(회원탈퇴)를 요청하실 수 있습니다. 다만, 그러한 경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다.</li>
			<li><span class="first_letter">-</span> 이용자 혹은 만 14세 미만 아동의 개인정보 조회, 수정을 위해서는 '
			<c:if test="${!empty member }">
			<a href="${pageContext.request.contextPath }/myPage/myPage2.do?uid=${member.userId }">
			개인정보변경'(또는 '회원정보수정'</a>
			</c:if>
			<c:if test="${empty member }">
			개인정보변경'(또는 '회원정보수정'</a>
			</c:if> 등)을, 가입해지(동의철회)를 위해서는 
			<c:if test="${!empty member }">
			<a href="${pageContext.request.contextPath }/myPage/myPage2.do?uid=${member.userId }">
			&quot;회원탈퇴&quot;를  클릭</a>
			</c:if>
			<c:if test="${empty member }">
			&quot;회원탈퇴&quot;를  클릭</a>
			</c:if>하여
			본인 확인   절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.</li>

			<li><span class="first_letter">-</span> 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.</li>

			<li><span class="first_letter">-</span> 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를
				제3  자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다. </li>
			<li><span class="first_letter">-</span> 회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 &quot;5. 개인정보의 보유 및 이용기간&quot;에 명시된 바에 따라 처리하고 
				그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>

			</ul>
<br /><br />			
<h5>8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항</h5><br />

			<h6>가. 쿠키란?</h6>
			<ul class="depth2 mt10 ex">
			<li><span class="first_letter">-</span> 회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.</li>
			<li><span class="first_letter">-</span> 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다. 이후 이용자가 웹 사이트에 방문할 경우 웹 사이트 서버는 이용자의 하드 디스크에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하기 위해 이용됩니다.</li>
			<li><span class="first_letter">-</span> 쿠키는 개인을 식별하는 정보를 자동적/능동적으로 수집하지 않으며, 이용자는 언제든지 이러한 쿠키의 저장을 거부하거나 삭제할 수 있습니다.</li>
			</ul>
			<h6>나. 회사의 쿠키 사용 목적</h6>
			<p class="depth2 mt10">이용자들이 방문한 네이버의 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 뉴스편집, 이용자 규모 등을 파악하여 이용자에게 광고를 포함한 최적화된 맞춤형 정보를 제공하기 위해 사용합니다.
			</p>
			<h6>다. 쿠키의 설치/운영 및 거부</h6>
			<ul class="depth2 mt10 ex">
			<li><span class="first_letter">-</span> 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</li>
			<li><span class="first_letter">-</span> 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 네이버 일부 서비스는 이용에 어려움이 있을 수 있습니다.</li>
			<li><span class="first_letter">-</span> 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)은 다음과 같습니다.
				<ul>
				<li>① [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.</li>
				<li>② [개인정보 탭]을 클릭합니다.</li>
				<li>③ [개인정보취급 수준]을 설정하시면 됩니다.</li>
				</ul>
			</li>
			</ul>
			
<br /><br />
<h5>9. 개인정보의 기술적/관리적 보호 대책</h5>

			<p class="depth1 mt20">회사는 이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.</p>
			<h6>가. 비밀번호 암호화</h6>
			<p class="depth2">네이버 회원 아이디(ID)의 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.</p>


			<h6>나. 해킹 등에 대비한 대책</h6>
			<p class="depth2">회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. <br />
				개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. <br />
				그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</p>
			<h6>다. 취급 직원의 최소화 및 교육</h6>
			<p class="depth2">회사의 개인정보관련 취급 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 네이버  개인정보취급방침의 준수를 항상 강조하고 있습니다. </p>

			<h6>라. 개인정보보호전담기구의 운영</h6>
			<p class="depth2">그리고 사내 개인정보보호전담기구 등을 통하여 네이버 개인정보취급방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. <br />
				단, 회사가 개인정보보호 의무를 다 하였음에도 불구하고 이용자 본인의 부주의나 회사가 관리하지 않는 영역에서의 사고 등 회사의 귀책에 기인하지 않은 손해에 대해서는 회사는 책임을 지지 않습니다.</p>
<br /><br />
<h5>10. 개인정보관리책임자 및 담당자의 연락처</h5>


			<p class="depth1 mt20">귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. <br />

				회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.</p>
			<div class="contact">
				<table style="background-color:#ebebeb; width:100%;">
				<caption class="blind">개인정보 관리책임자 정보 및 연락처</caption>
				<thead>
				<tr>
					<th colspan="2" scope="col">개인정보 관리책임자 </th>

					<th colspan="2" scope="col" class="line">개인정보 관리담당자 </th>

				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="col1">이 름 : 신은주 </td>
					<td class="col2">소 속 : 정보보호실 </td>

					<td class="col3 line">이 름 : 이현정 </td>
					<td class="col4">소 속 : 개인정보보호팀 </td>
				</tr>
				<tr>
					<td class="col1">전 화 : 2020-0810 </td>
					<td class="col2">직 위 : 이사 </td>

					<td class="col3 line">전 화 : 2020-0810 </td>
					<td class="col4">직 위 : 팀장 </td>

				</tr>
				<tr>
					<td class="col1">메 일 :
						<a href="mailto:dlguswjd0518@naver.com">privacy@naver.com</a>
					</td>

					<td class="col2">&nbsp;</td>
					<td class="col3 line">메 일 :
						<a href="mailto:dlguswjd0518@naver.com">privacy@naver.com</a>
					</td>

					<td class="col4">&nbsp;</td>
				</tr>
				</tbody>
				</table>

			</div>
			<p class="depth1">기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
			<ul class="depth1">
			<li>- 개인정보침해신고센터 (<a href="http://privacy.kisa.or.kr" target="_blank">privacy.kisa.or.kr</a>

			/ 국번없이 118)</li>

			<li>- 대검찰청 사이버수사과 (<a href="http://www.spo.go.kr" target="_blank">www.spo.go.kr</a>
			/ 국번없이 1301) </li>

			<li>- 경찰청 사이버안전국 (<a href="http://www.ctrc.go.kr" target="_blank">www.ctrc.go.kr</a>
			/ 국번없이 182) </li>

			</ul>
<br /><br />
<h5>11. 기타</h5>

			<p class="depth1 mt20">네이버에 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는 본 &quot;네이버 개인정보취급방침&quot;이 적용되지 않음을 알려 드립니다.<br />또한 네이버 모바일 서비스에서의 개인정보 보호에 대한 상세한 내용은 <a href="mobile_privacy.html" target="_blank">"네이버 모바일 개인정보보호 정책"</a>에서 확인하실 수 있습니다.</p>

<br /><br />
<h5>12. 고지의 의무</h5>

			<p class="depth1 mt20">현 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.</p>
			<br />
			<ul class="depth1">
			<li>- 공고일자 : 2015년 3월 31일</li>
			<li>- 시행일자 : 2015년 4월 7일</li>
	
			</ul>
			

</div>
</div>
</div>
</div>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp" />