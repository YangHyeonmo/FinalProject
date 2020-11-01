<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<div class="w3-bar w3-white">
	<button class="w3-bar-item w3-button"
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'"
	>MainPage</button>
</div>
<div class="w3-container">
	<br />
	<h1>
		<b>돈 모으기</b>
	</h1>
	<br />
	<form method="post"
		action="<%=request.getContextPath()%>/openbanking/CollectOpenBankingProc"
	>
		<input type="hidden" name="coltype" value=1>
		<table class="w3-table-all">
			<tr>
				<td width="100" align="left">아이디 확인</td>
				<td width="500">
					<input type="text" size="50" maxlength="50" id="member_id" name="member_id"
						required="required" placeholder="ID 입력"
					>
				</td>
			</tr>
			<tr>
				<td width="110" align="left">계좌 비밀번호</td>
				<td width="500">
					<input type="password" size="50" maxlength="50" id="open_account_pw"
						name="open_account_pw" required="required" placeholder="PW 입력"
					>
				</td>
			</tr>
			<tr>
				<td width="100" align="left">금액</td>
				<td width="500">
					<input type="number" size="50" maxlength="50" id="money" name="money"
						required="required" placeholder="money 입력"
					>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="left">
					<br />
					<input type="submit" value="모으기">
				</td>
			</tr>
		</table>
	</form>
</div>