<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/adminHeader.jsp"/>

<div class="col-md-8 offset-md-2 content">

  <h2>회원 관리</h2>
  
  <table class="table" style="text-align:center;margin:auto; width:100%;">
  <tr>
  <th>이름</th>
  <td>홍길동</td>
  <th>닉네임</th>
  <td>파송송계란탁</td>
  <th>생년월일</th>
  <td>1997-01-13</td>
  </tr>
  <tr>
  <th>성별</th>
  <td>여자</td>
  <th>이메일</th>
  <td>123@example.com</td>
  <th>회원등급</th>
  <td>프리미엄</td>
  </tr>
  <tr>
  <th>가입일자</th>
  <td>2020-07-21</td>
  <th>탈퇴일자</th>
  <td>해당없음</td>
  <!-- 탈퇴여부 : N - 탈퇴일자 표시, Y - 해당없음 -->
  <!-- 탈퇴여부는 표시안함 -->
  <th>추방여부</th>
  <td>N</td>
  </tr>
  <tr>
  <th>경고횟수</th>
  <td>0</td>
  <th>정지여부</th>
  <td>N</td>
  <th>정지시간</th>
  <td>해당없음</td>
  </tr>
  <tr>
  <th>주소(집)</th>
  <td colspan="5">서울시 강남구 테헤란로14길 6 남도빌딩</td>
  </tr>
  <tr>
  <th>주소(직장)</th>
  <td colspan="5">서울시 강남구 테헤란로10길 9</td>
  </tr>
  <tr>
  <th>주소(관심)</th>
  <td colspan="5">해당없음</td>
  </tr>

  </table>
  <br />
  <div style="text-align:right;">
 <button type="button" class="btn btn-outline-secondary">해당 회원 마이페이지로 이동</button> 
 </div>
</div>

<c:import url="/views/common/adminFooter.jsp"/>