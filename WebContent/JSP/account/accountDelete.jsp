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
	<form method="POST" name="delForm">
		<input type="hidden" name="account_num" value=${account_num }>

		<div>
			<table class="w3-table-all" align="center">
			
				<c:forEach var="article" items="${article}">
					<input type="hidden" name="balance" value=${article.balance }>
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
						<td align="center" width="200">${article.balance }<input
							type="hidden" name="balance" value=${article.balance }></td>
					</tr>
				</c:forEach>

				<tr height="30">
					<td align="center" width="200">잔액옮길계좌</td>
					<td><select name="movebalance">
							<c:forEach var="account" items="${account}">
								<option value="다른은행계좌">${account.open_account_no}
									${account.open_bank }</option>
							<c:set var="openAccountNo" value="${account.open_account_no}"></c:set>
							</c:forEach>
					</select>
					<input type="hidden" name="open_account_no" value="${openAccountNo}"></td>
				</tr>

				<tr height="30">
					<td align="center" width="200">계좌 비밀번호</td>
					<td align="center" width="200"><input type="password" size="8"
						maxlength="12" name="account_pw"></td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="변경"
						id="btnDelete"> <input type="button" value="취소"
						onclick="window.close();"></td>
				</tr>
			</table>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
		$(document).ready(function() {
			$("#btnDelete").click(function() {

				if (confirm("해지하시겠습니까?")) {
					document.delForm.action = "accountDeletePro";
					document.delForm.submit();
				}
			});
		});
	</script>
</body>
</html>