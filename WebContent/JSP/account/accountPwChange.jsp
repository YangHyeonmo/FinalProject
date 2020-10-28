<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body h3 {
	color: orange;
	font-size: 20px;
	text-align: center;
}

body .button {
	width: 250px;
	margin-left: 10rem;
	position: absolute;
	margin-top: 20px;
}
</style>

<body>
	<form method="POST" name="form1">
		<input type="hidden" name="account_num" value=${account_num }>
		<h3>계좌 비밀번호 변경</h3>
		<div>
			<table class="w3-table-all" align="center">
				<tr height="30">
					<td align=left><input type="password" size="8" maxlength="12"
						name="account_pw">현재 비밀번호</td>
				</tr>
				<tr height="30">
					<td align=left><input type="password" size="8" maxlength="12"
						name="pw_new">새로운 비밀번호</td>
				</tr>
				<tr height="30">
					<td align=left><input type="password" size="8" maxlength="12"
						name="pw_new_check">새로운 비밀번호 확인</td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="변경"
						id="btnUpdate"> <input type="button" value="취소"
						onclick="window.close();">
						<div style="color: red;">${message }</div></td>
				</tr>

			</table>
		</div>



	</form>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			if (confirm("수정하시겠습니까?")) {
				document.form1.action = "pwUpdate";
				document.form1.submit();
			}
		});
	});
</script>
</body>
</html>