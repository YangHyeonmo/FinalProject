<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<script>
	alert("등록된 이메일로 인증번호가 발송하였습니다");
</script>
<meta charset="UTF-8">
<title>인증</title>
</head>
<body>
	<form method="post"
		action="<%=request.getContextPath()%>/openbanking/checknumber"
	>
		<input type="hidden" name=random value="${random}">
		<table class="w3-table-all">
			<tr>
				<td width="100" align="left">이메일 인증번호를 입력하세요</td>
				<td width="500">
					<input type="text" name="auth_num">
				</td>
			</tr>
			<tr>
				<input type="submit" value="전송">
			</tr>
		</table>
	</form>
</body>
</html>