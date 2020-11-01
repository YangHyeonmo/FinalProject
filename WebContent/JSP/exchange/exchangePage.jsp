<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b3>환전가능 통화</b3>
<table style = "border:1px solid grey">
<tr>
	<td>아시아</td>
	<td>일본 엔(JPY)</td>
	<td>중국 위안(CNH)</td>
	<td>유럽연합 유로(EUR)</td>
</tr>
<tr>
	<td>유럽</td>
	<td>태국 바트(THB)</td>
	<td>말레이시아 링기트</td>
	<td>싱가포르 달러(SGD)</td>
	<td>인도네시아 루피아(IDR)</td>
	<td>홍콩 달러(HKD)</td>
</tr>
<tr>
	<td>북미 / 기타통화</td>
	<td>미국 USD</td>
	<td>캐나다 달러(CAD)</td>
	<td>노르웨이 크로네(NOK)</td>
	<td>뉴질랜드 달러(NZD)</td>
	<td>덴마크 크로네(DKK)</td>
	<td>스위스 프랑(CHF)</td>
	<td>스웨덴 크로나(SEK)</td>
	<td>영국 파운드(GBP)</td>
	<td>호주 달러(AUD)</td>
	<td>아랍에미리트 디르함(IDR)</td>
	<td>바레인 디나르(BHD)</td>
	<td>브루나이 달러(BND)</td>
	<td>쿠웨이트 디나르(KWD)</td>
	<td>사우디아라비아 리알(SAR)</td>
</tr>
</table>
<a href="<%=request.getContextPath() %>/exchange/exchangeForm">환전하기</a>
<form action = "<%=request.getContextPath() %>/exchange/exchangeShow" method = "post">
<input type = "hidden" value = "sic" name = "member_id">
<input type = "submit" value = "환전내역조회">
</form>
${ttb}
</body>
</html>