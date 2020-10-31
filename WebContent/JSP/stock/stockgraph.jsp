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
		<td><h2>${stock } 주식 정보</h2></td>
	
	</tr>

	<tr>
		<td><img src="<%=request.getContextPath()%>/images/daily_chart.jpg"></td>
	</tr>
	
	<tr>
		<td><h2>${stock } 위험도 분석</h2></td>
	
	</tr>

	<tr>
		<td><img src="<%=request.getContextPath()%>/images/range_chart.jpg"></td>
	</tr>

	<tr>
		<td><h2>${stock } 누적 수익률</h2></td>
	
	</tr>

	<tr>
		<td><img  src="<%=request.getContextPath()%>/images/sum_chart.jpg"></td>
	</tr>
	
	<tr>
		<td><h2>${stock } 위험도 분석</h2></td>
	
	</tr>

	<tr>
		<td><img  src="<%=request.getContextPath()%>/images/risk_chart.jpg"></td>
	</tr>
</table>
	
</body>
</html>