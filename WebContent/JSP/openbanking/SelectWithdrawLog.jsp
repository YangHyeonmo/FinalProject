<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<body>
	<button class="w3-bar-item w3-button"
		onclick="document.location.href='<%=request.getContextPath()%>/view/mainPage'"
	>MainPage</button>
	<div class="w3-container">
		<br />
		<h1>
			<b>내역조회</b>
		</h1>
		<br />
		<table class="w3-table-all">
			<td>아이디</td>
			<td>받은 계좌번호</td>
			<td>모은 금액</td>
			<td>실행일</td>
			<td>summary</td>
			<td>memo</td>
			<c:forEach var="list2" items="${list2}">
				<tr>
					<td>${list2.member_id}&emsp;&emsp;</td>
					<td>${list2.my_account_num}&emsp;&emsp;</td>
					<td>${list2.collecting_money}원&emsp;&emsp;</td>
					<td>${list2.collecting_day}&emsp;&emsp;</td>
					<td>${list2.summary}&emsp;&emsp;</td>
					<td>${list2.memo}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>