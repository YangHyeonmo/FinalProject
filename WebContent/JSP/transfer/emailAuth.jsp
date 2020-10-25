<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w3-container">
  <h2>${member.member_name }</h2>
    
  <form method="post" name="authform"  action="<%=request.getContextPath()%>/transfer/finish">
  	<input type="hidden" name="authType" value=2>
    <input type="text" name="member_email">이메일 입력
  		<input type="submit" name="발송">
  </form>
</div>
</body>
</html>