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
<title>Insert title here</title>
</head>
<body>
  <form method="post" name="authform"  action="<%=request.getContextPath()%>/transfer/realfinish">
   <input type="hidden" name="random" value="${random }">
  <input type="hidden" name="authType" value=1>
	
		인증번호:<input type="text" name="auth">
       	 <input type="submit" name="입력">
  </form>
</body>
</html>