<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/adminHeader.jsp"/>

<div class="col-md-8 offset-md-2 content">

  <h2>회원 관리</h2>
  <input type="hidden" id="userId" name="userId" value="${member.userId }" />
  <table class="table" style="text-align:center;margin:auto; width:100%;">
  <tr>
  <th>이름</th>
  <td>${member.userName}</td>
  <th>닉네임</th>
  <td>${member.nickName }</td>
  <th>생년월일</th>
  <td>${member.birthday }</td>
  </tr>
  <tr>
  <th>성별</th>
  <c:if test="${member.gender eq 'M' }">
  <td>남자</td>  
  </c:if>
  <c:if test="${member.gender eq 'F' }">
  <td>여자</td>  
  </c:if>
  <th>이메일</th>
  <td>${member.email }</td>
  <th>회원등급</th>
  <c:if test="${member.MLevel == 0 }">
  <td>일반 등급</td>
  </c:if>
  <c:if test="${member.MLevel == 1 }">
  <td>프리미엄 등급</td>
  </c:if>
  </tr>
  <tr>
  <th>가입일자</th>
  <td>${member.enrollDate }</td>
  <th>탈퇴일자</th>
  <c:if test="${member.wd_Yn eq 'N' }">
  <td>해당없음</td>
  </c:if>
  <c:if test="${member.wd_Yn eq 'Y' }">
  <td>${member.wdDate }</td>
  </c:if>
  <!-- 탈퇴여부 : N - 탈퇴일자 표시, Y - 해당없음 -->
  <!-- 탈퇴여부는 표시안함 -->
  <th>추방여부</th>
  <td>${member.out_Yn }</td>
  </tr>
  <tr>
  <th>경고횟수</th>
  <td>${member.warn_Cnt }</td>
  <th>정지여부</th>
  <td>${member.stop_Yna }</td>
  <th>정지시간</th>
  <c:if test="${member.stop_Yna eq 'N' }">
  <td>해당없음</td>
  </c:if>
  <c:if test="${member.stop_Yna ne 'N' }">
  <td>${member.stop_Time }</td>
  </c:if>
  </tr>
  <tr>
  <th>주소(집)</th>
  <td colspan="5">${member.address1 }</td>
  </tr>
  <tr>
  <th>주소(직장)</th>
  <c:if test="${member.address2 ne null }">
  <td colspan="5">${member.address2 }</td>
  </c:if>
  <c:if test="${member.address2 eq null }">
  <td colspan="5">해당없음</td>
  </c:if>
  </tr>
  <tr>
  <th>주소(관심)</th>
  <c:if test="${member.address3 ne null }">
  <td colspan="5">${member.address3 }</td>
  </c:if>
  <c:if test="${member.address3 eq null }">
  <td colspan="5">해당없음</td>
  </c:if>
  </tr>

  </table>
  <br />
  <div style="text-align:right;">
 <button type="button" class="btn btn-outline-secondary" onclick="goMypage();">해당 회원 마이페이지로 이동</button> 
 </div>
</div>


<script>
function goMypage(){
	var userId=$('#userId').val();
	location.href='${pageContext.request.contextPath}/myPage/myPage1.do?uid='+userId;
}
</script>

<c:import url="/WEB-INF/views/common/adminFooter.jsp"/>