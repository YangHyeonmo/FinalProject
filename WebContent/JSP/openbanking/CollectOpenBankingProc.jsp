<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모으기</title>
</head>
<body>
	<c:if test="${error==1}">
		<script>
		alert("모으기 완료!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
	<c:if test="${error==2}">
		<script>
			alert("모으기 실패!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
	<c:if test="${error==3}">
		<script>
			alert("잔액이 부족합니다!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
</body>
</html>