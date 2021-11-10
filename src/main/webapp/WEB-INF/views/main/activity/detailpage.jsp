<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main_activity_detail.css">
<!-- datepicker => https://flatpickr.js.org/ -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 언어설정  -->
<script src="js/flatpickr.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

</head>
<body>
<div class="main">
	<div class="header">
		<div class="headerTop">
			<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item"><a href="#">액티비티</a></li>
			    <li class="breadcrumb-item active" aria-current="page">상세페이지</li>
			  </ol>
			</nav>
		</div>
		<div class="headerMid">${ act.title }</div>
		<div class="headerBottom">★4.81(247)</div>
	</div>
	<div class="pictures">
		<c:forEach items="${pics}" var="pic" varStatus="i">
			<c:choose>
				<c:when test="${i.count == 4 || i.count == 5}">
					<div align="left">
					<img alt="" src="http://localhost:8090/flenda/upload/${pic.newFileName }" width="150px" height="197px">
					</div>
				</c:when>
				<c:otherwise>
					<div class="items" align="left">
					<img alt="" src="http://localhost:8090/flenda/upload/${pic.newFileName }" width="305px" height="400px">
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div class="body">
		<div class="body_left">
			<div class="icon_info">
				<div>
					<span>${ act.timetake }시간 소요</span>
					<span>${ act.ticket }</span>
				</div>
				<div>
					<span>최대 ${ act.maxPeople }명</span>
					<span>포함 사항:${ act.included }</span>
				</div>
			</div>
			<div class="ticketing">
				<div class="ticketing_sub">티켓 선택</div>
				<div class="ticketing_body">
					<div class="calendar" align="center">
						<input type="text" class="selector" onchange="selectDate(this.value)" placeholder="날짜를 선택하세요." />
						<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
					</div>
					<div class="options">
						<div id="_options"></div>
						<div class="cal" id="calculation">
						</div>
					</div>
					<div id="goToPay" align="right">
					</div>
				</div>
			</div>
			<div class="explanation">
				<div class="explan_Sub" align="left"><h3><strong>상품설명</strong></h3></div>
				<div>${act.goodsExplain }</div>
			</div>
			<hr width="95%" style="margin-left: 15px; background-color: #81BEF7;">
			<div class="instruction">
				<div class="instruc_Sub" align="left"><h3><strong>이용안내</strong></h3></div>
				<div>${act.useInfo }</div>
			</div>
			<hr width="95%" style="margin-left: 15px; background-color: #81BEF7;">
			<div class="master">
				<div class="master_header" align="left">
					<span><img src="" alt="이미지"></span><!-- 프로필사진추가 -->
					<span>${act.businessName}</span>
				</div>
				<div class="master_body">${act.hostintro }</div>
			</div>
			<hr width="95%" style="margin-left: 15px; background-color: #81BEF7;">
			<div class="review"></div>
		</div>
		<div class="body_right"><!-- https://kimyang-sun.tistory.com/entry/%EC%8A%A4%ED%81%AC%EB%A1%A4%EC%97%90-%EB%94%B0%EB%9D%BC-%EB%A9%94%EB%89%B4-%ED%91%9C%EC%8B%9C%EC%8B%9C%ED%82%A4%EA%B8%B0-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%9D%B8%EB%94%94%EC%BC%80%EC%9D%B4%ED%84%B0-%EC%8A%A4%ED%81%AC%EB%A1%A4 -->
			
		</div>
	</div>
	<div class="footer"><!-- 추천액티비티 -->
	
	</div>
</div>
<script type="text/javascript">
flatpickr.localize(flatpickr.l10ns.ko);
$(".selector").flatpickr({ 
	dateFormat: "Y년 m월 d일",
	minDate:"today",
	inline: true,
	local: 'ko'
});

function selectDate(selecter) {
	let sellSeq = ${act.sellSeq};
	$.ajax({
		url:"detailOptions.do",
		data: {date:selecter, seq:sellSeq},
		success:function(list){
			$('#_options').empty();
			$('#calculation').empty();
			$('#goToPay').empty();
			$.each(list, function(index, option) {
			   let str = '<div class="option">' +
							'<div class="option_info">' +
								'<div><strong>' + option.opcontent + '</strong></div>' +
								'<div style="font-size: 15px;">유효기간 : ' + option.startDate + '~' + option.endDate + '</div>' +
						  	'</div>' +
						 	'<div class="option_price"><span id="opPrice' + index + '" style="font-size: 20px; font-weight: bold;">' + option.opPrice + '</span>원/인당</div>' +
						 	'<div class="option_amount">' +
						 		'<span style="padding-right: 10px;"><img onclick="minusBtn(' + index + ')" id="_minusBtn' + index + '" src="./image/minus_off.png" width="40px" height="40px"></span>' +
						 		'<span id="itemCount' + index + '" style="padding-right: 10px;">0</span>' +
						 		'<span><img onclick="plusBtn(' + index + ')" src="./image/plus.png" width="40px" height="40px"></span>' +
						 	'</div>' +
						 '</div>';
						  					  
				$('#_options').append(str);
				
			});
			
			let total = '<hr width="95%" style="margin-left: 15px;">' +
						'<div class="totalCal" align="right" ><strong>총 여행 금액<span id="_totalCal">0원</span></strong></div>';

			$('#calculation').append(total);
			
			let payBtn = '<button class="btn btn-primary btn-lg" onclick="payBtn()" style="margin: 20px;">결제하기</button>';
			$('#goToPay').append(payBtn);
		},
		error:function(){
			alert('error');
		}
	});
}
let totalPrice = 0;
let totalCount = 0;
function plusBtn(index) {
	let preCount = $('#itemCount'+index).html();
	totalCount += 1;
	$("#itemCount"+index).text(parseInt(preCount)+1);
	if(preCount>=0){
		$('#_minusBtn'+index).attr("src","./image/minus.png");
	}
	
	
	$('#_totalCal').html('');
	let money = $('#opPrice'+index).html();
	totalPrice += parseInt(money);
	$('#_totalCal').html(totalPrice+'원');
}
function minusBtn(index) {
	let preCount = $('#itemCount'+index).html();
	$("#itemCount"+index).text(parseInt(preCount)-1);
	totalCount -= 1;
	if(preCount <= 1){
		$('#_minusBtn'+index).attr("src","./image/minus_off.png");
		$("#itemCount"+index).text(0);
	}
	
	
	let money = $('#opPrice'+index).html();
	totalPrice -= money;
	if(totalCount <0){
		totalCount = 0;
	}
	
	if(totalPrice < 0){
		totalPrice = 0;
	}
	$('#_totalCal').html(totalPrice+'원');
}
function payBtn() {
	alert(totalPrice);
	alert(totalCount);
}
</script>
</body>
</html>