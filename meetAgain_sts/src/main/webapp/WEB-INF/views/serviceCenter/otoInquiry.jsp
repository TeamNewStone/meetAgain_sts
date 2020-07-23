<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />

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
<br />
<br />
<br />
thdalsgml13@naver.com 메일 문의 부탁드립니다.
<!-- 스프링에서 구현 시 폼까지 구현 -->
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</div></div></div></div>
















<c:import url="/views/common/footer.jsp" />