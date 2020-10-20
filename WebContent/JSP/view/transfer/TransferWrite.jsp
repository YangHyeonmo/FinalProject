<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src = "http://code.jquery.com/jquery-1.7.js"></script>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<title>MyPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<c:if test="${error==1}">
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
<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openTransfer('transfer')">이체</button>
  <button class="w3-bar-item w3-button" onclick="openTransfer('transferAuto')">자동 이체</button>
  <button class="w3-bar-item w3-button" onclick="openTransfer('transferRes')">예약 이체</button>
</div>
<div id="transfer" class="bank">
<form action="<%=request.getContextPath()%>/transfer/TransferAuth" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
	<input type="hidden" name="TransferNum" value="1"/>
				<thead>
					<tr>
						<th colspan = "5"><h4 align="center">이체</h4></th>
					</tr>
				</thead>
					<tr>
						<td colspan = "5">출금 계좌 번호</td>
					</tr>
					<tr>
						<td colspan = "5">	
							<select name="ACCOUNT_NO">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
						</td>						
					</tr>
					<tr align=center>
						<td colspan = "5">이체금액</td>					
					</tr>
					<tr>
						<td><input type="button" value="+100만" onclick="money(1000000)" style="border:0; outline:0;"></td>
						<td><input type="button" value="+50만" onclick="money(500000)" style="border:0; outline:0;"></td>
						<td><input type="button" value="+10만" onclick="money(100000)" style="border:0; outline:0;"></td>
						<td><input type="button" value="+1만" onclick="money(10000)" style="border:0; outline:0;"></td>
						<td><input type="button" value="+전액"  onclick="money()" style="border:0; outline:0;"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" value=0 name= "TRANSFER_PRICE" id="TRANSFER_PRICE" style="border:0; outline:0;">원</td>
					</tr>
					
					<tr>
						<td colspan = "5">받는 분 계좌 번호</td>
					</tr>
					<tr>
						<td colspan = "5"><input type="text" name="TRANSFER_TO_ACCOUNT_NO" 
						style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"></td>
					</tr>
					<tr>
						<td colspan = "5">받는 분 표시</td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" name="TRANSFER_ALIAS" 
						style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"></td>
					</tr>
				
					<tr>
						<td colspan="5"><input type="submit" value="확인" style="border:0; outline:0;"></td>
					</tr>
			</table>
	</form>
</div>
<div id="transferAuto" class="bank" style="display:none">
<form action="./TransferAuth" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
	<input type="hidden" name="TransferNum" value="2"/>
				<thead>
					<tr>
						<th colspan = "5"><h4>자동이체</h4></th>
					</tr>
				</thead>
					<tr>
						<td colspan = "5">출금 계좌 번호</td>
					</tr>
					<tr>
						<td>	
							<select name="ACCOUNT_NO">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
						</td>						
					</tr>
					<tr align=center>
						<td colspan="5">이체금액</td>					
					</tr>
					<tr>
						<td><input type="button" value="+100만" onclick="money(1000000)"></td>
						<td><input type="button" value="+50만" onclick="money(500000)"></td>
						<td><input type="button" value="+10만" onclick="money(100000)"></td>
						<td><input type="button" value="+1만" onclick="money(10000)"></td>
						<td><input type="button" value="+전액"  onclick="money()"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" value=0 name= "TRANSFER_PRICE" id="TRANSFER_PRICE" placeholder="숫자만 입력">원</td>
					</tr>
					
					<tr>
						<td colspan = "5">받는 분 계좌 번호</td>
					</tr>
					<tr>
						<td><input type="text" name="TRANSFER_TO_ACCOUNT_NO"></td>
					</tr>
					<tr>
						<td colspan = "5">받는 분 표시</td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" name="TRANSFER_ALIAS"></td>
					</tr>
					<tr>
						<td colspan="5">자동 이체 주기</td>
					</tr>
					<tr>
						<td>
							<select name="TRANSFER_AUTO_PERIOD">
								<option value=7>1주일</option>
								<option value=14>2주일</option>
								<option value=21>3주일</option>
								<option value=30>1달</option>
								<option value=90>3달</option>
								<option value=180>6달</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="5">자동 이체 시작 기간</td>
					</tr>
					<tr>
						<td>
							<select id="select_year" name="transfer_year" onchange="javascript:lastday();">
							</select>
						</td>
						<td>
							<select id="select_month" name="transfer_month" onchange="javascript:lastday();">
							</select>
						</td>
						<td>
							<select id="select_day" name="transfer_day">
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="5"><input type="submit" value="확인"></td>
					</tr>
			</table>
</form>
</div>
<div id="transferRes" class="bank" style="display:none">
<form action="./TransferAuth" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
	<input type="hidden" name="TransferNum" value="3"/>
				<thead>
					<tr>
						<th colspan = "5"><h4>예약 이체</h4></th>
					</tr>
				</thead>
					<tr>
						<td colspan = "5">출금 계좌 번호</td>
					</tr>
					<tr>
						<td>	
							<select name="ACCOUNT_NO">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
						</td>						
					</tr>
					<tr align=center>
						<td colspan="5">이체금액</td>					
					</tr>
					<tr>
						<td><input type="button" value="+100만" onclick="money(1000000)"></td>
						<td><input type="button" value="+50만" onclick="money(500000)"></td>
						<td><input type="button" value="+10만" onclick="money(100000)"></td>
						<td><input type="button" value="+1만" onclick="money(10000)"></td>
						<td><input type="button" value="+전액"  onclick="money()"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" value=0 name= "TRANSFER_PRICE" id="TRANSFER_PRICE" placeholder="숫자만 입력">원</td>
					</tr>
					
					<tr>
						<td colspan = "5">받는 분 계좌 번호</td>
					</tr>
					<tr>
						<td><input type="text" name="TRANSFER_TO_ACCOUNT_NO"></td>
					</tr>
					<tr>
						<td colspan = "5">받는 분 표시</td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" name="TRANSFER_ALIAS"></td>
					</tr>
					<tr>
						<td colspan="5">예약 이체 날짜</td>
					</tr>
					<tr>
						<td>
							<select id="select_year" name="transfer_year" onchange="javascript:lastday();">
							</select>
						</td>
						<td>
							<select id="select_month" name="transfer_month" onchange="javascript:lastday();">
							</select>
						</td>
						<td>
							<select id="select_day" name="transfer_day">
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="5"><input type="submit" value="확인"></td>
					</tr>
			</table>
</form>
</div>





</body>


<script>
      function money(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("TRANSFER_PRICE").value);
    	  document.getElementById("TRANSFER_PRICE").value=element+price;
      }
</script>
<script>
function openTransfer(bank) {
  var i;
  var x = document.getElementsByClassName("bank");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(bank).style.display = "block";
}
</script>
<script> 
var start_year="2020";// 시작할 년도 
var today = new Date(); 
var today_year= today.getFullYear(); 
var index=0; 
for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
	document.getElementById('select_year').options[index] = new Option(y, y); 
	index++; 
	} 
index=0; 
for(var m=1; m<=12; m++){ 
	document.getElementById('select_month').options[index] = new Option(m, m); 
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
</script>
</html>