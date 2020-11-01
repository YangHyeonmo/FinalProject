<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약등록</title>
</head>
<body>
	<c:if test="${error==1}">
		<script>
			alert("예약 등록완료!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
	<c:if test="${error==2}">
		<script>
			alert("예약 등록에 실패하였습니다!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
</body>
</html>