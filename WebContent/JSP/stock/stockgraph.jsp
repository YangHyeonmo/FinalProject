<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td><h1>${stock } 주식 정보 </h1></td>
	
	</tr>

	<tr>
		<td><img src="<%=request.getContextPath()%>/images/daily_chart.jpg"></td>
	</tr>
	
	
	<tr>
		<td><h2>${start_day } 가격 : ${first_day }원   ${end_day } 가격 : ${last_day }원 </h2></td>
	</tr>
	
	<tr>
		<td><h3>MACD : ${macd } signal : ${signal }</h3></td>
	</tr>
	<tr>
		<td>MACD : 이동평균선들간의 차이를 보기 쉽게 나타낸 지표</td>
	</tr>
	<tr>
		<td>MACD= 12일 이동평균선 - 26일 이동평균선 / MACD Signal : MACD의 9일 이동평균선</td>
	</tr>
	<tr>
		<td>MACD가 0선을 상향돌파하면 매수(상승국면)</td>
	</tr>
	<tr>
		<td>MACD가 Signal을 상향돌파 하면 골든 크로스 (매수 시점) / MACD가 Signal을 하향돌파 하면 데드크로스 (매도 시점)</td>
	</tr>
	<tr>
		<td><h2> RSI: ${rsi }  </h2></td>
	</tr>
	<tr>
		<td>RSI: 가격의 상승압력과 하락압력 간의 상대적인 강도로 70% 이상이면 초과매수, 30% 이하는 초과매도</td>
	</tr>
	<tr>
		<td><h1>${stock } 가격 상승 강도</h1></td>	
	</tr>

	<tr>
		<td><img src="<%=request.getContextPath()%>/images/range_chart.jpg"></td>
	</tr>
	<tr>
		<td><h2> 누적수익률 : ${cumRet }%   DPO: ${dpo } </h2></td>
	</tr>
	<tr>
		<td>DPO: 가격에 이동평균을 이용해 장기적인 가격 추세를 제거한 지표로  0선을 상향 돌파할 경우 강세(매수), 0선을 하향돌파할 경우 약세(매도)</td>
	</tr>
	<tr>
		<td><h1>${stock } 그룹별 거래량 수 </h1></td>
	
	</tr>

	<tr>
		<td><img  src="<%=request.getContextPath()%>/images/chart_rank.jpg"></td>
		<td>
			<table>
				<tr><td><h3>1. 손실 15%</h3></td></tr>
				<tr><td><h3>2. 손실 5%</h3></td></tr>
				<tr><td><h3>3. 손실 3%</h3></td></tr>
				<tr><td><h3>4. 수익 3%</h3></td></tr>
				<tr><td><h3>5. 수익 5%</h3></td></tr>
				<tr><td><h3>6. 수익 15%</h3></td></tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td><h1>${stock } 일일 & 누적 비교</h1></td>
	
	</tr>

	<tr>
		<td><img  src="<%=request.getContextPath()%>/images/risk_chart.jpg"></td>
	</tr>
	<tr>
		<td>위험ㄷ : ${mdd }</td>
	</tr>
</table>
	
</body>
</html>