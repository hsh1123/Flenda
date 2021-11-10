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
				<a href="main.do" title="Home"><button class="btn btn-outline-primary me-5" type="button"><img src="./image/home.png">&nbsp;Home</button></a>
				<a href="bbslist.do" title="커뮤니티"><button class="btn btn-outline-primary me-5" type="button"><img src="./image/community.png">&nbsp;커뮤니티</button></a>
				<a href="#" title="테마여행">
					<button class="btn btn-outline-primary me-5" type="button"><img src="./image/travel.png">&nbsp;테마여행</button></a>
				<a href="main_activity.do" title="액티비티">
					<button class="btn btn-outline-primary me-5" type="button"><img src="./image/activity.png" style="width: 32px; height: 32px;">&nbsp;액티비티</button>
				</a>
			<%-- <c:if test="${login.auth == 2}"> --%>	<!-- 판매자권한  -->
				<a href="#" title="판매자페이지"><button class="btn btn-outline-primary me-5" type="button">판매자페이지</button></a>
			<%-- </c:if> --%>
			<%-- <c:if test="${login.auth == 3}"> --%>	<!-- 관리자권한  -->
				<a href="management.do" title="관리자페이지"><button class="btn btn-outline-primary me-5" type="button">관리자페이지</button></a>
			<%-- </c:if> --%>
			</form>
		</div>
		<div id="_title_menu" style="width: 20%; float: right; text-align: right; margin-right: 20px;">
			<div style="position: relative; top: 10px;">
				<c:if test="${empty login.id}">	<!-- 로그아웃한 경우 -->
					<ul style="display: flex; float: right; list-style: none;">
						<li><a href="#" title="로그인"><button type="button" class="btn btn-link">로그인</button></a></li>
						<li><a href="#" title="회원가입"><button type="button" class="btn btn-secondary">회원가입</button></a></li>
					</ul>
				</c:if>
				<c:if test="${not empty login.id}">	<!-- 로그인한 경우 -->
					<ul style="display: flex; float: right; list-style: none;">
						<li><a href="#" title="마이페이지"><button type="button" class="btn btn-info">마이페이지</button></a></li>
						<li>
							<span>이미지</span>
							<span>이기동</span>
						</li>
						<li><a href="#" title="로그아웃"><button type="button" class="btn btn-link">로그아웃</button></a></li>
					</ul>
			 	</c:if>
			</div>
		</div>
	</div>
</div>