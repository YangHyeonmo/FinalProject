<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap"
	rel="stylesheet">
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
<div id="transferAuto" class="bank">










</body>

<script>
      function money(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("TRANSFER_PRICE").value);
    	  document.getElementById("TRANSFER_PRICE").value=element+price;
      }
   </script>
</html>