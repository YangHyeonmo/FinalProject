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
<div class="auth_service">
	<form method="post"
		action="<%=request.getContextPath()%>/openbanking/checknumber">
		<input type="hidden" name=random value="${random}">
		<input type="text" name="auth_num" placeholder="인증받을 번호를 입력해주세요">
		
			<div class="page">
				<button type="submit">인증하기</button>
			</div>
	</form>
	
  </div>
</body>
</html>