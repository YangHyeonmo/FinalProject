<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<div class="accountdelete">
	<form method="POST" name="delForm">
		<input type="hidden" name="account_num" value=${account_num }>
		<c:set var="account_num" value="${account_num }" />

			<div class="table">
			<div class="table_header">
				<div class="cell">계좌명</div>
				<div class="cell">계좌번호</div>
				<div class="cell">계좌잔액</div>
				<div class="cell">잔액옮길계좌</div>
				<div class="cell">계좌 비밀번호</div>
			</div>
			
			
			
		<c:forEach var="article" items="${article}">
				<input type="hidden" name="balance" value=${article.balance }>
				<div class="row">
					<div class="cell">${article.account_name}</div>
					<div class="cell">${article.account_num }</div>
					<div class="cell">${article.balance }	<input type="hidden" name="balance" value=${article.balance }></div>
				
					<div class="cell"><select class="accountbalance" name="movebalance">
							<c:forEach var="account" items="${account}">
								<option value="다른은행계좌">${account.open_account_no}
									${account.open_bank }</option>
							<c:set var="openAccountNo" value="${account.open_account_no}"></c:set>
							</c:forEach>
					</select>
					<input type="hidden" name="open_account_no" value="${openAccountNo}"></div>
					<div class="cell"><input class="accountdeletePass "type="password" size="8"
						maxlength="12" name="account_pw"></div>
				</div>
			</c:forEach>
		</div>
		<div class="accountRec">
			<br />
			<button type="submit" id="btnDelete">해지</button> 
			<button type="button" id="cancle" onclick="window.close();">취소</button> 
		</div>
		
	</form>
</div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				if (confirm("해지하시겠습니까?")) {
					document.delForm.action = "accountDeletePro";
					document.delForm.submit();
				}
			});
		});
	</script>
