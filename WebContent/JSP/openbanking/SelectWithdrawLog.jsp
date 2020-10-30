<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
			<td>SUMMARY</td>
			<td>MEMO</td>
			<c:forEach var="list2" items="${list2}">
				<tr>
					<td>${list2.member_id}&emsp;&emsp;</td>
					<td>${list2.MY_ACCOUNT_NUM}&emsp;&emsp;</td>
					<td>${list2.COLLECTING_MONEY}원&emsp;&emsp;</td>
					<td>${list2.COLLECTING_DAY}&emsp;&emsp;</td>
					<td>${list2.SUMMARY}&emsp;&emsp;</td>
					<td>${list2.MEMO}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>