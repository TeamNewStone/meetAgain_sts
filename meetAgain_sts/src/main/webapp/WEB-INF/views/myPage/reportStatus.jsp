<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />

<div class="container" style="taxt-align: center;">
	<div class="intro">
		<div class="row">
			<div class="col-12">
				<h1>신고내역</h1>
				<br />
<table class="table table-hover" style="text-align:center;">
  <thead style="background-color:#122b5f;color:white;">
    <tr>
      <th scope="col">신고날짜</th>
      <th scope="col">피신고자</th>
      <th scope="col">신고사유</th>
      <th scope="col">처리상태</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">2020-07-22</th>
      <td>Mark</td>
      <td>스팸 / 광고</td>
      <td>처리중</td>
    </tr>
    <tr>
      <th scope="row">2020-05-23</th>
      <td>Jacob</td>
      <td>증오 또는 학대하는 콘텐츠</td>
      <td>처리완료</td>
    </tr>
    <tr>
      <th scope="row">2020-05-21</th>
      <td>Larry</td>
      <td>스팸 / 광고</td>
      <td>처리완료</td>
    </tr>
  </tbody>
</table>
</div></div></div></div>
<br /><br /><br /><br />
<c:import url="/views/common/footer.jsp" />