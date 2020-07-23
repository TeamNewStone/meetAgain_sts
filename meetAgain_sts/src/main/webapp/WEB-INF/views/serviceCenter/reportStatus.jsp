<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />

<!-- <div class="container-fluid" style="float:left;">
<div class="row">
<div class="col-12 col-md-4 offset-md-1">
<div class="sidebar-sticky">
	<h6 class="sidebar-heading core">상담센터</h6>
	<ul class="nav flex-column">
		
		<li class="nav-item"><a href="/views/serviceCenter/faq.jsp" class="nav-link">FAQ</a></li>
		<li class="nav-item"><a href="/views/serviceCenter/reportStatus.jsp" class="nav-link">신고현황</a></li>
		<li class="nav-item"><a href="#" class="nav-link">1:1문의</a></li>
	</ul>
	
<div id="left_num" style='cursor: pointer;' onclick="fnLayerOpen('popup_telnum');">
	<p>
		<span class="left_num_intro">대표문의</span><br>
		<span class="left_num_time">09:00 ~ 19:00</span><br>
		<span class="left_num" >1544-9970</span> 
	</p>
</div>
</div>
</div>
</div>
</div> -->


<div class="row bootstrap snippets" style="width:300px;float:left;">
    <div class="col-md-10 col-md-offset-2 col-sm-12">
        <div class="comment-wrapper">
            <div class="panel panel-info">
            <br />
            <br />
            <br />
                <div class="panel-heading" style="text-align:center;">
                    <h5>고객센터</h5>
                </div>
                <div class="panel-body">
                   
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list">
                        <li class="media">
                            
                            <div class="media-body">
                                
                                <a href="${ pageContext.request.contextPath }/views/serviceCenter/faq.jsp" class="nav-link">FAQ</a>
                                
                            </div>
                        </li>
                        <li class="media">
                            
                            <div class="media-body">
                                
                                <a href="${ pageContext.request.contextPath }/views/serviceCenter/reportStatus.jsp" class="nav-link">신고현황</a>
                                
                            </div>
                        </li>
                        <li class="media">
                            
                            <div class="media-body">
                                
                                <a href="${ pageContext.request.contextPath }/views/serviceCenter/otoInquiry.jsp" class="nav-link">1:1문의</a>
                                
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>






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