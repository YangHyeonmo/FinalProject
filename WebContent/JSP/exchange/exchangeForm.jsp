<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환전 / 환율</title>
</head>
<div class="showExchange">

		<h2>Today's Info </h2>&emsp;&emsp;&emsp;&emsp;
		<p>
		<script type="text/javascript">
			let today = new Date();
			let year = today.getFullYear();
			let month = today.getMonth() + 1;
			let date = today.getDate() - 1;
			document.write(year + '.' + month + '.' + date)
		</script>(기준)</p>

	<table class="rate_table">
		<tr>
			<td></td>
			<td style="font-size:15px;">보내실때</td>
			<td style="font-size:15px;">받으실때</td>
		</tr>
		<tr>
			<td><img
				src="<%=request.getContextPath()%>/images/icn_usd.png"></td>
			<td>${sell.get("USD")}</td>
			<td>${buy.get("USD")}</td>
		</tr>
		<tr>
			<td><img
				src="<%=request.getContextPath()%>/images/icn_jpy.png"></td>
			<td>${sell.get("JPY")}</td>
			<td>${buy.get("JPY")}</td>
		</tr>
		<tr>
			<td><img
				src="<%=request.getContextPath()%>/images/icn_eur.png"></td>
			<td>${sell.get("EUR")}</td>
			<td>${buy.get("EUR")}</td>
		</tr>
	</table>

 </div>
 
 
<div class="exchangeform">
		<button class="exchangeButton1" id="cur_unit" onclick="sendCountry(this.value);" value="USD"><span><img src="<%=request.getContextPath()%>/images/America.png"></span></button>
		<button class="exchangeButton2" id="cur_unit" onclick="sendCountry(this.value);" value="EUR"><span><img src="<%=request.getContextPath()%>/images/EU.png"></span></button>
		<button class="exchangeButton3" id="cur_unit" onclick="sendCountry(this.value);" value="JPY"><span><img src="<%=request.getContextPath()%>/images/Japan.png"></span></button>
		<button class="exchangeButton4" id="cur_unit" onclick="sendCountry(this.value);" value="CNH"><span><img src="<%=request.getContextPath()%>/images/China.png"></span></button>
		<button class="exchangeButton5" id="cur_unit" onclick="sendCountry(this.value);" value="HKD"><span><img src="<%=request.getContextPath()%>/images/HongKong.png"></span></button>
		<button class="exchangeButton6" id="cur_unit" onclick="sendCountry(this.value);" value="THB"><span><img src="<%=request.getContextPath()%>/images/Thailand.png"></span></button>
		<button class="exchangeButton7" id="cur_unit" onclick="sendCountry(this.value);" value="SGD"><span><img src="<%=request.getContextPath()%>/images/Singapore.png"></span></button>
		<button class="exchangeButton8" id="cur_unit" onclick="sendCountry(this.value);" value="GBP"><span><img src="<%=request.getContextPath()%>/images/England.png"></span></button>
		<button class="exchangeButton9" id="cur_unit" onclick="sendCountry(this.value);" value="CAD"><span><img src="<%=request.getContextPath()%>/images/Canada.png"></span></button>
		<button class="exchangeButton10" id="cur_unit" onclick="sendCountry(this.value);" value="CHF"><span><img src="<%=request.getContextPath()%>/images/Swiss.png"></span></button>
		
</div>
<script>

function sendCountry(cur_unit) { 
	location.href="exchangeMyMoney?cur_unit="+cur_unit; 
	
	}


</script>

</html>