<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="w3-container">
	<span class="w3-center  w3-large">
		조회날짜
		<input type="date" id="UserCheckIn" name="UserCheckIn"
                  min="2020-08-01" max="2020-12-31" name="date"
                  contenteditable="false"> ~
        <input type="date" id="UserCheckIn" name="UserCheckIn"
                  min="2020-08-01" max="2020-12-31" name="date"
                  contenteditable="false">
        <a href="<%=request.getContextPath() %>/account/조회날짜설정">  
		 조회</a>
                  

	</span>

	<table class="w3-table-all" width="700">
		<tr class="w3-grey">
			<td align="center" width="100">날짜</td>
			<td align="center" width="50">출금</td>
			<td align="center" width="250">입금</td>
			<td align="center" width="150">잔액</td>
			<td align="center" width="150">보낸/받는이</td>
			<td align="center" width="150">내용</td>
			<td align="center" width="150">거래점</td>
		</tr>
		<c:set var="account_num" value="${account_num }"/>
		<c:forEach var="article" items="${article}">  <!-- var=제네릭참조형  items=컬렉션 -->
	
		<tr height="30">		
			<td align="center" width="100">${article.account_date }</td>
			<td align="center" width="100">${article.withdraw}</td>
			<td align="center" width="150">${article.deposit }</td>
			<td align="center" width="50">${article.balance }</td>
			<td align="center" width="150">${article.send_get }</td>
			<td align="center" width="50">${article.content }</td>
			<td align="center" width="50">${article.bank_place }</td>
			
		</tr>
		 </c:forEach>
	</table>
</div>

   