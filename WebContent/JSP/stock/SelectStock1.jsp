<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<form method="post" name="writeform"
	action="<%=request.getContextPath()%>/stock/SelectStock2"
>
	<table class="w3-table-all">
		<br />
		<h1>
			<b>(임시)주식조회</b>
		</h1>
		<br />
		<tr>
			<td width="150" align="left">종목 검색</td>
			<td width="500">
				<input type="text" size="50" maxlength="50" id="exname" name="exname">
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<br />
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	<div class="w3-container">
		<table class="w3-table-all">
			<td>종목코드</td>
			<td>종목명</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.excode}&emsp;&emsp;</td>
					<td>${list.exname}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
