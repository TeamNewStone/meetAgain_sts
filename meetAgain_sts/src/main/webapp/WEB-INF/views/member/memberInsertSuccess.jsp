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

						  <p style="font-size:50px;font-weight:bold;">환영합니다!</p>
						  <p class="lead" style="font-size:13px;color:#a9a9a9;">강낭콩님, 회원가입을 축하합니다.<br>보다 더 나은 맞춤 서비스를 이용하고 싶으시다면 부가정보를 입력해주세요.</p>
						  <hr />
					  </div>
					  <form>
						  <div class="form-group">
						  <button type="button" class="btn btn-block btn-info" onclick="location.href='/meetAgain/views/member/mTMIInsertForm.jsp'">부가정보 입력</button>
						  <button type="button" class="btn btn-block btn-secondary" onclick="location.href='/meetAgain/index.jsp'">메인으로</button>

						  </div>

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


<c:import url="/views/common/footer.jsp"/>

