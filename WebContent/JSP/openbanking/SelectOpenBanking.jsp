<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="w3-bar w3-white">
	<button class="w3-bar-item w3-button" onclick="openTransfer('select')">조회</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('insert')">삽입</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('delete')">삭제</button>
	<button class="w3-bar-item w3-button"
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'"
	>MainPage</button>
</div>
<div id="select" class="open">
	<div class="w3-container">
		<br />
		<h1>
			<b>계좌조회</b>
		</h1>
		<br />
		<table class="w3-table-all">
			<td>계좌번호</td>
			<td>은행명</td>
			<td>아이디</td>
			<td>잔액</td>
			<td>카드명</td>
			<td>등록일</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.OPEN_ACCOUNT_NO}&emsp;&emsp;</td>
					<td>${list.OPEN_BANK}&emsp;&emsp;</td>
					<td>${list.member_id}&emsp;&emsp;</td>
					<td>${list.OPEN_BALANCE}원&emsp;&emsp;</td>
					<td>${list.OPEN_CARD_NAME}&emsp;&emsp;</td>
				<%-- 	<td>${list.REGDATE}&emsp;&emsp;</td> --%>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.REGDATE}" /></td>
				</tr>
			</c:forEach>
		</table>
		<div class="w3-bar w3-white">
			<br />
			<button class="w3-bar-item w3-button"
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'"
			>잔액 모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="open" style="display: none">
	<div class="w3-container">
		<br />
		<h1>
			<b>계좌등록</b>
		</h1>
		<br />
		<form method="post" name="writeform"
			action="<%=request.getContextPath()%>/openbanking/InsertOpenBankingProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="OPEN_ACCOUNT_NO"
							name="OPEN_ACCOUNT_NO" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">은행명</td>
					<td width="">
						<input type="text" size="50" maxlength="50" id="OPEN_BANK"
							name="OPEN_BANK" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">아이디</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="110" align="left">계좌 비밀번호</td>
					<td width="500">
						<input type="password" size="50" maxlength="50" id="OPEN_ACCOUNT_PW"
							name="OPEN_ACCOUNT_PW" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">잔액</td>
					<td width="500">
						<input type="text" value=0 size="50" maxlength="50" id="OPEN_BALANCE"
							name="OPEN_BALANCE" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">카드명</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="OPEN_CARD_NAME"
							name="OPEN_CARD_NAME" required="required"
						>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<br />
						<input type="submit" value="등록">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<div id="delete" class="open" style="display: none">
	<div class="w3-container">
		<br />
		<h1>
			<b>계좌삭제</b>
		</h1>
		<br />
		<form method="post" name="writeform"
			action="<%=request.getContextPath()%>/openbanking/DeleteOpenBankingProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="150" align="left">삭제할 계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="OPEN_ACCOUNT_NO"
							name="OPEN_ACCOUNT_NO" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">계좌 비밀번호</td>
					<td width="500">
						<input type="password" size="50" maxlength="50" id="OPEN_ACCOUNT_PW"
							name="OPEN_ACCOUNT_PW" required="required"
						>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<br />
						<input type="submit" value="삭제">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script>
	function openTransfer(bank) {
		var i;
		var x = document.getElementsByClassName("open");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(bank).style.display = "block";
	}
</script>