<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="w3-container">
	<br/><b>예약등록</b><br/>
	<form method="post" name="writeform" 
		action="<%=request.getContextPath()%>/openbanking/InsertOpenBankingProc"
	>
		<table class="w3-table-all">
			<tr>
				<td width="70" align="center">계좌번호</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="OPEN_ACCOUNT_NO"
						name="OPEN_ACCOUNT_NO"   
					>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">은행명</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="OPEN_BANK" name="OPEN_BANK">
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
				<td width="70" align="center">잔액</td>
				<td width="330">
					<input type="number" value=0 size="40" maxlength="50" id="OPEN_BALANCE"
						name="OPEN_BALANCE"
					>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">카드명</td>
				<td width="330">
					<input type="text" size="40" maxlength="50" id="OPEN_CARD_NAME"
						name="OPEN_CARD_NAME"
					>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</div>