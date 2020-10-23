<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="w3-container">
	<br /> <b>즉시 모으기</b><br />
	<form method="post" name="writeform"
		action="<%=request.getContextPath()%>/openbanking/CollectOpenBankingProc"
	>
		<input type="hidden" name="coltype" value=1>
		<table class="w3-table-all">
			<tr>
				<td width="70" align="center">아이디 확인</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="MEMBER_ID" name="MEMBER_ID">
				</td>
			</tr>
			<tr>
				<td width="70" align="center">비밀번호 확인</td>
				<td width="330">
					<input type="password" size="40" maxlength="50" id="OPEN_ACCOUNT_PW"
						name="OPEN_ACCOUNT_PW"
					>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">금액</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="money" name="money">
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="모으기">
				</td>
			</tr>
		</table>
	</form>
</div>