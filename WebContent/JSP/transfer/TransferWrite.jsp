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
<script>
var balance=new Array();
<c:forEach items="${balance}" var="item">
	balance.push("${item}");
</c:forEach>
document.getElementById('balance').value=balance[0];

function change(){
	var account=new Array();
	<c:forEach items="${account_num}" var="item">
		account.push("${item}");
	</c:forEach>

	var balance=new Array();
	<c:forEach items="${balance}" var="item">
		balance.push("${item}");
	</c:forEach>
	
	var num=document.getElementById('account_no');	
	for(var i=0;i<account.length;i++){
		if(num.value==account[i]){
			document.getElementById('balance').value=balance[i];
		}
	}
	
	document.getElementById('account_number').value=document.getElementById('account_no').value;
}
</script>
<div class="transferButt">
  <button  onclick="openTransfer('transfer')">이체</button>
  <button  onclick="openTransfer('transferAuto')">자동 이체</button>
  <button  onclick="openTransfer('transferRes')">예약 이체</button>
</div>
<div id="transfer" class="bank">
<div class="container">
  <div class="col1">
    <div class="card">
      <div class="front">
        <div class="type">
          <img class="bankid"/>
        </div>
        <span class="chip"></span>
        <span class="narubank">N A R U B A N K</span>
        <span class="card_number">&#x25CF;&#x25CF;&#x25CF;&#x25CF; &#x25CF;&#x25CF; &#x25CF;&#x25CF;&#x25CF;&#x25CF; </span>
        <div class="date"><span class="date_value">MM / YYYY</span></div>
        <span class="fullname">FULL NAME</span>
      </div>
      <div class="back">
        <div class="magnetic"></div>
        <div class="bar"></div>
        <span class="seccode">&#x25CF;&#x25CF;&#x25CF;</span>
      </div>
    </div>
  </div>
  <div class="col2">
  <form action="<%=request.getContextPath()%>/transfer/TransferAuth" method="post" name="transferform">
  	<input type="hidden" name="num" value="1"/>
    <label>출금 계좌 번호</label>
    <select class="chooseAccount" name="account_no" id="account_no" onchange="change()">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
    <input class="number" id="account_number" type="text" placeholder="이체할 계좌번호를 입력해주세요" ng-model="ncard" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> 
    <label>잔액</label>
    <input type="text" name= "balance" value="${balance[0]}" id="balance">
    <label>이체금액</label>
   	<input type="button" class="chooseMoney" value="+100만" onclick="money(1000000)" >
	<input type="button" class="chooseMoney" value="+50만" onclick="money(500000)" >
	<input type="button" class="chooseMoney" value="+10만" onclick="money(100000)">
	<input type="button" class="chooseMoney" value="+1만" onclick="money(10000)" >
	<input type="button" class="chooseMoney" value="+전액"  onclick="money(${balance[0]})">
	<input type="text" value=0 name="transfer_price" id="transfer_price" placeholder="이체하실 금액을 입력하세요">
    <label>보내실 분 성함</label>
    <input class="inputname" type="text" placeholder="이름을 입력해주세요"/>
    <label>받는 분 계좌 번호</label>
  	<input type="text" name="transfer_to_account_no" >
    <label>받는 분 표시</label>
    <input type="text" name="transfer_alias" >
    <label>Today's Date</label>
    <input class="expire" type="text" placeholder="오늘 날짜를 입력해주세요"/>
    <label>보안 번호</label>
    <input class="ccv" type="text" placeholder="메크로 방지 번호 111 입력" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
   
   <div class="page">
  <button type="submit" class="fun-btn">이체하기</button>
</div>
    
    </form>
  </div>
</div>
</div>


<div id="transferAuto" class="bank" style="display:none">

<form action="<%=request.getContextPath()%>/transfer/TransferAuth" method="post" name="transferform">
	<input type="hidden" name="num" value="2"/>

