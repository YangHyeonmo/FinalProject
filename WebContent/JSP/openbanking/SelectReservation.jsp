<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="w3-bar w3-white">
	<button class="w3-bar-item w3-button" onclick="openTransfer('select')">조회</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('insert')">등록</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('delete')">삭제</button>
	<!-- <button class="w3-bar-item w3-button" onclick="openTransfer('modify')">변경</button> -->
</div>
<div id="select" class="open">
	<div class="w3-container">
		<br /> <b>예약조회</b><br />
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
					<td>${list.MY_ACCOUNT_NUM}&emsp;&emsp;</td>
					<td>${list.COLLECTING_MONEY}&emsp;&emsp;</td>
					<td>${list.START_DATE}&emsp;&emsp;</td>
					<td>${list.COLLECTING_DAY}&emsp;&emsp;</td>
					<td>${list.LAST_RUN_DATE}&emsp;&emsp;</td>
					<td>${list.CLOSE_DATE}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
		<div class="w3-bar w3-white">
			<br />
			<button class="w3-bar-item w3-button"
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'"
			>예약 모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="open" style="display: none">
	<div class="w3-container">
		<br /> <b>예약등록</b><br />
		<form method="post" name="R"
			action="<%=request.getContextPath()%>/openbanking/ReservationRegProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="130" align="left">입금 될 계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="MY_ACCOUNT_NUM"
							name="MY_ACCOUNT_NUM" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">금액</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="COLLECTING_MONEY"
							name="COLLECTING_MONEY" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">예약 암호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="OPEN_ACCOUNT_PW"
							name="OPEN_ACCOUNT_PW" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">설정일</td>
					<td width="500">
						<input type="date" size="50" maxlength="50" id="COLLECTING_DAY"
							name="COLLECTING_DAY" required="required"
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
		<br /> <b>예약삭제</b><br />
		<form method="post" name="writeform"
			action="<%=request.getContextPath()%>/openbanking/ReservationDeleteProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">예약 암호</td>
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
<%-- 
<div id="modify" class="open" style="display: none">
	<div class="w3-container">
		<br /> <b>예약변경</b><br />
		<form method="post" name="R"
			action="<%=request.getContextPath()%>/openbanking/ReservationModifyProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="100" align="left">아이디 확인</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="member_id"
							name="member_id" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">예약 암호</td>
					<td width="500">
						<input type="password" size="50" maxlength="50" id="OPEN_ACCOUNT_PW"
							name="OPEN_ACCOUNT_PW" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="130" align="left">입금 될 계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="MY_ACCOUNT_NUM"
							name="MY_ACCOUNT_NUM" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">금액</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="COLLECTING_MONEY"
							name="COLLECTING_MONEY" required="required"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">설정일</td>
					<td width="500">
						<input type="date" size="50" maxlength="50" id="COLLECTING_DAY"
							name="COLLECTING_DAY" required="required"
						>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<br />
						<input type="submit" value="변경">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
 --%>
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