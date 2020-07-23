<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp"/>

<div class="container-fluid">
  <div class="row">
	  <div class="col-12 col-md-4 offset-md-4">
				  <div class="register-form">
					  <div class="mb-7" style="line-height:2em;">
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />

						  <p style="font-size:50px;font-weight:bold;">Login</p>
						  <p class="lead" style="font-size:13px;color:#a9a9a9;">로그인 하시면 더욱 다양한 '다시만나'의 서비스를 즐기실 수 있습니다.</p>
						  <hr />
					  </div>
					  <form>
					  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
					  <div id="naverIdLogin"></div>
					  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
						</form>

		  		</div>
	  </div>

  </div>
</div>
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />
					  <br />

  <script type="text/javascript">
/*   	var naver_id_login = new naver_id_login("lQZcDrHxi5UeKZeLLXqp", "http://localhost:8088/meetAgain/callBack.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 5,70);
  	naver_id_login.setDomain("http://localhost:8088");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login(); */
  	
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "lQZcDrHxi5UeKZeLLXqp",
			callbackUrl: "http://localhost:8088/meetAgain/callBack.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "white", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
  	
  </script>

<c:import url="/views/common/footer.jsp"/>

