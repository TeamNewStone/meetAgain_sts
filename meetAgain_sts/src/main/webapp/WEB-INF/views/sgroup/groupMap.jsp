<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 우편번호 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>   
   
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

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
				<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdb0daf359d098be072ce9f3ea29cdf8&libraries=services,clusterer,drawing"></script> -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d68e73a49c2fc0deedbcbca59ca49574&libraries=services,clusterer,drawing"></script>
	
			<script>
			    // 지도생성
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.4992176, 127.0326873), // 지도의 중심좌표 호산빌딩
					level : 3, // 지도의 확대 레벨 기본값3  1~14
					mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
				};
	
				// 지도를 생성한다 
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var geocoder = new kakao.maps.services.Geocoder();
				var Ha, Ga;
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${gPlace}', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div class="form-control" style="width:150px;text-align:center;padding:6px 0;">모임 장소 ↓</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
				
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
				    
				    // console.log(latlng);
				    // 위도 경도 분리
				    /* var weg = latlng.getLat();
				    var geg = latlng.getLng(); */
				    
				    // 마커 위치를 클릭한 위치로 옮깁니다
				    marker.setPosition(latlng);
				    
				    // 위도경도
				    var message1 = '클릭한 정확한 위치의 위도는 ' + latlng.getLat() + ' 이고, <br>';
				    message1 += '경도는 ' + latlng.getLng() + ' 입니다.';
				    
				    var resultDiv1 = document.getElementById('clickLatlng');
				    resultDiv1.innerHTML = message1;
				    
				    var url = 'https://map.kakao.com/link/to/';

				    // 마커 주소 전달
				    
				    // 미등록된 도로명주소는 무시됨
				    
					function searchDetailAddrFromCoords(coords, callback) {
						// 좌표로 법정동 상세 주소 정보를 요청합니다
						geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
					}

				    searchDetailAddrFromCoords(latlng, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

							var dAddr = !!result[0].road_address ? result[0].road_address.address_name : '';
				            dAddr += result[0].address.address_name;
				            
				            var content = '<div class="form-control" style="height: 100px; width: 350px;">' +
				                            '<span class="title">선택하신 핀포인트</span><br>' + 
				                            detailAddr + '</div>';

				            // 마커를 클릭한 위치에 표시합니다 
				            marker.setPosition(latlng);
				            marker.setMap(map);

				            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				            infowindow.setContent(content);
				            infowindow.open(map, marker);
				            
				            // var message2 = '<br>선택하신 장소는 <br>도로명 : ' + result[0].road_address.address_name + '<br>지번 : ' + result[0].address.address_name;
				            var message2 = '<br>선택하신 장소는' + '<br>' + detailAddr;
						    						    
						    var resultDiv2 = document.getElementById('_mapMakerCheck2'); 
						    resultDiv2.innerHTML = message2;						    
						   
						    console.log(latlng.Ha);
						    console.log(latlng.Ga);
						
				        }
				        Ha = latlng.Ha;
				        Ga = latlng.Ga;
						
				    });

				});			
				
				$(function(){
					$('#findRoad').on('click', function() {						
						if(confirm("카카오맵으로 넘어가시겠습니까?")){
							window.open('https://map.kakao.com/link/to/다시만나모임에서 선택한 장소' + ',' + Ha + ',' + Ga);
							return null;
						}
					});					
				});
				
				// 장소검색
				var places = new kakao.maps.services.Places();

				function searchLocation() {
					// 	// 장소 검색 객체를 생성합니다
					var loc = $("#searchLoc").val();
					places.keywordSearch(loc, callback1);
					console.log('검색어 : ' + loc);
				}

				var callback1 = function (result, status) {
					var div5 = document.getElementById('_mapMakerCheck2');					

					if (status === kakao.maps.services.Status.OK) {

						for (var i = 0; i < result.length; i++) {
							div5.innerHTML += '<br>' + result[i].address_name;

							console.log(result[i]);
							// console.log(loc);
						}

					}

				};
				
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
					
		<br /> <br />
	</div>

	<div id="infoArea" style="width: 50%; float: left;">
		<div id="areaName" style="display: flex; align-items: center;">
			<div style="float: left;">				
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="searchLoc" placeholder="법정동 주소 검색">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" id="searchBtn" type="button" onclick="searchLocation()">검색</button>					
					</div>
				</div>				
				<i class="fa fa-map-marker fa-3x"></i><br>
					<c:set var="user1" value="${member}"/>
					<input type="hidden" id="gid" name = "gid" value="${gid}" />					
					<input type="hidden" name = "userId"  value="${user1.getUserId()}" />
					<input type="hidden" name = "isCpt"  value="${isCpt}" />
					<h6><span>소모임 모임장소 : </span></h6><br>
					기본 주소 : <input type="text" class="form-control" value="${gPlace }" disabled>
					변경할 주소 : <input type="text" class="form-control" id="jangso" name="gPlace" style="width: 450px;" disabled><br>
					<!-- <input type="hidden" id="jangso" name="gPlace"  /> -->
							
				<h6><span id="_mapMakerCheck2">검색 결과 : </span></h6>
			</div> 
		</div>

		<div>
			<br />
			<hr />			
			<br />
			<div>
				<button type="button" class="btn btn-info"	id="findRoad">카카오맵에서<br>길찾기</button>
							
				<c:if test="${isCptc eq true}">
				<button type="submit" class="btn btn-light" id="sample6_address" style="width: 113px; height: 60px;" onclick="addressSearchBtn3()">장소변경</button>													
						<button type="button" class="btn btn-light" id="placeUpdate" style="width: 113px; height: 60px;">장소업데이트</button></c:if>						
						<c:if test="${isCptc eq false}">
							<input type="hidden" placeholder="${isCptc}췍"/>
						</c:if>				
						
			</div>
		</div>

	</div>
	<br /><br />
</div>

<script>
	function addressSearchBtn3() {
    // 참조 API : http://postcode.map.daum.net/guide
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.

                $('[name=gPlace]').val(fullAddr);
                
                console.log(fullAddr);
                
                
            }
        
        }).open();
					
    };	


</script>

 <script type="text/javascript">
   $('#placeUpdate').on('click', function(){
	   // console.log('dd');
	   
	   var realMap = $('#jangso').val();
	   
	   if( confirm('소모임 장소를 변경하시겠습니까?' ) == true){
		   
		   console.log(realMap);
        	
          $.ajax({
  	       url: '${pageContext.request.contextPath}/sgroup/mapPlaceUpdate.do',
  	       data: {  	    	    
  	    	    gid : ${gid},
  	    	    gPlace : realMap
  	       },
  	       type: "POST",

  	       success: function(data) {
  	    	   //console.log(data)
  	         if (data == 0) {
  	               alert('오류가 발생하였습니다.');
  	            } else {
  	               alert('수정완료.');
  	            }
  	    	   location.reload();
  	       }
  	        , error : function(error){
  	    	   console.log(error);
  	       }
  	    }); 
           // console.log(fullAddr);
           
       } else {
    	   
       	return false;
       	
       }
	   
   console.log(realMap);
   });
   
var booeeee = ${isCptc};

console.log(booeeee);
</script>

<!-- <script type="text/javascript">

$('#placeUpdate').on('click', function(){
	
	location.href='${pageContext.request.contextPath}/sgroup/mapPlaceUpdate.do';
});


</script> -->

<c:import url="/WEB-INF/views/common/footer.jsp" />

