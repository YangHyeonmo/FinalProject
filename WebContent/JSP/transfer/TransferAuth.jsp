
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>${transferdata.transfer_to_member_id }님에게
					${transferdata.transfer_price } 이체</td>
			</tr>
			<tr>
				<td>${transferdata.transfer_price }송금</td>
			</tr>
			<tr>
				<td>받는분 계좌 ${transferdata.transfer_to_account_no }</td>
			</tr>
			<tr>
				<td>받는분 통장 표시 : ${transferdata.transfer_alias }</td>
			</tr>
			<tr>
				<td>
					<a href="./TransferWrite">수정</a>
				</td>
			</tr>
		</table>
		<form method="post" name="authform">
			<tr>
				<td>
					<input type="button" name="message" onclick="goMessage()" value="문자인증">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" name="email" onclick="goEmail()" value="이메일 인증">
				</td>
			</tr>
		</form>
	</div>
</body>
<script>
	function goMessage() {
		location.href = "messageAuth"
	}
</script>
<script>
	function goEmail() {
		location.href = "emailAuth"
	}
</script>
</html>