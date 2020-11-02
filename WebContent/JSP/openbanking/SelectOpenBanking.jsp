<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
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
			<b>계좌 조회</b>
		</h1>
		<br />
		<table class="w3-table-all">
			<td>아이디</td>
			<td>계좌번호</td>
			<td>은행명</td>
			<td>잔액</td>
			<td>등록일</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.member_id}&emsp;&emsp;</td>
					<td>${list.open_account_no}&emsp;&emsp;</td>
					<td>${list.open_bank}&emsp;&emsp;</td>
					<td>${list.open_balance}원&emsp;&emsp;</td>
					<td>${list.regdate}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
		<div class="w3-bar w3-white">
			<br />
			<button class="w3-bar-item w3-button"
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'"
			>돈 모으기</button>
		</div>
	</div>
</div>
<div id="insert" class="open" style="display: none">
	<div class="w3-container">
		<br />
		<h1>
			<b>계좌 등록</b>
		</h1>
		<br />
		<form method="post"
			action="<%=request.getContextPath()%>/openbanking/InsertOpenBankingProc"
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
					<td width="100" align="left">계좌번호</td>
					<td width="1000">
						<input type="text" size="12" id="num1" name="num1" required="required"
							pattern="\d{4}" placeholder="4자리 number"
						>
						<input type="text" size="12" id="num2" name="num2" required="required"
							pattern="\d{2}" placeholder="2자리 number"
						>
						<input type="text" size="12" id="num3" name="num3" required="required"
							pattern="\d{4}" placeholder="4자리 number"
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
					<td width="100">은행명</td>
					<td width="">
						<select name="open_bank" size="1" style="width: 150px; font-size: 20px;">
							<option value="신한">신한</option>
							<option value="기업">기업</option>
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="하나">하나</option>
							<option value="카카오">카카오</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">금액</td>
					<td width="500">
						<input type="number" size="50" maxlength="50" id="open_balance"
							name="open_balance" required="required" placeholder="money 입력"
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
			<b>계좌 삭제</b>
		</h1>
		<br />
		<form method="post"
			action="<%=request.getContextPath()%>/openbanking/DeleteOpenBankingProc"
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
					<td width="150" align="left">삭제할 계좌번호</td>
					<td width="500">
						<input type="text" size="50" maxlength="50" id="open_account_no"
							name="open_account_no" required="required" pattern="\d{4}-\d{2}-\d{4}"
							placeholder="ex) 1234-12-1234"
						>
					</td>
				</tr>
				<tr>
					<td width="100" align="left">계좌 비밀번호</td>
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