<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../common/header.jsp" />

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
                                
                                <a href="${ pageContext.request.contextPath }/serviceCenter/faq.do" class="nav-link">FAQ</a>
                                
                            </div>
                        </li>
                        <li class="media">
                            
                            <div class="media-body">
                                
                                <a href="${ pageContext.request.contextPath }/serviceCenter/reportStatus.do" class="nav-link">신고현황</a>
                                
                            </div>
                        </li>
                        <li class="media">
                            
                            <div class="media-body">
                                
                                <a href="mailto:dlguswjd0518@naver.com" class="nav-link">1:1문의</a>
                                
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="container">
	<div class="intro">
		<h1>FAQ</h1>
		<br>
		<div class="row">
			<div class="col-12">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">
									메인화면에 있는 통계그래프는 믿을 만한 정보인가요?</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">네, 모든 회원의 가입한 소모임의 정보를 토대로 나타내는 것이기 때문에 믿으셔도 됩니다~</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									한 시간 뒤면 도비는 이제 자유예요!</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">자유롭게~저 하늘을~날아가도 놀라지 말라요~</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									모두 고생하셨습니다</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse"
							aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">고생하셨어요♡</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../common/footer.jsp" />