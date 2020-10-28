<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
body .infoMessage{border: 1px solid rgba(0,0,0,0.3); color:rgba(0,0,0,0.3); margin: 0px 10px 50px; width: 800;}
body .bankInfo{border: 3px solid brown; margin: 0px 10px 50px; width: 800;}
body .bankInfo .w3-table-all tr td{float:left;}
body .bankInfo .w3-table-all tr td:nth-child(2){ position:absolute; margin-left:10rem;color:red;}
body .button{width:250px; margin-left:15rem; position:absolute; }
body h5{color:orange; font-size:10px; top:21rem;position:absolute;}
body h4{color:rgba(0,0,0,0.3); font-size:10px;}
body hr{border-top: 1px dotted grey ;}

</style>


</head>

<body>
	<div class="infoMessage">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="left">•보유중인 입출금통장 및 인터넷뱅킹으로 신규된 상품에 대해 통장사본을 출력하실 수
					있습니다. </br> •조회하신 계좌에 대한 통장사본입니다.</br> •통장사본은 본인계좌개설 확인용 이외의 어떤한 용도의 증명서로도
					사용하실 수 없습니다.
				</td>
			</tr>
		</table>
	</div>
	<input type="hidden" name="account_num" value=${account_num }>
	<c:forEach var="article" items="${article}">
	<div class="bankInfo">
		<table class="w3-table-all" >
			<h3>${member.name}님</h3>
			<tr>
				<td>예금종류</td>
				<td>${article.account_type}</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>${article.account_num}</td>
			</tr>
			<tr>
				<td>신규일 </td>
				<td>${article.made_date}</td>
			</tr>

		</table>
		<hr class="line">
		
		<h4>위와 같이 계좌가 개설되어 있음을 확인합니다. {$</h4>
		<h4>⁕스마트고객상담부(상담/폰뱅킹) 1599-9999, 1588-9999(국내) |
			82-1-1234-5678(해외)</h4>
	</div>
	</c:forEach>
	<h5>  ⁕통장사본은 본인계좌개설 확인용 이외의 어떠한 용도의 증명서로도 사용하실 수 없습니다.</h5>
<div class="button">
	
		<input type="button" value="인쇄" id="print" onclick="window.print()" />
		<input type="button" value="취소" id="cancle" onclick="window.close()" />
	
</div>
</body>
</html>