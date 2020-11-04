<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<c:if test="${check == true}">
	<div class="deleteAcc">	
	<h2>계좌가 해지되었습니다.</h2>
		<div class="accountRec">
			<br />
			<button type="submit" id="print" onclick="window.print()">확인</button> 
		</div>
	</div>
</c:if>
<c:if test="${check == false}">
	<script>
		alert("비밀번호가 틀렸습니다.")
		window.close();
	</script>
</c:if>
</html>