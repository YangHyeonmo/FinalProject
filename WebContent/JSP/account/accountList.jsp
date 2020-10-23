<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
td.moreMenu {
	font-weight: bold;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('td.moreMenu').hide();
		$('td.button').click(function() {
			$('td.moreMenu').toggle();

		});
	});
</script>

<h3 style="font-size: 20px; display: inline-block;">나루뱅크 계좌조회</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
	<a href="<%=request.getContextPath()%>ㅇㅇ"> 다른은행 계좌조회</a>
</h3>
<h5>
	조회기준일시:
	<script type="text/javascript">
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth();
		let date = today.getDate();
		let hours = today.getHours();
		let minutes = today.getMinutes();
		let seconds = today.getSeconds();
		document
				.write(
						year + '.' + month + '.' + date + ' ' + hours + ':'
								+ minutes + ':' + seconds)
	</script>
</h5>

<h4>입출금</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<table class="w3-table-all" align="center">
		<tr class="w3-grey">
			<td align="center">입출금 (${count1 })계좌</td>
		</tr>
	</table>
	<c:if test="${count1 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000"><strong>입출금통장</strong> 만들 때 <br />은행
					방문 NO, 이젠 모바일로 손안에서 OK</br></td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/계좌개설하기"> 개설하기</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count1 != 0 }">
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${aaList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">잔액 ${article.balance }원</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							조회</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/이체하기"> 이체</a></td>
					<td class="button" width="100">계좌관리</td>
					<td class="moreMenu"><a href="URL"
						onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
							별명 관리</a></td>
					<td class="moreMenu"><a href="URL"
						onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
							계좌개설확인서(통장사본)</a></td>
					<td class="moreMenu">계좌비밀번호변경</td>
					<td class="moreMenu">계좌삭제</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<h4>예금</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<c:if test="${count2 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000">조회 내역이 없습니다. </br> 재테크 고수는 놓치지 않는
					예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.
				</td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/예금가입하기"> 가입하기</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count2 != 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center">예금 (${count2 })계좌</td>
			</tr>
		</table>
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${bbList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">잔액 ${article.balance }원</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							조회</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/이체하기"> 이체</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/계좌관리"> 계좌관리</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<h4>적금</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<c:if test="${count3 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000">조회 내역이 없습니다. </br> 재테크 고수는 놓치지 않는
					예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.
				</td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/적금가입하기"> 가입하기</a></td>
			</tr>
		</table>
	</c:if>
	<table class="w3-table-all" align="center">
		<tr class="w3-grey">
			<td align="center">적금 (${count3 })계좌</td>
		</tr>
	</table>
	<c:if test="${count3 != 0 }">
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${ccList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">잔액 ${article.balance }원</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							조회</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/이체하기"> 해지</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/계좌관리"> 계좌관리</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>