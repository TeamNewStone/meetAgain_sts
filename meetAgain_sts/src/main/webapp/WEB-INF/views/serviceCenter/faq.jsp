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
									Collapsible Group Item #1</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									Collapsible Group Item #2</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									Collapsible Group Item #3</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse"
							aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.teststestestetet</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/views/common/footer.jsp" />