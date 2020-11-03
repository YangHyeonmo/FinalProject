<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${error==1}">
	<script>
		alert("인증번호가 일치하지 않습니다!!");
	</script>
	<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
</c:if>
<c:if test="${error==2}">
	<script>
		alert("계좌 등록완료!!");
	</script>
	<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
</c:if>
<c:if test="${error==3}">
	<script>
		alert("계좌 등록에 실패하였습니다!!");
	</script>
	<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
</c:if>
<c:if test="${error==4}">
	<script>
		alert("아이디가 틀렸습니다!!");
	</script>
	<meta http-equiv="Refresh" content="0; url=SelectOpenBanking" />
</c:if>
<!DOCTYPE html>
<meta charset="UTF-8">
<div class="openbankFind">
	<button onclick="openTransfer('select')">조회</button>
	<button onclick="openTransfer('insert')">등록</button>
	<button onclick="openTransfer('delete')">삭제</button>
	<button
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'">MainPage</button>
</div>
<div id="select" class="open_bank">
	<div class="container">
		<br />
		<h1>
			<b>계좌 조회</b>
		</h1>
		<br />
		<div class="table">
			<div class="table_header">
				<div class="cell">아이디</div>
				<div class="cell">계좌번호</div>
				<div class="cell">은행명</div>
				<div class="cell">잔액</div>
				<div class="cell">등록일</div>

			</div>
			<c:forEach var="list" items="${list}">
				<div class="row">
					<div class="cell">${list.member_id}</div>
					<div class="cell">${list.open_account_no}</div>
					<div class="cell">${list.open_bank}</div>
					<div class="cell">${list.open_balance}원</div>
					<div class="cell">${list.regdate}</div>
				</div>
			</c:forEach>
		</div>
		<div class="collect_money">
			<br />
			<button
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'">돈
				모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="open_bank" style="display: none">
	<div class="container">
		<br />
		<h1>
			<b>계좌 등록</b>
		</h1>
		<br />
		<form method="post"
			action="<%=request.getContextPath()%>/openbanking/InsertOpenBankingProc">
			<div class="table2">
				<div class="table_header2">
					<div class="cell2">아이디 확인</div>
					<div class="cell2">계좌번호</div>
					<div class="cell2">계좌 비밀번호</div>
					<div class="cell2">은행명</div>
					<div class="cell2">금액</div>

				</div>

				<div class="row2">
					<div class="cell2">
						<input class="member_id" type="text" size="50" maxlength="50"
							id="member_id" name="member_id" required="required"
							placeholder="ID 입력">
					</div>

					<div class="cell2">
						<input class="account_number" type="text" size="12"  id="open_account_no"
							name="open_account_no" maxlength="12" required="required" pattern="\d{4}-\d{2}-\d{4}" placeholder="ex) 1234-12-1234" >


					</div>
					<div class="cell2">
						<input class="open_password" type="password" size="50"
							maxlength="50" id="open_account_pw" name="open_account_pw"
							required="required" placeholder="PW 입력">
					</div>
					<div class="cell2">
						<select class="choose_bank" name="open_bank" size="1">
							<option value="신한">신한</option>
							<option value="기업">기업</option>
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="하나">하나</option>
							<option value="카카오">카카오</option>
						</select>
					</div>
					<div class="cell2">
						<input class="open_balance" type="number" size="50" maxlength="50"
							id="open_balance" name="open_balance" required="required"
							placeholder="money 입력">
					</div>

				</div>
			</div>
			<br /> 
			<div class="openbankFind">
			<button type="submit" >등록 </button>
			<button type="reset" >다시작성</button>
			</div>
		</form>
	</div>
</div>
<div id="delete" class="open_bank" style="display: none">
	<div class="container">
		<br />
		<h1>
			<b>계좌 삭제</b>
		</h1>
		<br />
		<form method="post"
			action="<%=request.getContextPath()%>/openbanking/DeleteOpenBankingProc">
			
			<div class="table3">
				<div class="table_header3">
					<div class="cell3">아이디 확인</div>
					<div class="cell3">삭제할 계좌번호</div>
					<div class="cell3">계좌 비밀번호</div>
			
				</div>
			
			
				<div class="row3">
					<div class="cell3">
						<input class="member_id" type="text" size="50" maxlength="50"
							id="member_id" name="member_id" required="required"
							placeholder="ID 입력">
					</div>
						<div class="cell3">
						<input class="account_number" type="text" size="50" maxlength="50"
						id="open_account_no" name="open_account_no" required="required"
						pattern="\d{4}-\d{2}-\d{4}" placeholder="ex) 1234-12-1234">
					</div>
					
						<div class="cell3">
						<input class="open_password" type="password" size="50"
						maxlength="50" id="open_account_pw" name="open_account_pw">
					</div>
					</div>
				</div>
					<br />
				
		<div class="openbankFind3">
			<button type="submit" >삭제 </button>
			<button type="reset" >다시작성</button>
			</div>
				
		</form>
	</div>
</div>
<script>
	function openTransfer(bank) {
		var i;
		var x = document.getElementsByClassName("open_bank");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(bank).style.display = "block";
	}
</script>
<script>
	function numberMaxLength(e) {
		if (e.value.length != length) {
			e.value = e.value.slice(0, e.length);
		}
	}
</script>
<script>
	$("input:text[numberOnly]").on("keyup", function() {

		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
</script>
<!-- pattern="(010)-\d{3,4}-\d{4}" -->