<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="w3-container">
	<br />
	<b>계좌삭제</b><br />
	<form method="post" name="writeform"
		action="<%=request.getContextPath()%>/openbanking/DeleteOpenBankingProc"
	>
		<table class="w3-table-all">
			<tr>
				<td width="70" align="center">삭제할 계좌번호</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="OPEN_ACCOUNT_NO"
						name="OPEN_ACCOUNT_NO"
					>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">아이디(@)</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="MEMBER_ID" name="MEMBER_ID">
				</td>
			</tr>
			<tr>
				<td width="70" align="center">계좌 비밀번호</td>
				<td width="330">
					<input type="password" size="40" maxlength="50" id="OPEN_ACCOUNT_PW"
						name="OPEN_ACCOUNT_PW"
					>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="삭제">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</div>