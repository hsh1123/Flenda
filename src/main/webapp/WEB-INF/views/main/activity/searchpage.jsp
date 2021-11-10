<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 날짜범위선택 https://www.daterangepicker.com -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
 <!-- pagination -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
 
<link rel="stylesheet" type="text/css" href="./css/main_activity_search.css">
</head>
<body>
<form id="frm">
<div class="searchbar" align="center">
	<div class="shadow p-2 mb-3 bg-body rounded-pill" id="search_box">
		<span>
			<input type="text" id="input" name="input" class="inputBox" placeholder="지역을 검색해주세요" size="25">
		</span>
		<span class="search_field">
			<input type="text" id="daterange" name="daterange" size="25" placeholder="날짜 검색해주세요">
			<img id="searchBtn" src="./image/searchBtn.jpg"  style="width: 70px; height: 70px;">
		</span>
	</div>
</div>
<div class="body">
	<div class="selectBox">
		<div class="_category">
			<span class="subjects">카테고리</span><hr>
			<input value="all" type="radio" class="btn-check" name="category" id="option1" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="option1">전체</label>		
			<input value="activity"type="radio" class="btn-check" name="category" id="option2" autocomplete="off">
			<label class="btn btn-outline-primary" for="option2">액티비티</label>
			<input value="ticket" type="radio" class="btn-check" name="category" id="option3" autocomplete="off">
			<label class="btn btn-outline-primary" for="option3">티켓</label>
			<input value="experience" type="radio" class="btn-check" name="category" id="option4" autocomplete="off">
			<label class="btn btn-outline-primary" for="option4">체험</label>
		</div>
		<div class="_price">
			<span class="subjects">투어비용(1인 기준)</span><hr>
			<input value="0~1000000" type="radio" class="btn-check" name="price" id="price1" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="price1">전체</label>
			<input value="0~50000" type="radio" class="btn-check" name="price" id="price2" autocomplete="off">
			<label class="btn btn-outline-primary" for="price2">5만원이하</label><br>		
			<input value="50000~100000"type="radio" class="btn-check" name="price" id="price3" autocomplete="off">
			<label class="btn btn-outline-primary" for="price3">5만원~10만원</label>
			<input value="100000~1000000" type="radio" class="btn-check" name="price" id="price4" autocomplete="off">
			<label class="btn btn-outline-primary" for="price4">10만원이상</label>
		</div>
		<div class="_time">
			<span class="subjects">시간대</span><hr>
			<div class="form-check">
			  <input value="0~23" class="form-check-input" type="radio" name="time" id="flexRadioDefault1" checked>
			  <label class="form-check-label" for="flexRadioDefault1">전체</label>
			</div>
			<div class="form-check">
			  <input value="0~12"class="form-check-input" type="radio" name="time" id="flexRadioDefault1" >
			  <label class="form-check-label" for="flexRadioDefault1">오전(낮 12시 이전)</label>
			</div>
			<div class="form-check">
			  <input value="12~18"class="form-check-input" type="radio" name="time" id="flexRadioDefault1" >
			  <label class="form-check-label" for="flexRadioDefault1">오후(낮 12시 ~ 오후 6시)</label>
			</div>
			<div class="form-check">
			  <input value="18~0"class="form-check-input" type="radio" name="time" id="flexRadioDefault1" >
			  <label class="form-check-label" for="flexRadioDefault1">저녁(오후 6시 이후)</label>
			</div>
		</div>
		<div class="_order">
			<span class="subjects">순서</span><hr>
				<input value="recommended" type="radio" class="btn-check" name="orders" id="order1" autocomplete="off" checked="checked">
				<label class="btn btn-secondary" for="order1">추천순</label>
				<input value="score" type="radio" class="btn-check" name="orders" id="order2" autocomplete="off">
				<label class="btn btn-secondary" for="order2">평점순</label>
				<input value="review" type="radio" class="btn-check" name="orders" id="order3" autocomplete="off">
				<label class="btn btn-secondary" for="order3">리뷰순</label>
				<input value="lowPrice" type="radio" class="btn-check" name="orders" id="order4" autocomplete="off">
				<label class="btn btn-secondary" for="order4">낮은 가격순</label>
				<input value="highPrice" type="radio" class="btn-check" name="orders" id="order5" autocomplete="off">
				<label class="btn btn-secondary" for="order5">높은 가격순</label>
				<input value="sell" type="radio" class="btn-check" name="orders" id="order6" autocomplete="off">
				<label class="btn btn-secondary" for="order6">판매량순</label>
		</div>
	</div>
	<div class="list_contents">
		 <div id="contents"></div>
		 <div id="pagingMain" class="container">
		    <nav aria-label="Page navigation">
		        <ul class="pagination" id="pagination"  style="justify-content:center;"></ul>
		    </nav>
		</div>
	</div>
	<div class="map_contents">
		<div id="map"></div>
	</div>
</div>
</form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fec700b25d3a20cd24c1f887074271e&libraries=services"></script> <!-- 카카오지도 -->
<script>
/* 맨처음 리스트 부름 */
$(document).ready(function() {
	$('#daterange').val('');
	ajax(0);
});
/* 검색 */
$("#searchBtn").click(function() {
	ajax(0);
});

let totalCount = 0;	//글의 총수
let pageSize = 10;		//페이지의 크기 1 ~ 10	[1]~[10]
let pageNumber = 1;		//현재페이지

