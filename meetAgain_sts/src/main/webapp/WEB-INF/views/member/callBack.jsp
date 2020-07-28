<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NaverLoginSDK</title>
</head>

<body>

	callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가
	보이면 안됩니다.
	
	
	<form id = "userform" action="memberInsertForm.do" method="POST">
<input type="hidden" id="email" name="email"/>
<input type="hidden" id="name" name="name" />
<input type="hidden" id="gender" name="gender" />
<input type="hidden" id="age" name="age" />
<input type="hidden" id="birth" name="birth" />
</form>
	
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
		
	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화-->
	<script>
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "lQZcDrHxi5UeKZeLLXqp",
			callbackUrl : "http://localhost:8088/meetAgain/member/callBack.do",
			isPopup : false,
			callbackHandle : true
		/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		});

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener(
						'load',	function() {
							console.log(status);
							naverLogin.getLoginStatus(function(status) {
										if (status) {
											/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
											var email = naverLogin.user.getEmail();
											var name = naverLogin.user.getName();
											var gender = naverLogin.user.getGender();
											var age = naverLogin.user.getAge();
											var birth = naverLogin.user.getBirthday();
	
										
																					
											if (email == undefined || email == null
													|| name == undefined || name == null
													|| gender == undefined || gender == null
													|| age == undefined	|| age == null
													|| birth == undefined	|| birth == null) 
											{alert("필수정보에 대한 정보제공을 모두 동의해주세요.");
												/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
												naverLogin.reprompt();
												return;
											}
											
											$('#email').val(email);
											$('#name').val(name);
											$('#gender').val(gender);
											$('#age').val(age);
											$('#birth').val(birth);
											
											$.ajax({
												url : "${ pageContext.request.contextPath }/member/selectOne.do",
												data : {
													email : email		
												},
												//dataType : "json",
												//async : false,
												success : function(data){
													if(data.isNew == true){
														$('#userform').submit();
														//location.href='${pageContext.request.contextPath}/member/memberInsertForm.do';														
													} else {
														location.href="${ pageContext.request.contextPath}";
													}
												},
												error : function(){
													alert("에러 발생");
												}
											});
										
											
										} else {
											console.log("callback 처리에 실패하였습니다.");
										}
									});
						});

		naverLogin.getLoginStatus(function(status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getName();
				var gender = naverLogin.user.getGender();
				var age = naverLogin.user.getAge();
			} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
		});
	
	
	</script> 	

<!------------------- 유저 토큰 받아오는 script		
<script>
  var naver_id_login = new naver_id_login("lQZcDrHxi5UeKZeLLXqp", "http://localhost:8088/meetAgain/member/callBack.do");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('age'));
    alert(naver_id_login.getProfileData('name'));
    alert(naver_id_login.getProfileData('gender'));
  }
</script>
 ------------------->		
</body>

</html>