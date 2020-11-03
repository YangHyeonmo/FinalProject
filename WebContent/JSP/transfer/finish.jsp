<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${error==1}">
	<script>
		alert("인증번호가 틀렸습니다");
	</script>
</c:if>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 완료</title>
</head>
<body>
<div class="auth_service">    
  <form method="post" name="authform"  action="<%=request.getContextPath()%>/view/mainPage">
   <input type="hidden" name="random" value="${random }">
  	<input type="hidden" name="authType" value=1>
    <input type="text" name="auth" placeholder="인증번호  입력">
   <div class="page">
  <button type="submit">인증완료</button>
  </div>
  </form>
</div>
</body>
</html>
