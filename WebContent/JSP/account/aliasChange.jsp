<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #fcb442;
}

body .button {
	width: 250px;
	margin-left: 15rem;
}

body h3 {
	color: black;
	font-size: 20px;
	text-align: center;
}

.bs-calltoaction.bs-calltoaction-success {
	color: black;
	background-color: #fff;
	border-color: black;
}
.bs-alias.bs-calltoaction-success {
	color: black;
	background-color: #fff;
	border-color: black;
}

.bs-calltoaction {
	width: 600px;
	height: 100px;
	padding: 10px 10px;
	border: 1px solid #fff;
	margin-top: 10px;
	margin: 30px;
	border-radius: 5px;
}

.bs-alias {
	width: 600px;
	height: 50px;
	padding: 10px 10px;
	border: 1px solid #fff;
	margin-top: 10px;
	margin: 30px;
	border-radius: 5px;
}
</style>
<body>
	<form method="POST" name="changeForm"
		action="<%=request.getContextPath()%>/account/aliasUpdatePro">
		<input type="hidden" name="account_num" value=${account_num }>
		<c:set var="account_num" value="${account_num }" />
		<c:forEach var="article" items="${article}">
			<h3>계좌 별명 변경</h3>
			<div class="bs-calltoaction bs-calltoaction-success">
				<table class="w3-table-all" align="center">
					<tr>
						<td align="center" width="200">계좌명</td>
						<td align="center" width="200">${article.account_name}</td>
					</tr>
					<tr>
						<td align="center" width="200">계좌번호</td>
						<td align="center" width="200">${article.account_num }</td>
					</tr>
				</table>
			</div>
			<div class="bs-alias bs-calltoaction-success">
				<table class="w3-table-all" align="center">
					<tr height="100">
						<td align="center" width="200">계좌별명</td>
						<td align=center><input type="text" size="10" maxlength="12"
							name="account_alias" placeholder="${article.account_alias }"></td>
					</tr>
				</table>
			</div>
			<div class="button">
				<table class="w3-table-all" align="center">
					<tr align=center>
						<td align=center><input type="submit" value="저장"> <input
							type="button" value="취소" onclick="window.close();"></td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</form>
</body>
</html>