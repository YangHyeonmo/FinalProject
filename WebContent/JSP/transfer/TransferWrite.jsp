<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<form action="./TransferAuth" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
	<input type="hidden" name="TransferNum" value="1"/>
				<thead>
					<tr>
						<th colspan = "5"><h4>이체</h4></th>
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
						<td colspan="5"><input type="submit" value="확인"></td>
					</tr>
			</table>
</form>
</body>

<script>
      function money(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("TRANSFER_PRICE").value);
    	  document.getElementById("TRANSFER_PRICE").value=element+price;
      }
   </script>
</html>