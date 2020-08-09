<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 우편번호 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>   
<!-- 카카오맵 API  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d68e73a49c2fc0deedbcbca59ca49574&libraries=services,clusterer,drawing"></script>
   
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="container" style="overflow: hidden; height: auto;">
	<c:import url="/WEB-INF/views/common/groupHeader.jsp" />

	<div id="mapArea" style="width: 50%; float: left;">
	
		<div id="map" style="width: 90%; height: 500px;"></div>
		<hr />
			
			<p>
				<input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
				<input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
			</p>
			<p>
				<input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
				<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
			</p><br /> <br />
	</div>

	<div id="infoArea" style="width: 50%; float: left;">
		<div id="areaName" style="display: flex; align-items: center;">
								
				<div style="float: left;">
				<h3><svg width="1.5em" height="2em" viewBox="0 0 16 16"
					class="bi bi-geo-alt" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd"
						d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg>&nbsp;
		<span>${gPlace }</span></h3><br>
				</div>
					</div>
					<div >
				<div>
					<c:set var="user1" value="${member}"/>
					<input type="hidden" id="gid" name = "gid" value="${gid}" />					
					<input type="hidden" name = "userId"  value="${user1.getUserId()}" />
					<input type="hidden" name = "isCpt"  value="${isCpt}" />
				
				<h5>- 도로명 주소 : <span id="add1"> </span></h5>
				<h5>- &nbsp;&nbsp;지번 주소&nbsp;&nbsp; : <span id="add2"> </span></h5>								
				
				<br />
					
					
					<c:if test="${isCptc eq true}">
				<div id = "modifymap" style="display: none;">
					변경할 주소 : <input type="text" class="form-control" id="jangso" name="gPlace" style="width: 450px; " readonly>
					<button type="button" class="btn btn-light" id="placeUpdate" >변경하기</button>
					</div>
			</c:if>
				
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
						</c:if>						
						<c:if test="${isCptc eq false}">
							<input type="hidden" placeholder="${isCptc}췍"/>
						</c:if>				

			</div>
		</div>

	</div>
	<br /><br />
</div>

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
	
	var coords, userAdr;
	var X, Y, userX, userY;
	
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
	        
	        Ha = result[0].y;
	        Ga = result[0].x;
	        
	        var add1 = result[0].road_address.address_name;
	        var add2 = result[0].address.address_name;
	        
	        $("#add1").html(add1);
	        $("#add2").html(add2);
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

	
	$(function(){
		$('#findRoad').on('click', function() {						
				window.open('https://map.kakao.com/link/to/${gPlace}'+','+Ha+','+Ga);
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
	
	// 거리계산 함수
	function test33(X, Y, userX, userY){
		var polyline=new kakao.maps.Polyline({
			path : [
			new kakao.maps.LatLng(Y,X),
			new kakao.maps.LatLng(userY,userX)
			]
		});
		
		return polyline.getLength();
	}

	$('#placeUpdate').on('click', function(){
		   
		   var realMap = $('#jangso').val();
 		
			X = Ga;
			Y = Ha;
			var far =test33(X, Y, userX, userY);
			 
					 
		   if( confirm('소모임 장소를 변경하시겠습니까?' ) == true){
			 
				 console.log("x,y:"+X+Y);
				   console.log("ux,uy:"+userX+userY);
			   if(realMap == ''){
				   alert('변경 실패 !');
				   return null;
			   } else if (far > 5000){
				   alert('선택한 주소의 5km이내의 장소를 선택해주세요.');					
 				   return null;
			   }else {
		          $.ajax({
		  	       url: "${ pageContext.request.contextPath }/sgroup/mapPlaceUpdate.do",
		  	       data: {  	    	    
		  	    	    gid : ${gid},
		  	    	    gPlace : realMap
		  	       },
		  	       type: "POST",	
		  	       success: function(data) {
		  	         if (data == 0) alert('오류가 발생하였습니다.');
						location.reload();
		  	       }
		  	        , error : function(error){
		  	    	   console.log(error);
		  	       }
		  	    });
		          
			   }
	           
	       } else {
	    	   
	       	return false;
	       	
	       }
		   
	   console.log(realMap); 
	   });
	   
	var booeeee = ${isCptc};

	console.log(booeeee);
	
	
	
	
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

<script>
	function addressSearchBtn3() {
		$("#modifymap").css('display','block');
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
          
                
             // 사용자가 고른 모임장소 좌표
        		geocoder.addressSearch($('#gPlace').val(), function(result, status) {
        		    if (status === kakao.maps.services.Status.OK) {
        		        
        		        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        		        console.log(coords);
        		        
        		        X = coords.getLng();
        				Y = coords.getLat();
        		    }
        		});
        		
        		// 사용자가 선택한 주소 좌표
        		geocoder.addressSearch($('#jangso').val(), function(result, status) {
        		    if (status === kakao.maps.services.Status.OK) {
        		        
        		        userAdr = new kakao.maps.LatLng(result[0].y, result[0].x);
        		        console.log(userAdr);
        		        
        		        userX = userAdr.getLng();
        				userY = userAdr.getLat();
        		    }
        		});
        	
            }
        
        }).open();
					
    };	


</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />

