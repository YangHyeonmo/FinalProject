
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
				<td>${transferdata.transfer_to_member_id }�Կ���
					${transferdata.transfer_price } ��ü</td>
			</tr>
			<tr>
				<td>${transferdata.transfer_price }�۱�</td>
			</tr>
			<tr>
				<td>�޴º� ���� ${transferdata.transfer_to_account_no }</td>
			</tr>
			<tr>
				<td>�޴º� ���� ǥ�� : ${transferdata.transfer_alias }</td>
			</tr>
			<tr>
				<td>
					<a href="./TransferWrite">����</a>
				</td>
			</tr>
		</table>
		<form method="post" name="authform">
			<tr>
				<td>
					<input type="button" name="message" onclick="goMessage()" value="��������">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" name="email" onclick="goEmail()" value="�̸��� ����">
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