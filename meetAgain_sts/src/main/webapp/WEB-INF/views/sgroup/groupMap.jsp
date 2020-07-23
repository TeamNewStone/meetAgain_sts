<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />

<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/views/common/groupHeader.jsp" />

	<div id="mapArea" style="width: 50%; float: left;">
		<div id="map" style="width: 90%; height: 500px;">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	fffaeca75a32b9a21c2e06c950becd53"></script>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
			<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
			<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
		</div>
		<br /> <br />
	</div>

	<div id="infoArea" style="width: 50%; float: left;">
		<div id="areaName" style="display: flex; align-items: center;">
			<div style="float: left;">
				<svg width="3em" height="3em" viewBox="0 0 16 16"
					class="bi bi-geo-alt" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd"
						d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg>
			</div>
			<div style="float: left;">
				<h3>모임장소 이름</h3>
			</div>
		</div>

		<div>
			<br />
			<h5>주소가 들어갈 공간입니다.</h5>
			<h5>도로명 주소가 들어갈 공간입니다</h5>
			<br />
			<h5>전화번호가 들어갈 공간입니다.</h5>
			</br>
			<div>
				<button type="button" class="btn btn-info"	onclick="findRoad();">
					&nbsp;&nbsp;&nbsp;길찾기&nbsp;&nbsp;&nbsp;</button>
				<button type="button" class="btn btn-light">&nbsp;&nbsp;장소변경&nbsp;&nbsp;</button>
			</div>
		</div>

	</div>
	<br /> <br />
</div>

<script>
function findRoad(){
	location.href='https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212';
}
$(function(){
	$("#group-mapbtn").attr('class','btn btn-secondary');
	
	}
);
</script>
<c:import url="/views/common/footer.jsp" />