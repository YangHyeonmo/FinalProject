<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:if test="${error==1}">
	<script>
		alert("인증번호가 틀렸습니다");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="authform"
		action="<%=request.getContextPath()%>/finance/accedeProducts">
		<input type="hidden" name="random" value="${random }"> <input
			type="hidden" name="authType" value=1> <input type="hidden"
			name="fin_no" value=${fin_no }>
		<div class="w3-display-middle">
			인증번호:<input type="text" name="auth"> <input type="submit"
				name="입력">
		</div>
	</form>
</body>
</html>