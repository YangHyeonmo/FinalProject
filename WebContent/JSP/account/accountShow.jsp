<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="./DateAccountList" method="post" name="accountshowform">
	<div class="w3-container">
		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<tr>
			<td>날짜 조회</td>
				<td colspan="5"><input type="hidden" value=0
					name="select_period" id="select_period"></td>
			</tr>
			<tr>
				<td><input type="date" id="start_date" name="start_date"
					min="${year}" +"-01-01" max="sysdate" name="date"
					contenteditable="false"> ~ <input type="date" id="end_date"
					name="end_date" min="2020-01-01" max="sysdate" name="date"
					contenteditable="false"> <input type="submit" value="조회">
					</a></td>
			</tr>
		</table>
		<input type="hidden" value=${account_num } name="account_num"
			id="account_num">
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
			<c:set var="account_num" value="${account_num }" />
			<c:forEach var="article" items="${article}">
				<!-- var=제네릭참조형  items=컬렉션 -->
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
</form>
<script>
	var start_year = "2020";// 시작할 년도 
	var today = new Date();
	var today_year = today.getFullYear();
	var index = 0;
	for (var y = start_year; y <= today_year; y++) { //start_year ~ 현재 년도 
		document.getElementById('select_year').options[index] = new Option(y, y);
		document.getElementById('select_year2').options[index] = new Option(y,
				y);
		index++;
	}
	index = 0;
	for (var m = 1; m <= 12; m++) {
		document.getElementById('select_month').options[index] = new Option(m,
				m);
		document.getElementById('select_month2').options[index] = new Option(m,
				m);
		index++;
	}

	lastday();
	function lastday() { //년과 월에 따라 마지막 일 구하기 
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = new Date(new Date(Year, Month, 1) - 86400000).getDate();
		var dayindex_len = document.getElementById('select_day').length;
		if (day > dayindex_len) {
			for (var i = (dayindex_len + 1); i <= day; i++) {
				document.getElementById('select_day').options[i - 1] = new Option(
						i, i);
			}
		} else if (day < dayindex_len) {
			for (var i = dayindex_len; i >= day; i--) {
				document.getElementById('select_day').options[i] = null;
			}
		}
	}

	lastday_select();
	function lastday_select() { //년과 월에 따라 마지막 일 구하기 
		var Year = document.getElementById('select_year2').value;
		var Month = document.getElementById('select_month2').value;
		var day = new Date(new Date(Year, Month, 1) - 86400000).getDate();
		var dayindex_len = document.getElementById('select_day2').length;
		if (day > dayindex_len) {
			for (var i = (dayindex_len + 1); i <= day; i++) {
				document.getElementById('select_day2').options[i - 1] = new Option(
						i, i);
			}
		} else if (day < dayindex_len) {
			for (var i = dayindex_len; i >= day; i--) {
				document.getElementById('select_day2').options[i] = null;
			}
		}
	}
</script>