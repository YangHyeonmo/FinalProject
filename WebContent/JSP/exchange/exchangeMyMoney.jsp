<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Exchange</title>
<meta name="viewport" content="width=device-width, initial-scale=1, charset=UTF-8">
<style>
.customerChange{position:absolute; top:37%; left:45%;}


</style>



</head>


<div class="exchangeRealMoney">
	<div class="header">
		<div class="thumb-wrapper">
		
		
		<c:if test="${cur_unit == 'USD'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/America.png">
			</c:if>
				<c:if test="${cur_unit == 'EUR'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/EU.png">
			</c:if>
			
				<c:if test="${cur_unit == 'JPY'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/Japan.png">
			</c:if>
			
				<c:if test="${cur_unit == 'CNH'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/China.png">
			</c:if>
			
			
				<c:if test="${cur_unit == 'HKD'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/HongKong.png">
			</c:if>
			
				<c:if test="${cur_unit == 'THB'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/Thailand.png">
			</c:if>
			
				<c:if test="${cur_unit == 'SGD'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/Singapore.png">
			</c:if>
			
				<c:if test="${cur_unit == 'GBP'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/England.png">
			</c:if>
			
				<c:if test="${cur_unit == 'CAD'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/Canada.png">
			</c:if>
			
				<c:if test="${cur_unit == 'CHF'}">
			<img class="thumb" src="<%=request.getContextPath()%>/images/Swiss.png">
			</c:if>			
		</div>
		
		
		<div class="text-area">
			<h2 class="greeting">NaruBank를 통해 환전하세요!</h2>
		</div>
<form action="<%=request.getContextPath()%>/exchange/saveMyExchangeMoney" method="Post">		
		<span>아이디</span>&nbsp; <input type="text" class="mail" name = "member_id" value="${member_id}"><br/>
		<span>KRW</span>&nbsp; <input type="text" class="mail" id="kor_money" name = "kor_money" onkeyup="moneyExchange(this.value)"/><br/>
		 ↓<br/> 
		 <span class="money">${cur_unit}</span> <span class="changedMoney" id="changedMoneyCurrency"><font color="red">환전할 돈을 입력하세요</font></span><br/>
		<span>이름</span>&nbsp; <input type="text" class="mail" name="exc_name" placeholder="환전하는 고객의 이름" value="${member.member_name}"><br/>
		<input class="changePlease"type="submit" value="환전하기">  
</form>
		
		</div>
		

	</div>


<div class="customerChange">

</form>


<script type="text/javascript">
function sendRequest(url, params, callback, method) {
//	alert("ajax 실행);
	httpRequest = new XMLHttpRequest();
	let httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	let httpParams = (params == null || params == '') ? null : params;
	let httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}

function moneyExchange(kor_money) {
	console.log("moneyExchange:" + kor_money);
	let url = "exchangeMoney?cur_unit=${cur_unit}&kor_money=" + kor_money;
		sendRequest(url, "", getMyMoney, "GET");
}

function getMyMoney() {
	console.log(httpRequest.readyState + ":" + httpRequest.status);
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("back:" + httpRequest.responseText);
				document.getElementById("changedMoneyCurrency").innerHTML = httpRequest.responseText;
			
		}
	}
}






</script>
</html>