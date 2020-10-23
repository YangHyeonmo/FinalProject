<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>적금 상품</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div class="w3-container">
				<!-- 적금 -->
		<h3>적금 상품</h3>
		<p>상품들을 한눈에</p>
		
		<c:forEach var="savings" items="${savings}">
			<button onclick="finance('savings${savings.fin_no}')"
				class="w3-btn w3-block w3-yellow w3-left-align">${savings.fin_name }[${savings.fin_date }]개월
				상품</button>
	
			<div id="savings${savings.fin_no}" class="w3-container w3-hide">
				${savings.fin_name }[${savings.fin_content }]<br> 
				금리 : ${savings.fin_rate} <br> 
				${savings.fin_date}개월 상품입니다.<br>
				<button type="button" class="btn btn-light btn-lg active"
									onclick="javascript:location.href='/BANK/finance/accedeProducts?fin_no=${savings.fin_no}'" style="float: right;">가입하기</button>
			</div>
		</c:forEach>

		<script>
			function finance(id) {
				var x = document.getElementById(id);
				if (x.className.indexOf("w3-show") == -1) {
					x.className += " w3-show";
				} else {
					x.className = x.className.replace(" w3-show", "");
				}
			};
		</script>
</body>
</html>