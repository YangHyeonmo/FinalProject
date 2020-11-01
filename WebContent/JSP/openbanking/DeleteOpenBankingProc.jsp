<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌삭제</title>
</head>
<body>
	<c:if test="${error==1}">
		<script>
		alert("오픈뱅킹 계좌 삭제완료!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
	<c:if test="${error==2}">
		<script>
			alert("계좌 삭제에 실패하였습니다!!");
		</script>
		<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
	</c:if>
</body>
</html>