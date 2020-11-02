<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<title>MyPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<c:if test="${account_num==null}">
	<script>
		alert("통장이 존재하지 않습니다");
	</script>
</c:if>	
<c:if test="${error==2 }">
	<script>
		alert("금액이 부족하여 이체가 불가능 합니다");
	</script>
</c:if>
<c:if test="${error==3 }">
	<script>
		alert("이체하고자 하는 통장이 존재하지 않습니다");
	</script>
</c:if>
<c:if test="${error==4 }">
	<script>
		alert("출금 계좌와 이체하고자 하는 계좌가 일치하면 안됩니다");
	</script>
</c:if>
<c:if test="${error==5 }">
	<script>
		alert("현재 날짜보다 더 늦게 입력");
	</script>
</c:if>
<c:if test="${error==6 }">
	<script>
		alert("날짜 형식을 정확하게 입력해주세요");
	</script>
</c:if>
</head>
<body>
<div id="transferRes" class="bank" >
<form action="./TransferSelectList" method="post" name="transferform">
<h4 align="center" style="font-weight:bold;">기간 설정</h4>
<div class="container">
  <div class="col">
    <label>조회 계좌 번호</label>
    <select class="chooseAccount2" name="account_no" id="account_no" onchange="change()">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
 
    <br/>
    <label>조회</label>
   	<input class="chooseMoney" type="button" value="일주일" onclick="money(7)">
	<input class="chooseMoney" type="button" value="1개월" onclick="money(30)">
	<input class="chooseMoney" type="button" value="3개월" onclick="money(90)">
	<input class="chooseMoney" type="button" value="6개월" onclick="money(180)">
	<input class="chooseMoney" type="button" value="1년"  onclick="money(365)">

  <input type="date" id="select_period" name="select_period" min="2020-08-01" max="2020-12-31"  contenteditable="false">
   
   <div class="page_find">
  <button type="submit">조회하기</button>
</div>
</div>
</div>

</form>
</div>
</body>
<script>
      function money(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("select_period").value);
    	  document.getElementById("select_period").value=element+price;
      }
</script>

<script> 
var start_year="2020";// 시작할 년도 
var today = new Date(); 
var today_year= today.getFullYear(); 
var index=0; 
for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
	document.getElementById('select_year').options[index] = new Option(y, y); 
	document.getElementById('select_year2').options[index] = new Option(y, y); 
	index++; 
	} 
index=0; 
for(var m=1; m<=12; m++){ 
	document.getElementById('select_month').options[index] = new Option(m, m); 
	document.getElementById('select_month2').options[index] = new Option(m, m); 
	index++; 
	} 
	
lastday(); 
function lastday(){ //년과 월에 따라 마지막 일 구하기 
	var Year=document.getElementById('select_year').value; 
	var Month=document.getElementById('select_month').value; 
	var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
	var dayindex_len=document.getElementById('select_day').length; 
	if(day>dayindex_len){ 
		for(var i=(dayindex_len+1); i<=day; i++){ 
			document.getElementById('select_day').options[i-1] = new Option(i, i); 
			} 
	} else if(day<dayindex_len){ 
		for(var i=dayindex_len; i>=day; i--){ 
			document.getElementById('select_day').options[i]=null;
			} 
		} 
	} 
	
lastday_select();
function lastday_select(){ //년과 월에 따라 마지막 일 구하기 
	var Year=document.getElementById('select_year2').value; 
	var Month=document.getElementById('select_month2').value; 
	var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
	var dayindex_len=document.getElementById('select_day2').length; 
	if(day>dayindex_len){ 
		for(var i=(dayindex_len+1); i<=day; i++){ 
			document.getElementById('select_day2').options[i-1] = new Option(i, i); 
			} 
	} else if(day<dayindex_len){ 
		for(var i=dayindex_len; i>=day; i--){ 
			document.getElementById('select_day2').options[i]=null;
			} 
		} 
	} 
</script>


</html>