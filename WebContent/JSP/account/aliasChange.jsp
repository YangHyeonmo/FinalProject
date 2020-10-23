<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" name="delForm"
		action="<%=request.getContextPath()%>/account/aliasUpdatePro">
		<input type="hidden" name="account_num" value=${account_num }>
		<c:set var="account_num" value="${account_num }" />
		<c:forEach var="article" items="${article}">
			<div>
				<table class="w3-table-all" align="center">
					<tr height="30">
						<td align="center" width="200">계좌명</td>
						<td align="center" width="200">${article.account_name}</td>
					</tr>
					<tr height="30">
						<td align="center" width="200">계좌번호</td>
						<td align="center" width="200">${article.account_num }</td>
					</tr>
				</table>
			</div>
			<div>
				<table class="w3-table-all" align="center">
					<tr height="30">
						<td align="center" width="150">계좌별명</td>
					</tr>
					<tr height="30">
						<td align=center><input type="text" size="8" maxlength="12" name="account_alias"
							placeholder="${article.account_alias }"></td>
					</tr>
				</table>
			</div>

			<tr height="30">
				<td align=center><input type="submit" value="저장"> <input
					type="button" value="취소"
					onclick="window.close('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
				</td>
			</tr>
		</c:forEach>
	</form>
</body>
</html>