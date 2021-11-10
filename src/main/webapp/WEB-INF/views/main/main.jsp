<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<!-- 검색창 -->
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="search">
	<div class="wrapper">
		<div class="textbox">
			<div class="text1">이번엔,</div>
			<div class="text2"><strong>어디로 떠날까?</strong></div>
		</div>
		<div class="shadow-lg p-2 mb-3 bg-body rounded-pill">
		    <div class="search_box">
		        <div class="dropdown">
		            <div class="default_option" style="font-size: 16px;">여행선택</div>  
		            <ul>
		              <li>테마여행</li>
		              <li>액티비티</li>
		            </ul>
		        </div>
		        <div class="search_field">
		          <input type="text" class="input" id="searchBox" placeholder="지역을 검색해주세요">
		          <i class="fas fa-search" id="searchBtn"></i>
		      	</div>
		    </div>
		</div> 
	</div>
</div>
<!-- 캐러셀 -->
<div class="banner" align="center">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="./image/cal1.png" class="d-block w-100" alt="..." style="height: 200px;">
	    </div>
	    <div class="carousel-item">
	      <img src="./image/cal2.png" class="d-block w-100" alt="..." style="height: 200px;">
	    </div>
	    <div class="carousel-item">
	      <img src="./image/cal3.png" class="d-block w-100" alt="..." style="height: 200px;">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>
<div class="theme_ref">

</div>
<div class="act_ref">

</div>
<div class="bbs_ref">

</div>

<script>
$(document).ready(function(){
	$(".default_option").click(function(){
	  $(".dropdown ul").addClass("active");
	});

	$(".dropdown ul li").click(function(){
	  var text = $(this).text();
	  $(".default_option").text(text);
	  $(".dropdown ul").removeClass("active");
	});
});

$('#searchBtn').click(function() {
	alert($('.default_option').text());
	alert($('#searchBox').val());
});
</script>
</body>
</html>