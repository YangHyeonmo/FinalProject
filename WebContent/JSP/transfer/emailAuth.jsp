<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 서비스</title>
</head>
<body>
<div class="auth_service">
  <h2>이름 : ${member.member_name }</h2>
    
  <form method="post" name="authform"  action="<%=request.getContextPath()%>/transfer/finish">
  	<input type="hidden" name="authType" value=2>
    <input class="email" type="email" name="member_email" placeholder="인증받을 이메일 입력">
   <div class="page">
  <button type="submit">인증하기</button>
  </div>
  </form>
</div>
</body>
</html>



            