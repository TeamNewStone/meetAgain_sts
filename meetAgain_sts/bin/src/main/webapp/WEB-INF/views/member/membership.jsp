<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<section class="pricing py-5">
  <div class="container">
    <div style="text-align:center;">
    <div class="row">
      <div class="col-lg-4 offset-lg-2">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body" style="height:450px;">
            <h5 class="card-title text-muted text-uppercase text-center">Free</h5>
            <h6 class="card-price text-center">&#8361;0<span class="period">/month</span></h6>
            <hr>
            <ul class="fa-ul">
               <br /><br />
              <li><span class="fa-li"><i class="fas fa-check"></i></span>모임 동시 가입 5개 까지 </li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>장기모임 연장 불가</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>주소 설정 1개 제한</li>
              <br /><br />
            </ul>
            <button type="button" class="btn btn-secondary btn-pill" style="width:80%;" disabled>가입하기</button>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">Premium</h5>
            <h6 class="card-price text-center">&#8361;4,500<span class="period">/month</span></h6>
            <hr>
            <ul class="fa-ul">
              <br />
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>모임 동시 가입 무제한</strong></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>장기 모임 연장 가능</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>주소 설정 3개 까지</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>닉네임 전용 배지 사용</li>
              <br />
            </ul>
            <button type="button" id="payBtn" class="btn btn-secondary btn-pill" style="width:80%;">가입하기</button>
          </div>
        </div>
      </div>
    </div>
    </div>
  </div>
</section>

<div class="container" style="taxt-align: center;">
	<div class="intro">
		<div class="row">
			<div class="col-12">
				<div style="font-size : 1.2em">
					<span>000 회원님은 <b>프리미엄</b> 등급입니다.</span>
					<button type="button" class="btn btn-secondary btn-pill" style="background:#ffb5b6; border:#ffb5b6; display:inline">해지하기</button>
					<p></p>
					<p>가입일 : 2020-07-23 (매월 23일 결제)</p>
				</div>
				<br /><br />
				<div>
				<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
				<span>결제내역</span>
				</div>
				<br />
				<table class="table text-center">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">결제일</th>
				      <th scope="col">멤버십</th>
				      <th scope="col">금액</th>
				      <th scope="col">상태</th>
				      <th scope="col">비고</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>2020-07-23</td>
				      <td>프리미엄 회원 정기결제</td>
				      <td>(월)4,500원</td>
				      <td></td>
				      <td></td>
				    </tr>
				    <tr>
				      <td>2019-04-10</td>
				      <td>프리미엄 회원 정기결제</td>
				      <td>(월)4,500원</td>
				      <td>만료일 2020-04-10</td>
				      <td>19년 4월 프로모션 15% 할인 </td>
				    </tr>
				  </tbody>
				</table>

			</div>
		</div>
	</div>
</div>



	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp43153344');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'kakao',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '프리미엄 회원',
					amount : 4500,
					buyer_email : 'test@example.com',
					buyer_name : '홍길동',
					buyer_tel : '010-1111-2222',
					buyer_addr : '서울시 강남구 역삼동',
					buyer_postcode : '01234'
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "/test/orderconfirm.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'toy',
								code : 'P0001',
								imp_uid : rsp.imp_uid,
								pay_method : rsp.pay_method,
								price : rsp.paid_amount,
								status : rsp.status,
								title : rsp.name,
								pg_tid : rsp.pg_tid,
								buyer_name : rsp.buyer_name,
								paid_at : rsp.paid_at,
								receipt_url : rsp.receipt_url
							//기타 필요한 데이터가 있으면 추가 전달
							}
						});
						location.href="/test/views/iamport/orderConfirm.jsp?item=toy&pay_method="+rsp.pay_method
								+"&quan=" + $('#quan').val() + "&nick="+rsp.buyer_name + "&price="+ $('#price').text()
								+"&date="+rsp.paid_at+"&price="+rsp.paid_amount;
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
	</script>
<c:import url="/WEB-INF/views/common/footer.jsp" />