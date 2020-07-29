<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/header.jsp" />


			<form action="${ pageContext.request.contextPath }/sgroup/sgroupCreateEnd.do" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="intro">
		<div class="col-12">
			<div class="content">
				<div style="border-bottom:1px solid black">
					<p style="font-size:1.2em">모임 생성하기</p>
				</div>
				<svg width="1em" height="4em" viewBox="0 0 16 16" class="bi bi-card-image" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M10.648 7.646a.5.5 0 0 1 .577-.093L15.002 9.5V13h-14v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
				  <path fill-rule="evenodd" d="M4.502 7a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<span style="font-size: smaller;">모임 대표 이미지</span>
				
				
			<div class="row">
				<div class="sgroupPicture" id="imgArea" style="display:inline">
					<img src="${pageContext.request.contextPath}/resources/img/dog-3.jpg" style="width:400px; height:300px;" id="sampleImg"><br /><br>
					<div style="width:400px; text-align:center;">
						<button type="button" class="btn btn-secondary" id="mimgBtn" style="background:#ffb5b6; border:#ffb5b6;">사진 첨부</button>
					</div>
				<input type="file" name="sgroupImg" id="groupImgBtn" style="display: none;" onchange="loadImg(this);" />
				</div> 

			<div style="display : inline; margin-left:10%">
			<p>모임 타이틀</p>
			<div class="form-group">
			  <input type="text" class="form-control" id="gTitle" name="gTitle" placeholder="모임의 타이틀을 작성해주세요.">
			</div>

				<div class="form-group">
				<span> 지역 선택 : </span>
				  <select class="custom-select" id="gPlace" name="gPlace" style="display:inline">
				    <option selected>--내가 설정한 주소--</option>
				    <option value="address">주소1</option>
				    <option value="adrCom">주소2</option>
				    <option value="adrOther">주소3</option>
				  </select>
				</div>
				
				<div class="form-group">
				<span> 모임 카테고리 : </span>
				  <select class="custom-select" id="cateId" name="cateId" style="display:inline">
				    <option selected>--카테고리--</option>
				    <option value="C01">운동</option>
				    <option value="C02">친목</option>
				    <option value="C03">공부</option>
				    <option value="C04">취미생활</option>
				    <option value="C05">문화생활</option>
				    <option value="C06">여행</option>
				    <option value="C07">봉사</option>
				    <option value="C08">기타</option>
				  </select>
				</div>
				
				<div class="form-group">
				<span> 기간  </span>
				  <select class="custom-select" id="gType" name="gType" style="display:inline">
				    <option selected>--기간--</option>
				    <option value="S">단기</option>
				    <option value="L">장기</option>
				  </select>
				</div>
				
				<p>시작 날짜 </p>
				<input type="text" id="startDate" class="form-control" />
				<p>종료 날짜</p>
				<input type="text" id="durate" name="durate" class="form-control" />
				<div id="datepicker"></div>
				<label for="" style="color:red;">*일반회원일 경우 모임 연장 불가</label>
				
				
				<!-- #charge 값이 on일경우 회비x , off일 경우 회비 o!! -->
				<div class="form-group">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" id="charge" name="charge" value="Y">
				    <label class="custom-control-label" for="charge">회비여부</label>
				  </div>
				  <input type="number" id="gFee" name="gFee" class="form-control" placeholder="회비 금액을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <span> 인원수 </span>
				  <input type="number" class="form-control" id="maxNum" name="maxNum" placeholder="인원은 최소 2명 / 최대 30명 입니다.">
				</div>
				
				<p>성별 선택</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline">
				    <input type="radio" id="customRadio1" name="limitGroup" value="A" class="custom-control-input" checked>
				    <label class="custom-control-label" for="customRadio1">성별무관</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio2" name="limitGroup" value="M"class="custom-control-input">
				    <label class="custom-control-label" for="customRadio2">남</label>
				  </div>
				  <div class="custom-control custom-radio my-2 groupGender" style="display:inline; margin-left:5%">
				    <input type="radio" id="customRadio3" name="limitGroup" value="F" class="custom-control-input">
				    <label class="custom-control-label" for="customRadio3">여</label>
				  </div>
				</div>
				
				<p>모임 연령대</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck1" name="limitGroup" value="10대">
				    <label class="custom-control-label" for="customCheck1">10대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck2" name="limitGroup" value="20대">
				    <label class="custom-control-label" for="customCheck2">20대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck3" name="limitGroup" value="30대">
				    <label class="custom-control-label" for="customCheck3">30대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck4" name="limitGroup" value="40대">
				    <label class="custom-control-label" for="customCheck4">40대</label>
				  </div>
				  <div class="custom-control custom-checkbox my-2 ageGroup">
				    <input type="checkbox" class="custom-control-input" id="customCheck5" name="limitGroup" value="50대">
				    <label class="custom-control-label" for="customCheck5">50대</label>
				  </div>
				</div>
				
				<!-- #private 값이 on일경우 공개 , off일 경우 비공개!! -->
				<p>공개 여부</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" id="private">
				    <label class="custom-control-label" for="private">비공개</label>
				  </div>
				  <input type="number" id="gPwd" name="gPwd" class="form-control" placeholder="모임 비밀번호  4자리를 입력해주세요.">
				</div>
				
				<p>모임승인제</p>
				<div class="form-group" style="margin-top:-20px">
				  <div class="custom-control custom-switch my-2">
				    <input type="checkbox" class="custom-control-input" name="joinType" id="joinType" value="C">
				    <label class="custom-control-label" for="joinType">모임 승인제</label>
				  </div>
				</div>
				
				<p> 모임 소개 </p>
				 <div class="form-group">
				    <textarea class="form-control" id="exampleFormControlTextarea1" name="gIntro" rows="5" placeholder="자유롭게 모임 소개글을 작성해주세요~!"></textarea>
				  </div>
				
				<button type="submit">작성완료</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	</form>

