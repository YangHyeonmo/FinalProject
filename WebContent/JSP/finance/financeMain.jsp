<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
blockquote {
  border: 1px solid #27a9e3;
  margin-left: 0px;
  margin-right: 0px;
  padding-left: 20px;
  padding-right: 20px;
  border-left: 10px solid #27a9e3;
}

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="w3-container">
		<c:if test="${dbno == 1}">
			<div style="height: auto; width: 100%; border:1px solid gold;">
			<h1>예금 TOP3 제품</h1>
			<p>
				<input type="hidden" name="dbno" value="1" />
				<c:forEach var="bestD" items="${best1}">
				TOP ${bestD.rnum} :
				${bestD.fin_name}<br>
				</c:forEach>
			</p>
			</div>
			<c:forEach var="depositP" items="${deposit}">
				<button onclick="finance('deposit${depositP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align">${depositP.fin_name }
					[${depositP.fin_date }]개월 상품</button>
				<div id="deposit${depositP.fin_no}" class="w3-container w3-hide">
					${depositP.fin_name }[${depositP.fin_content }]<br> 금리 :
					${depositP.fin_rate} <br> ${depositP.fin_date}개월 상품입니다.<br>
					<input type="submit" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${depositP.fin_no}'"
						style="float: right;">가입하기
					</button>
				</div>
			</c:forEach>

		</c:if>
		<c:if test="${dbno == 2}">
		<blockquote>
			<h1>적금 TOP3 제품</h1>
			<p>
				<input type="hidden" name="dbno" value="2" />
				<c:forEach var="bestS" items="${best2}">
				TOP ${bestS.rnum} :
				${bestS.fin_name}<br>
				</c:forEach>
			</p>
			</blockquote>
			<c:forEach var="savingP" items="${savings}">
				<button onclick="finance('savings${savingP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align">${savingP.fin_name }[${savingP.fin_date }]개월
					상품</button>

				<div id="savings${savingP.fin_no}" class="w3-container w3-hide">
					${savingP.fin_name }[${savingP.fin_content }]<br> 금리 :
					${savingP.fin_rate} <br> ${savingP.fin_amount }원 이상<br>
					${savingP.fin_date}개월 상품입니다.<br>
					<button type="button" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${savingP.fin_no}'"
						style="float: right;">가입하기</button>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${dbno == 3}">
			<h2>펀드 TOP3 제품</h2>
			<p>
				<c:forEach var="bestF" items="${best3}">
				TOP ${bestF.rnum} :
				${bestF.fin_name}<br>
				</c:forEach>
			</p>
			<c:forEach var="fundP" items="${fund}">
				<button onclick="finance('fund${fundP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align">${fundP.fin_name }
					상품</button>

				<div id="fund${fundP.fin_no}" class="w3-container w3-hide">
					${fundP.fin_name }[${fundP.fin_content }]<br> 수익률 :
					${fundP.fin_return}% (3개월 누적)<br> 펀드 유형 : ${fundP.fin_type}<br>
					<button type="button" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${fundP.fin_no}'"
						style="float: right;">가입하기</button>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${dbno == 4}">
			<h2>대출 TOP3 제품</h2>
			<p>
				<c:forEach var="bestL" items="${best4}">
					TOP ${bestL.rnum} :
				${bestL.fin_name}<br>
				</c:forEach>
			</p>
			<c:forEach var="loanP" items="${loan}">
				<button onclick="finance('loan${loanP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align">${loanP.fin_name }
					상품</button>
				<div id="loan${loanP.fin_no}" class="w3-container w3-hide">
					${loanP.fin_name }[${loanP.fin_content }]<br> 기간 :
					${loanP.fin_date } 개월 <br> 상환방법 : ${loanP.fin_repay } <br>
					이자 : ${loanP.fin_rate} %<br> 최대 ${loanP.fin_amount }원 까지<br>
					<button type="button" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${loanP.fin_no}'"
						style="float: right;">가입하기</button>
				</div>
			</c:forEach>
		</c:if>
	</div>
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