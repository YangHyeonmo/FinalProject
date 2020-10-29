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
		<table>
			<tr height="30">
			<td align="center" width="200">계좌가 해지되었습니다.</td>
				<td align="center" width="200">${openAccountNo} 계좌로 ${balance}원이 입금되었습니다.</td>
			</tr>
			</table>
			<table>
			<tr>
				<td><input type="button" value="확인" onclick="window.close();"></td>
			</tr>
		</table>
</c:if>
<c:if test="${check == false}">
	<script>
		alert("비밀번호가 틀렸습니다.")
		window.close();
	</script>
</c:if>
</html>