<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="openbankFind">
	<button class="w3-bar-item w3-button" onclick="openTransfer('select')">조회</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('insert')">등록</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('delete')">삭제</button>
	<button class="w3-bar-item w3-button"
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'">MainPage</button>
</div>
<div id="select" class="bank_reservation">
	<div class="container">
		<br />
		<h1>
			<b>예약조회</b>
		</h1>
		<br />
		<div class="bank_reservation_table">
			<div class="table_header">
				<div class="cell">아이디</div>
				<div class="cell">입금 될 계좌</div>
				<div class="cell">금액</div>
				<div class="cell">등록일</div>
				<div class="cell">실행일</div>
				<div class="cell">해지일</div>

			</div>


			<c:forEach var="list" items="${list}">
				<div class="row">
					<div class="cell">${list.member_id}</div>
					<div class="cell">${list.my_account_num}</div>
					<div class="cell">${list.collecting_money}</div>
					<div class="cell">${list.start_date}</div>
					<div class="cell">${list.collecting_day}</div>
					<div class="cell">${list.last_run_date}</div>
					<div class="cell">${list.close_date}</div>
				</div>
			</c:forEach>
		</div>

		<div class="collect_money">
			<br />
			<button
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'">즉시모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="bank_reservation" style="display: none">
	<div class="container_reservation">
		<br />
		<h1>
			<b>예약 등록</b>
		</h1>
		<br />
		<form method="post" name="R"
			action="<%=request.getContextPath()%>/openbanking/ReservationRegProc">

			<div class="table2">
				<div class="table_header2">
					<div class="cell2">아이디 확인</div>
					<div class="cell2">예약 암호</div>
					<div class="cell2">입금 될 계좌번호</div>
					<div class="cell2">금액</div>
					<div class="cell2">설정일</div>

				</div>
				<div class="row2">
					<div class="cell2">
						<input class="member_id" type="text" size="50" maxlength="50"
							id="member_id" name="member_id" required="required"
							placeholder="ID 입력">
					</div>
					<div class="cell2">
						<input class="open_password" type="password" size="50"
							maxlength="50" id="open_account_pw" name="open_account_pw"
							required="required" placeholder="PW 입력">
					</div>

					<div class="cell2">
						<input class="account_number" type="text" size="12"
							id="my_account_num" name="my_account_num" maxlength="10"
							required="required" pattern="\d{4}" placeholder="10자리 number">
					</div>

					<div class="cell2">
						<input class="collecting_money" type="text" size="50"
							maxlength="50" id="collecting_money" name="collecting_money"
							required="required" placeholder="money 입력">
					</div>

					<div class="cell2">
						<input class="collecting_day" type="date" size="50" maxlength="50"
							id="collecting_day" name="collecting_day" required="required"
							placeholder="date 입력">
					</div>
				</div>
			</div>
			<br />
			<div class="openbankFind">
				<button type="submit">등록</button>
				<button type="reset">다시작성</button>
			</div>
		</form>
	</div>
</div>
<div id="delete" class="bank_reservation" style="display: none">
	<div class="delete_reservation">
		<br />
		<h1>
			<b>예약 삭제</b>
		</h1>
		<br />
		<form method="post" name="R"
			action="<%=request.getContextPath()%>/openbanking/ReservationRegProc">

			<div class="table2">
				<div class="table_header2">
					<div class="cell2">아이디 확인</div>
					<div class="cell2">예약 암호</div>
			

				</div>
				<div class="row2">
					<div class="cell2">
						<input class="member_id" type="text" size="50" maxlength="50"
							id="member_id" name="member_id" required="required"
							placeholder="ID 입력">
					</div>
					<div class="cell2">
						<input class="open_password" type="password" size="50"
							maxlength="50" id="open_account_pw" name="open_account_pw"
							required="required" placeholder="PW 입력">
					</div>

					
				</div>
			</div>
			<br />
			<div class="openbankFind">
				<button type="submit">등록</button>
				<button type="reset">다시작성</button>
			</div>
		</form>
	</div>
	
	
</div>
<script>
	function openTransfer(bank) {
		var i;
		var x = document.getElementsByClassName("bank_reservation");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(bank).style.display = "block";
	}
</script>