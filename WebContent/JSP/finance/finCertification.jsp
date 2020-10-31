<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<div class="w3-display-middle">
<form method="post" name="authform">
	<input type="hidden" name="fin_no" value=${fin_no}>
	<tr>
		<td><input type="button" name="message" onclick="goMessage()"
			value="문자인증"></td>
	</tr>
	<tr>
		<td><input type="button" name="email" onclick="goEmail()"
			value="이메일 인증"></td>
	</tr>
</form>
</div>
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