<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<div class="changePwd">
	<form method="POST" name="form1">
		<input type="hidden" name="account_num" value=${account_num }>
		<h3>계좌 비밀번호 변경</h3>
		<div class="table">
			<div class="row">
					
				<input class="pass" type="password" size="8" maxlength="12"
						name="account_pw" placeholder="현재 비밀번호"><br/>
				<input  class="pass" type="password" size="8" maxlength="12"
						name="pw_new"  placeholder="새로운 비밀번호"><br/>
				<input  class="pass" type="password" size="8" maxlength="12"
						name="pw_new_check" placeholder="새로운 비밀번호 확인">
				</div>
			</div>
			<div class="changepassword">
			<input type="button" value="변경" id="btnUpdate"> 
			<input type="button" value="취소" onclick="window.close();">
			</div>
		
	</form>
</div>
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
