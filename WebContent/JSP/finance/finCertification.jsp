<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
<div class="finance_auth">
	<form method="post" name="authform">
		<input type="hidden" name="fin_no" value="${fin_no}"> 
		<input type="button" class="button1" name="message" onclick="goMessage()" value="문자인증" >
		<input type="button" class="button2" name="email" onclick="goEmail()"  value="이메일 인증" >
	</form>
</div>
</body>
<script>
	function goMessage() {
		location.href = "finMessageAuth?fin_no=${fin_no}"
	}
</script>
<script>
	function goEmail() {
		location.href = "finEmailAuth?fin_no=${fin_no}"
	}
</script>