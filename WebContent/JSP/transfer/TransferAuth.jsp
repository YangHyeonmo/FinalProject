
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="transfer_auth_process">
		<span class="detail">명세서</span>
		<hr>
		<div class="to_who">
		<h2>To-Who &nbsp;&nbsp;: <span>${transferdata.transfer_to_member_id }님에게</span></h2>
		<h2>송금금액 : <span>${transferdata.transfer_price}원</span> </h2>
		<h2>받는계좌 : <span>${transferdata.transfer_to_account_no }</span> </h2>
		<h2>통장표시 : <span>${transferdata.transfer_alias }</span> </h2>
		</div>
		
		<a href="./TransferWrite">돌아가기</a>
			
		<form method="post" name="authform">
					<input type="button" name="message" onclick="goMessage()" value="문자인증">
					<input type="button" name="email" onclick="goEmail()" value="이메일 인증">
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