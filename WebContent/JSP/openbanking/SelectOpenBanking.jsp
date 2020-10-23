<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="w3-bar w3-white">
	<button class="w3-bar-item w3-button" onclick="openTransfer('select')">조회</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('insert')">삽입</button>
	<button class="w3-bar-item w3-button" onclick="openTransfer('delete')">삭제</button>
</div>
<div id="select" class="open">
	<div class="w3-container">
		<br /> <b>계좌조회</b><br />
		<table class="w3-table-all">
			<td>&emsp;&emsp;계좌번호</td>
			<td>은행명</td>
			<td>아이디</td>
			<td>잔액</td>
			<td>카드명</td>
			<td>등록일</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>
						<input type="checkbox" name="DELETE">
						&nbsp;&nbsp;&nbsp;${list.OPEN_ACCOUNT_NO}
					</td>
					<td>${list.OPEN_BANK}</td>
					<td>${list.MEMBER_ID}</td>
					<td>${list.OPEN_BALANCE}</td>
					<td>${list.OPEN_CARD_NAME}</td>
					<td>${list.REGDATE}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="w3-bar w3-white">
			<button class="w3-bar-item w3-button"
				onclick="document.location.href='<%=request.getContextPath()%>/openbanking/CollectOpenBanking'"
			>잔액 모으기</button>
		</div>
		</form>
		<%-- 	<script>
    $(document).ready(function() {
        //confirm() 확인 => true, 취소는 = false
       
        $("#ALL").click(function() {
        	location.href=<%=request.getContextPath()%>+"/openbanking/WithdrawOpenBanking";
        });
 
        //삭제버튼 클릭
        $("#btnDelete").click(function() {
            if (confirm("삭제하시겠습니까?")) {
                document.form1.action = "/web03/member/memberDelete";
                document.form1.submit();
            }
        });
 
    });
</script> --%>
	</div>
</div>
<div id="insert" class="open" style="display: none">
	<div class="w3-container">
		<br /> <b>계좌등록</b><br />
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
						<input type="text" size="40" maxlength="50" id="OPEN_BANK"
							name="OPEN_BANK"
						>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">아이디(@)</td>
					<td width="330">
						<input type="text" size="40" maxlength="50" id="MEMBER_ID"
							name="MEMBER_ID"
						>
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
</div>
<div id="delete" class="open" style="display: none">
	<div class="w3-container">
		<br /> <b>계좌삭제</b><br />
		<form method="post" name="writeform"
			action="<%=request.getContextPath()%>/openbanking/DeleteOpenBankingProc"
		>
			<table class="w3-table-all">
				<tr>
					<td width="70" align="center">삭제할 계좌번호</td>
					<td width="330">
						<input type="text" size="40" maxlength="50" id="OPEN_ACCOUNT_NO"
							name="OPEN_ACCOUNT_NO"
						>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">아이디(@)</td>
					<td width="330">
						<input type="text" size="40" maxlength="50" id="MEMBER_ID"
							name="MEMBER_ID"
						>
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
					<td colspan=2 align="center">
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