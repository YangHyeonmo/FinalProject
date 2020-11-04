<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<div class="openbankFind4">
<button onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'">MainPage</button>
</div>

<div id="select" class="open_bank">
	<div class="container">
		<br />
		<h1>
			<b>돈 모으기</b>
		</h1>
	<br />
	<form method="post" action="<%=request.getContextPath()%>/openbanking/CollectOpenBankingProc">
		<input type="hidden" name="coltype" value=1>
		
			<div class="table4">
				<div class="table_header4">
				<div class="cell4">아이디 확인</div>
				<div class="cell4">계좌 비밀번호</div>
				<div class="cell4">금액</div>

			</div>
					<div class="row4">
					<div class="cell4">
						<input class="member_id" type="text" size="50" maxlength="50" id="member_id" name="member_id"
						required="required" placeholder="ID 입력">
					</div>
						<div class="cell4">
						<input class="open_account_pw" type="password" size="50" maxlength="50" id="open_account_pw"
						name="open_account_pw" required="required" placeholder="PW 입력">
					</div>
					
						<div class="cell4">
						<input class="money" type="number" size="50" maxlength="50" id="money" name="money"
						required="required" placeholder="money 입력" min="0">
					</div>
					</div>
		</div>
		
		<div class="openbankFind4">
			<button type="submit" >모으기 </button>
			<button type="reset" >다시작성</button>
			</div>
	</form>
	</div>
</div>