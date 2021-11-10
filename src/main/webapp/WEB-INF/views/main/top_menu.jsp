<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.carousel-background{
		background-color: #000;
    	opacity: 0.6;
	}
</style>

<div id="top_menu_wrap">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	  	<div class="carousel-background">
		    <div class="carousel-item active">
		      <img src="./image/menu1.jpg" class="d-block w-100" alt="...">	<!-- 사이즈 3363 x 1000 -->
		    </div>
		    <div class="carousel-item">
		      <img src="./image/menu2.jpg" class="d-block w-100" alt="...">	<!-- 사이즈 3363 x 1000 -->
		    </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>