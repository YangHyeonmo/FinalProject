<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<div class="w3-bar w3-white">
	<button class="w3-bar-item w3-button" onclick="openTransfer('select')">조회</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('insert')">등록</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('delete')">삭제</button>
	<button class="w3-bar-item w3-button"
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'"
	>MainPage</button>
</div>
<div id="select" class="open">
	<div class="w3-container">
		<br />
		<h1>
			<b>예약조회</b>
		</h1>
		<br />
		<table class="w3-table-all">
			<td>아이디</td>
			<td>입금 될 계좌</td>
			<td>금액</td>
			<td>등록일</td>
			<td>실행일</td>
			<td>해지일</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.member_id}&emsp;&emsp;</td>
					<td>${list.my_account_num}&emsp;&emsp;</td>
					<td>${list.collecting_money}&emsp;&emsp;</td>
					<td>${list.start_date}&emsp;&emsp;</td>
					<td>${list.collecting_day}&emsp;&emsp;</td>
					<td>${list.last_run_date}&emsp;&emsp;</td>
					<td>${list.close_date}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
		<div class="w3-bar w3-white">
			<br />
			<button class="w3-bar-item w3-button"
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'"
			>즉시 모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="open" style="display: none">
	<div class="w3-container">
		<br />
		<h1>
			<b>예약 등록</b>
		</h1>
		<br />
		<form method="post" name="R"
			action="<%=request.getContextPath()%>/openbanking/ReservationRegProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required" placeholder="ID 입력"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">예약 암호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="open_account_pw"
							name="open_account_pw" required="required" placeholder="PW 입력"
						>
					</td>
				</tr>
				<tr>
					<td width="130" align="left">입금 될 계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="my_account_num"
							name="my_account_num" required="required" pattern="\d{4}-\d{2}-\d{4}"
							placeholder="ex) 1234-12-1234"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">금액</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="collecting_money"
							name="collecting_money" required="required" placeholder="money 입력"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">설정일</td>
					<td width="500">
						<input type="date" size="50" maxlength="50" id="collecting_day"
							name="collecting_day" required="required" placeholder="date 입력"
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
			<b>예약 삭제</b>
		</h1>
		<br />
		<form method="post"
			action="<%=request.getContextPath()%>/openbanking/ReservationDeleteProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required" placeholder="ID 입력"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">예약 암호</td>
					<td width="500">
						<input type="password" size="50" maxlength="50" id="open_account_pw"
							name="open_account_pw" required="required" placeholder="PW 입력"
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