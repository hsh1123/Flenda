<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- utf-8설정 -->
<fmt:requestEncoding value="utf-8" /> <!-- 시간형, encoding format 설정할 때 많이 쓰임 -->


<div style="width: 100%; height: 53px; margin-top:20px;  margin-bottom: 20px;">
	<div style="width: 100%; height: 100%; clear: both; display: inline-block;">
		<div id="_title_image" style="width: 13%; float: left; display: inline; margin-left: 20px;">
			<img alt="" src="./image/logo4.png" style="height: 53px">
		</div>
		<div style="width: 63%; float: left; display: inline;">
			<form class="container-fluid justify-content-start">
				<a href="manage_home.do" title="Home"><button class="btn btn-outline-primary me-4" type="button">Home</button></a>
				<a href="#" title="회원정보"><button class="btn btn-outline-primary me-4" type="button">회원정보</button></a>
				<a href="#" title="커뮤니티"><button class="btn btn-outline-primary me-4" type="button">커뮤니티</button></a>
				<a href="#" title="테마여행"><button class="btn btn-outline-primary me-4" type="button">테마여행</button></a>
				<a href="activity.do" title="액티비티"><button class="btn btn-outline-primary me-4" type="button">액티비티</button></a>
				<a href="#" title="문의관리"><button class="btn btn-outline-primary me-4" type="button">문의관리</button></a>
				<a href="#" title="결제관리"><button class="btn btn-outline-primary me-4" type="button">결제관리</button></a>
				<a href="#" title="통계"><button class="btn btn-outline-primary me-4" type="button">통계</button></a>
			</form>
		</div>
		<div id="_title_menu" style="width: 20%; float: right; text-align: right; margin-right: 20px;">
			<div style="position: relative; top: 10px;">
				<ul style="display: flex; float: right; list-style: none;">
					<li><a href="main.do" title="마이페이지"><button type="button" class="btn btn-info">사용자페이지</button></a></li>
					<li>
						<span>이미지</span>
						<span>이기동</span>
					</li>
					<li><a href="#" title="로그아웃"><button type="button" class="btn btn-link">로그아웃</button></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>