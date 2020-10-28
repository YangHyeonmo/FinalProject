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
				<td width="150" align="left">해당 계좌 아이디</td>
				<td width="500">
					<input type="text" size="50" maxlength="50" id="member_id" name="member_id">
				</td>
			</tr>
			<tr>
				<td width="150" align="left">해당 계좌 비밀번호 </td>
				<td width="500">
					<input type="password" size="50" maxlength="50" id="OPEN_ACCOUNT_PW"
						name="OPEN_ACCOUNT_PW"
					>
				</td>
			</tr>
			<tr>
				<td width="100" align="left">금액</td>
				<td width="500">
					<input type="text" size="50" maxlength="50" id="money" name="money">
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