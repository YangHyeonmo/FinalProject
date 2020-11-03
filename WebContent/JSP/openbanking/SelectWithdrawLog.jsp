<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<body>
<div class="openbankFind_info">
	<button onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'">MainPage</button>
</div>
<div id="select" class="open_bank_info">
	<div class="container_info">
		<br />
		<h1>
			<b>내역조회</b>
		</h1>
		<br />
		<div class="table_info">
			<div class="table_header_info">
				<div class="cell">아이디</div>
				<div class="cell">받은 계좌번호</div>
				<div class="cell">모은 금액</div>
				<div class="cell">실행일</div>
				<div class="cell">summary</div>
				<div class="cell">memo</div>
				

			</div>
			<c:forEach var="list2" items="${list2}">
				<div class="row">
					<div class="cell">${list2.member_id}</div>
					<div class="cell">${list2.my_account_num}</div>
					<div class="cell">${list2.collecting_money}원</div>
					<div class="cell">${list2.collecting_day}</div>
					<div class="cell">${list2.summary}</div>
					<div class="cell">${list2.memo}</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
</div>
</body>