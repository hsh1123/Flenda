<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
<c:when test="${md.check eq 'YES'}">
<script type="text/javascript">
	alert('${md.text}');
	location.href="${md.address}";
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	alert('${md.text}');
	location.href="${md.address}";
</script>
</c:otherwise>
</c:choose>


</body>
</html>