function ajax(pageNum) {
	$('#pagingMain').empty();
	$('#contents').empty();
	
	let data = $('#frm')[0];
  	let dataForm = new FormData(data);
  	dataForm.append('pageNumber', pageNum);
	$.ajax({	// 비동기통신
		url:"main_searchActivity.do",
		type:"post",
	 	data:dataForm,
	 	processData: false,	//FormData API 사용시에 필요
	 	contentType: false,	//FormData API 사용시에 필요
		success:function(data){
		//	let str = JSON.stringify(data);	// 전체확인하기
		//	alert(str);
			/* 페이징 값변경 */
			totalCount = data.totalCount;/* 아직 백엔드 않만듬 */
			pageNumber = data.search.pageNumber + 1; /* 파라미터로 보내야됨 */
			$.each(data.list, function(index, item) {
				let showlist = 	'<div class="card" style="max-width: 25rem; text-align: left; margin: 30px;">';
						$.each(data.pics, function(index, pic) {
							if(item.sellSeq == pic.sellSeq){
								<!-- 카드 상단에 배치되는 이미지 : card-img-top -->
								showlist +=	'<img class="card-img-top" src="http://localhost:8090/flenda/upload/' + pic.newFileName + '">';		
								return false;
							}
						});	
									<!-- 카드본문:card-body -->
						showlist +=	'<div class="card-body">' +
								      	<!-- 카드 제목 :card-title -->
								      	'<h4 class="card-title">' + item.title + '</h4>' +
								     	 <!-- 카드의 내용 글 :card-text -->
								      	'<p class="card-text"><font size="3"><b>최대인원:</b></font>&nbsp;&nbsp;' + item.maxPeople + '</p>' +
								      	'<p class="card-text"><font size="3"><b>소요시간:</b></font>&nbsp;&nbsp;' + item.timetake + '</p>' +
								      	'<p class="card-text"><font size="3"><b>종류:</b></font>&nbsp;&nbsp;' + item.category + '</p>' +
							     		'<a href="main_actdetail.do?seq=' +item.sellSeq + '" class="btn btn-primary">모임상세</a>' +
							    	'</div>' +
							 	'</div>';
								 
				$("#contents").append(showlist);
			});
			
			////////////////////////////지도 JS영역////////////////////////////////
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new kakao.maps.LatLng(37.5556326132925, 126.992217614712), // 지도의 중심좌표
		        level: 9 // 지도의 확대 레벨
		    };  
		
			mapContainer.style.width = "700px";
			mapContainer.style.height = "800px";
		 	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			$.each(data.list, function(index, item) {		
				var latitude = parseFloat(item.latitude);
				var longitude = parseFloat(item.longitude);
				var markerPosition  = new kakao.maps.LatLng( latitude , longitude ); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    map: map,
					position: markerPosition
				});
				
		     	// 마커가 지도 위에 표시되도록 설정합니다
		       	/*  marker.setMap(map); */
		         
		     	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        var str = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title" id="closeOverlay">' + 
				           					 item.title + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">';
						            $.each(data.pics, function(index, pic) {
										if(item.sellSeq == pic.sellSeq){
					str +=     			'<img src="http://localhost:8090/flenda/upload/' + pic.newFileName + '" width="73" height="70">';
											return false;
										}
									});	
					str +=				'</div>' + 
				            '            <div class="desc">' + 
				            '                <div class="jibun ellipsis"><b>최대인원:</b>' + item.maxPeople +'명</div>' + 
				            '                <div class="jibun ellipsis"><b>소요시간:</b>' + item.timetake +'시간</div>' + 
				            '                <div class="jibun ellipsis"><b>종류:</b>' + item.category +'</div>' + 
				            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';

		        // 커스텀 오버레이가 표시될 위치입니다 
		        /* var position = new kakao.maps.LatLng( latitude , longitude );   */

		        // 커스텀 오버레이를 생성합니다
		        var overlay = new kakao.maps.CustomOverlay({
		        	yAnchor: 1,
		            position: marker.getPosition()
		        });
		        
		        var content = document.createElement('div');
		        content.className = 'overlay';
		        content.innerHTML = str;
		        		
		        var closeBtn = document.createElement('div');
		        closeBtn.innerHTML = "<img src='./image/placeholder1.png' width='39px' height='39px;'>";
		        closeBtn.onclick = function() {
		        	overlay.setMap(null);
		        };
		        
		        
		        content.appendChild(closeBtn);
		        		
		        overlay.setContent(content);
		        
		     	
		     	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		        	overlay.setMap(map);
		        });
		        
			});
			
			/* 페이징 추가 */
			let paging = '<nav aria-label="Page navigation">' +
	        				'<ul class="pagination" id="pagination"  style="justify-content:center;"></ul>' +
	        			 '</nav>'
			$('#pagingMain').append(paging);
			let _totalPages = Math.floor(totalCount / 5);
			if(totalCount % 5 > 0){
				_totalPages++;
			}
			$("#pagination").twbsPagination({
				startPage: pageNumber,
				totalPages: _totalPages,
				visiblePages: 5,
				initiateStartPageClick:false,
				first:'<span sris-hidden="true">«</span>',
				prev:"이전",
				next:"다음",
				last:'<span sris-hidden="true">»</span>',
				onPageClick:function(event, page){
					$('#daterange').val('');
					ajax(page-1);
				}
			});	
		    
		},
		error:function(){
			
		}
	});
}
</script>

<script>
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + '/' + month + '/' + day;
}
function getEndday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (2 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + '/' + month + '/' + day;
}
$(function() {
  $('#daterange').daterangepicker({
  	startDate: getToday(),
	endDate: getEndday(),
	locale: { format: 'YYYY/MM/DD' }
  }, function(start, end, label) {
    	alert(start.format('YYYY/MM/DD') + ' ~ ' + end.format('YYYY/MM/DD'));
  });
});
</script>
</body>
</html>