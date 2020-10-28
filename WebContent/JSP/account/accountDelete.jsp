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
	<form method="POST" name="delForm"
		action="<%=request.getContextPath()%>/account/accountDeletePro">
		<div>
			<table class="w3-table-all" align="center">
				<c:forEach var="article" items="${article}">
					<tr height="30">
						<td align="center" width="200">계좌명</td>
						<td align="center" width="200">${article.account_name}</td>
					</tr>
					<tr height="30">
						<td align="center" width="200">계좌번호</td>
						<td align="center" width="200">${article.account_num }</td>
					</tr>
					<tr height="30">
						<td align="center" width="200">계좌잔액</td>
						<td align="center" width="200">${article.balance }</td>
					</tr>
				</c:forEach>
				<c:forEach var="account" items="${account}">
					<tr height="30">
						<td align="center" width="200">잔액옮길계좌</td>
						<td><select name="openbank">
								<option value="다른은행계좌">${account.OPEN_ACCOUNT_NO } ${account.OPEN_BANK }</option>
						</select></td>
					</tr>
				</c:forEach>
				<tr height="30">
					<td align="center" width="200">계좌 비밀번호</td>
					<td align="center" width="200"><input type="password" size="8"
						maxlength="12" name="account_pw"></td>
				</tr>
				<tr height="30">
					<td align=center><input type="submit" value="해지"> <input
						type="button" value="취소" onclick="window.close();"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>