<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- datepicker 사용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<!-- 상단 서칭부분 -->
<div align="left" style="margin-left: 60px">
	<form id="frm" method="get">
		<table>
		<col width="80"><col width="70"><col width="250">
			<tr>
				<th style="font-size: 15px; text-align: center;" >등록일</th>
				<td colspan="3">
					<input type="text" id="datepicker1" name="startdate" style="padding:auto; width: 150px; height: 35px">&nbsp;&nbsp; ~ &nbsp;&nbsp;
					 <input type="text" id="datepicker2" name="enddate" style="padding:auto; width: 150px; height: 35px">
				</td>
			</tr>
			<tr>
				<th style="font-size: 15px;  text-align: center;" >카테고리</th>
				<td style="width: 100px">
					<select class="form-select" aria-label="Default select example" name="choice_cg" id="choice_cg">
					  <option selected>선택</option>
					  <option value="regidate">판매코드</option>
					  <option value="category">판매자ID</option>
					  <option value="category">판매제목</option>
					  <option value="category">주소</option>
					  <option value="category">사업자등록증</option>
					  <option value="category">사업자명</option>
					</select>
				</td>
				<td>
					<input type="text" id="search" name="search" class="form-control" placeholder="검색" size="20">
				</td>
				<td>
					<img alt="" src="./image/search.png" id="searchBtn" style="width: 30px; height: 30px;">
				</td>
			</tr>	
		</table>
	</form>
</div>

<br>

<!-- 상품 하단테이블 -->
<div align="right" style="padding-right: 85px">
	<button type="button" class="btn btn-primary" id="writeBtn" style="width: 100px; height: 40px;">판매등록</button>
</div>

<div align="center" style="margin-top: 5px; margin-bottom: 10px">
	<table class="table table-hover" style="width: 90%" id="tmtable">
		<colgroup>
			<col style="width: 50px">
			<col style="width: 80px">
			<col style="width: 80px">
			<col style="width: 150px">
			<col style="width: 90px">
			<col style="width: 80px">
			<col style="width: 70px">
		</colgroup>
		
		<tr align="center">
		 	<th>번호</th><th>판매코드</th><th>판매자</th><th>판매제목</th><th>주소</th>
		 	<th>리뷰수</th><th>평점</th><th>등록일</th><th>관리</th>
		</tr>
		 
		<c:if test="${empty alist}">
			<tr style="text-align: center;">
				<td colspan="9">작성된 글이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${ not empty alist}"> 
			<c:forEach items="${alist}" var="dto" varStatus="i">	
				<tr align="center">
					<td>${i.count}</td>
					<td>${dto.sellSeq}</td>
					<td>${dto.hostId}</td>
					<td>${dto.title}</td>
					<td>${dto.address}</td>
					<td></td>	<!-- 리뷰수 -->
					<td></td>	<!-- 평점 -->
					<td>${dto.regidate}</td>
					<td>
						<button type="button" class="btn btn-outline-primary" onclick="moreBtn(${dto.sellSeq})" style="width: 78px; height: 30px; font-size: 9pt">상세보기</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>

<script type="text/javascript">
/* widget calendar */
$("#datepicker1,#datepicker2").datepicker({
     showMonthAfterYear:true,
     showOn:"both",
     buttonImage:"./image/calendar.png",
     buttonImageOnly:true,
     buttonText: "Select date",
     dateFormat:'yy-mm-dd',
     nextText:'다음 달',
     prevText:'이전 달',
     dayNamesMin:['일','월','화','수','목','금','토'],
     monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
 
$("#writeBtn").click(function() {
	location.href = "actwrite.do";
});
$("#searchBtn").click(function() {
	alert('searchBtn');
});
function moreBtn(seq) {
	location.href = "actdetail.do?seq=" + seq;
}
</script>
</body>
</html>