<script>

	$('#imgArea').on('click', function() {
		$('#groupImgBtn').click();
	});
	
	function loadImg(value) {
	
		if (value.files && value.files[0]) {
	
			var reader = new FileReader();
	
			reader.onload = function(e) {
				$('#sampleImg').attr('src', e.target.result);
			}
	
			reader.readAsDataURL(value.files[0]);
		}
	};
	
	$('#maxNum').on('keyup', function() {
	    if (/\D/.test(this.value)) {
	        this.value = this.value.replace(/\D/g, '')
	        alert('숫자만 입력가능합니다.');
	    } else {
			  if (this.value > 30) {
			      this.value = null;
			      alert('모임 인원은 30명까지 가능합니다.');
			  } else if (this.value < 2){
				  this.value = null;
				  alert('모임 최소 인원은 2명부터 가능합니다.');
			  }
	    }
	});
	
/* 	$('#gPwd').on('keydown', function() {
	   
			  if (this.value.length > 5) {
			      this.value = null;
			      alert('비밀번호는 4자리 미만입니다.');
			  } else if (this.value.length < 4){
				  this.value = null;
				  alert('비밀번호 4자리 이상 입력해주세요.');
			  }
	   
	}); */
	
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	};
	
	
	
	$(function(){
		/* $("#private").on("change", function(){
			if($("#private").val()=='on'){
	        $(this).val('off');
			} else {
				$(this).val('on');
			}
		});
		
		$("#charge").on("change", function(){
			if($("#charge").val()=='on'){
	        $(this).val('off');
			} else {
				$(this).val('on');
			}
		});
	
		$("#joinType").on("change", function(){
			if($("#joinType").val()=='on'){
	        $(this).val('off');
			} else {
				$(this).val('on');
			}
		}); */
	
		
		$( "#startDate" ).datepicker({ 
			dateFormat: 'yy-mm-dd' , 
			minDate: new Date()
			
		});
		
		$("#gType").on("change", function(){
	        console.log($(this).val());
	        
	        if($(this).val()=='L'){
	        	
	        	$("#startDate").on("change", function(){
	    			var year = $( "#startDate" ).val().split("-")[0];
	    			var mon = $( "#startDate" ).val().split("-")[1];
	    			var day = $( "#startDate" ).val().split("-")[2];

	    			var date = new Date(year, mon-1, day);
	    			date.setMonth(date.getMonth() + 3);
	    			
	    			date = getFormatDate(date);
	    			
	    			minDate = new Date();
	    			
	    			durate.minDate = date;
	    			console.log("endDate.minDate : " + date);
	    			
	    			/* var test = $('#endDate').datepicker("option", "minDate", date ); */
	    			$('#durate').val(durate.minDate);
	    		
	    		});
	    	
	    	}
	    });

		
	 });
	 


		
</script>

<c:import url="/WEB-INF/views/common/footer.jsp" />
