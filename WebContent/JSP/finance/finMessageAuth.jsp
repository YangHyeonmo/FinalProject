<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>

	<div class="w3-container">
		<div class="w3-display-middle">
			<h2>${member.member_name }</h2>

			<form method="post" name="authform"
				action="<%=request.getContextPath()%>/finance/finishProducts?fin_no=${fin_no}">
				<input type="hidden" name="authType" value=1> <input
					type="text" name="member_phonenumber">번호 입력 <input
					type="submit" name="발송">
			</form>
		</div>
	</div>

</body>
</html>