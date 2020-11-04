<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<div class="changeAlias">
<form method="POST" name="changeForm" action="<%=request.getContextPath()%>/account/aliasUpdatePro">
		<input type="hidden" name="account_num" value=${account_num }>
		<c:set var="account_num" value="${account_num }" />
			<h3>계좌 별명 변경</h3>
			<div class="table">
			<div class="table_header">
				<div class="cell">계좌명</div>
				<div class="cell">계좌번호</div>
				<div class="cell">계좌별명</div>
			</div>
		<c:forEach var="article" items="${article}">
				<div class="row">
					<div class="cell">${article.account_name}</div>
					<div class="cell">${article.account_num }</div>
					<div class="cell"><input type="text" size="10" maxlength="12" name="account_alias" placeholder="${article.account_alias }"></div>
				</div>
			</c:forEach>
		</div>
		<div class="collect_money">
			<br />
			<button type="submit">저장</button> 
			<button type="button" onclick="window.close();">취소</button> 
		</div>
	
	</form>

</div>
