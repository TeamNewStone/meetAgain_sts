<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/views/common/header.jsp" />

<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/views/common/groupHeader.jsp" />

	<div id="mapArea" style="width: 50%; float: left;">
	
		<div id="map" style="width: 90%; height: 500px;"></div>
		<hr />
		<div id="clickLatlng"></div>
		
			<hr>
			<p>
				<input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
				<input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
			</p>
			<p>
				<input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
				<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
			</p>
			<!-- 카카오맵 API  -->
			<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdb0daf359d098be072ce9f3ea29cdf8"></script> -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdb0daf359d098be072ce9f3ea29cdf8&libraries=services,clusterer,drawing"></script>
	
			<script>
			    // 지도생성
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.4992176, 127.0326873), // 지도의 중심좌표
					level : 3, // 지도의 확대 레벨 기본값3  1~14
					mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
				};
	
				// 지도를 생성한다 
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var geocoder = new kakao.maps.services.Geocoder();
				infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
				// 지도 타입 변경 컨트롤을 생성한다
				var mapTypeControl = new kakao.maps.MapTypeControl();
	
				// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new kakao.maps.ZoomControl();
	
				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 마커
				
				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({ 
				    // 지도 중심좌표에 마커를 생성합니다 
				    position: map.getCenter() 
				}); 
				// 지도에 마커를 표시합니다
				marker.setMap(map);

				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
				    
				    // 클릭한 위도, 경도 정보를 가져옵니다 
				    var latlng = mouseEvent.latLng; 
				    
				    // 마커 위치를 클릭한 위치로 옮깁니다
				    marker.setPosition(latlng);
				    
				    // 위도경도
				    var message1 = '클릭한 정확한 위치의 위도는 ' + latlng.getLat() + ' 이고, <br>';
				    message1 += '경도는 ' + latlng.getLng() + ' 입니다.';
				    
				    var resultDiv1 = document.getElementById('clickLatlng');
				    resultDiv1.innerHTML = message1;
				    
				    
				    // 마커 주소 전달
				    
				    // 미등록된 도로명주소는 무시됨
				    
				    searchDetailAddrFromCoords(latlng, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				            
				            var content = '<div class="bAddr" style="width: 350px; height: 130px;">' +
				                            '<span class="title">선택하신 위치</span><br>' + 
				                            detailAddr + 
				                            '<button type="button" class="btn btn-info" onclick="findRoad();">출발지</button>' + 
				                        '</div>';

				            // 마커를 클릭한 위치에 표시합니다 
				            marker.setPosition(latlng);
				            marker.setMap(map);

				            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				            infowindow.setContent(content);
				            infowindow.open(map, marker);
				            
				            // var message2 = '<br>선택하신 장소는 <br>도로명 : ' + result[0].road_address.address_name + '<br>지번 : ' + result[0].address.address_name;
				            var message2 = '<br>선택하신 장소는' + '<br>' + detailAddr;
						    						    
						    var resultDiv2 = document.getElementById('_mapMakerCheck'); 
						    resultDiv2.innerHTML = message2;
						    
						    /* var message3 = '<hr>법정동 기준 : '+ detailAddr;
						    
						    var resultDiv3 = document.getElementById('_mapMakerCheck'); 
						    resultDiv3.innerHTML = message3; */
						    	    
						    
						    /* var message3 = '도로명주소 : ' + result[0].road_address.address_name + '<br>지번주소 : ' + result[0].address.address_name;
						    
						    var resultDiv3 = document.getElementById('_mapAddr'); 
						    resultDiv3.innerHTML = message3; */
						    
						    
				            //var message3 = latlng.getLat() + '<br>' + latlng.getLng();
				            
						   /*  var resultDiv3 = document.getElementById('_mapAddr');
						    resultDiv3.innerHTML = message3; */
				        }   
				    });
				});
				
				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}

				
			</script>
	
			<!-- 교통정보 -->
			<script>
			
				// 지도 타입 정보를 가지고 있을 객체입니다
				// map.addOverlayMapTypeId 함수로 추가된 지도 타입은
				// 가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
				// 이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
				// 자전거 도로 정보가 가장 앞에 표시됩니다
				var mapTypes = {
					terrain : kakao.maps.MapTypeId.TERRAIN,
					traffic : kakao.maps.MapTypeId.TRAFFIC,
					bicycle : kakao.maps.MapTypeId.BICYCLE,
					useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
				};
		
				// 체크 박스를 선택하면 호출되는 함수입니다
				function setOverlayMapTypeId() {
					var chkTerrain = document.getElementById('chkTerrain'), chkTraffic = document
							.getElementById('chkTraffic'), chkBicycle = document
							.getElementById('chkBicycle'), chkUseDistrict = document
							.getElementById('chkUseDistrict');
		
					// 지도 타입을 제거합니다
					for ( var type in mapTypes) {
						map.removeOverlayMapTypeId(mapTypes[type]);
					}
		
					// 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
					if (chkUseDistrict.checked) {
						map.addOverlayMapTypeId(mapTypes.useDistrict);
					}
		
					// 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
					if (chkTerrain.checked) {
						map.addOverlayMapTypeId(mapTypes.terrain);
					}
		
					// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
					if (chkTraffic.checked) {
						map.addOverlayMapTypeId(mapTypes.traffic);
					}
		
					// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
					if (chkBicycle.checked) {
						map.addOverlayMapTypeId(mapTypes.bicycle);
					}
		
				}
			</script>
		
		
		
		
		
		
		
		
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
							
					<!-- <script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	fffaeca75a32b9a21c2e06c950becd53"></script>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
					services와 clusterer, drawing 라이브러리 불러오기
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
					<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
			</script>	 -->
														
		
		
		<br /> <br />
	</div>

	<div id="infoArea" style="width: 50%; float: left;">
		<div id="areaName" style="display: flex; align-items: center;">
			<!-- <div style="float: left;">
				<svg width="3em" height="3em" viewBox="0 0 16 16"
					class="bi bi-geo-alt" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd"
						d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg>
			</div> -->
			<div style="float: left;">
				<p><i class="fa fa-map-marker fa-3x" aria-hidden="true"></i><h3>[모임장소위치]</h3><p>
				<h6><span id="_mapMakerCheck">기본-호산빌딩</span></h6>
				<!-- <h3> ← 지도 마우스 클릭 테스트 </h3> -->
			</div>
		</div>

		<div>
			<br />
			<hr />
			<!-- <h5><span id="_mapAddr">주소 : </span></h5> -->
			<!-- <h5><span id="_streetName">도로명 주소가 들어갈 공간입니다</span></h5> -->			
			<h3><span id="_mapPhone">전화번호가 들어갈 공간입니다.</span></h3>
			<br />
			<div>
				<button type="button" class="btn btn-info"	onclick="findRoad();">
					&nbsp;&nbsp;&nbsp;길찾기&nbsp;&nbsp;&nbsp;</button>
				<!-- <button type="button" class="btn btn-light">&nbsp;&nbsp;장소변경&nbsp;&nbsp;</button> -->
				<button type="button" class="btn btn-light" id="reloadmap">&nbsp;&nbsp;장소변경&nbsp;&nbsp;</button>
			</div>
		</div>

	</div>
	<br /> <br />
</div>

<script>
	function findRoad(){
		var url = 'https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212';
		window.open(url, '_blank');
	}
	
	/* ${'#_mapMakerCheck'}on.('click', function() {
		var mappy = ${'#_mapMakerCheck'}.val();
		
		if(mappy == 'message2'){
			location.reload();
		}
	}); */
	$('#reloadmap').click(function() {
		location.reload();		
	});	
</script>
<c:import url="/views/common/footer.jsp" />










<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<c:import url="/views/common/footer.jsp" /> --%>