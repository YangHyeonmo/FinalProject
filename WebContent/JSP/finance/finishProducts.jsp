<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${error==1}">
	<script>
		alert("인증번호가 틀렸습니다");
	</script>
</c:if>
</head>


<body>
<div class="acc_auth_service">
	<form method="post" name="authform"
		action="<%=request.getContextPath()%>/finance/accedeProducts">
		<input type="hidden" name="random" value="${random }">
		<input type="hidden" name="fin_no" value=${fin_no }>
		<div class="w3-display-middle">
			<h2>인증번호</h2> : <input type="text" name="auth"><br/> 			
			<h2 class="font2">비밀 번호 </h2>: <input type="text"class="h2_2" name="fin_pw">
							<button type="button">인증</button>
							
		</div>
	</form>
	</div>
</body>
</html>