<div class="container">

  <div class="col">
    <label>출금 계좌 번호</label>
    <select class="chooseAccount2" name="account_no" id="account_no" onchange="change()">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
    <input class="number" type="text" placeholder="이체할 계좌번호를 입력해주세요" ng-model="ncard" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> 
    
    <label>이체금액</label>
   	<input type="button" class="chooseMoney" value="+100만" onclick="money2(1000000)" >
	<input type="button" class="chooseMoney" value="+50만" onclick="money2(500000)" >
	<input type="button" class="chooseMoney" value="+10만" onclick="money2(100000)">
	<input type="button" class="chooseMoney" value="+1만" onclick="money2(10000)" >
	<input type="button" class="chooseMoney" value="+전액"  onclick="money2()">
	<input type="text" value=0 name="transfer_price" id="transfer_price2" placeholder="이체하실 금액을 입력하세요">

    <label>받는 분 계좌 번호</label>
  	<input type="text" name="transfer_to_account_no" >
    <label>받는 분 표시</label>
    <input type="text" name="transfer_to_aias" >
    <label>자동 이체 주기</label>
    <br/>
    <select name="transfer_auto_period" class="period">
								<option value=7>1주일</option>
								<option value=14>2주일</option>
								<option value=21>3주일</option>
								<option value=30>1개월</option>
								<option value=90>3개월</option>
								<option value=180>6개월</option>
							</select>
							<br/>
	<label>자동 이체 시작 기간</label>
	<br/>
	
	<select class="choosePeriod" id="select_year" name="transfer_year" onchange="javascript:lastday();"></select>
	<select class="choosePeriod" id="select_month" name="transfer_month" onchange="javascript:lastday();"></select>
	<select class="choosePeriod" id="select_day" name="transfer_day"></select>
	
	
   
   <div class="page">
  <button type="submit">예약하기</button>
</div>
</div>
</div>

    
    </form>
  </div>


	
<div id="transferRes" class="bank" style="display:none">
<form action="<%=request.getContextPath()%>/transfer/TransferAuth" method="post" name="transferform">
	
	<input type="hidden" name="num" value="3"/>
<div class="container">

  <div class="col">
    <label>출금 계좌 번호</label>
    <select class="chooseAccount2" name="account_no" id="account_no" onchange="change()">
								<c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
									<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
								</c:forEach>
							</select>
    <input class="number" type="text" placeholder="이체할 계좌번호를 입력해주세요" ng-model="ncard" maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> 
    
    <label>이체금액</label>
   	<input type="button" class="chooseMoney" value="+100만" onclick="money3(1000000)" >
	<input type="button" class="chooseMoney" value="+50만" onclick="money3(500000)" >
	<input type="button" class="chooseMoney" value="+10만" onclick="money3(100000)">
	<input type="button" class="chooseMoney" value="+1만" onclick="money3(10000)" >
	<input type="button" class="chooseMoney" value="+전액"  onclick="money3()">
	<input type="text" value=0 name="transfer_price3" id="transfer_price3" placeholder="이체하실 금액을 입력하세요">

    <label>받는 분 계좌 번호</label>
  	<input type="text" name="transfer_to_account_no" >
    <label>받는 분 표시</label>
    <input type="text" name="transfer_to_aias" >
    <br/>
   
	<label>예약 이체 날짜</label>
	<br/>
	
	<select class="choosePeriod" id="select_year2" name="transfer_year" onchange="javascript:lastday2();"></select>
	<select class="choosePeriod" id="select_month2" name="transfer_month" onchange="javascript:lastday2();"></select>
	<select class="choosePeriod" id="select_day2" name="transfer_day"></select>
	
	
   
   <div class="page">
  <button type="submit">예약하기</button>
</div>
</div>
</div>
				
		
			
</form>
</div>




<script src="<%=request.getContextPath()%>/js/common.js"></script>
</body>



</html>