<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./TransferSelectList" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan = "5"><h4>�Ⱓ ����</h4></th>
					</tr>
				</thead>
					<tr>
						<td colspan = "5">��� ���� ��ȣ</td>
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
						<td colspan="5">��ü�ݾ�</td>					
					</tr>
					<tr>
						<td><input type="button" value="������" onclick="money(7)"></td>
						<td><input type="button" value="1����" onclick="money(30)"></td>
						<td><input type="button" value="3����" onclick="money(90)"></td>
						<td><input type="button" value="6����" onclick="money(180)"></td>
						<td><input type="button" value="1��"  onclick="money(365)"></td>
					</tr>
				
					<tr>
						<td colspan="5"><input type="hidden" value=0 name= "select_period" id="select_period"></td>
					</tr>
					<tr align=center>
						<td colspan="5">���� �Է�(���� ��¥)</td>					
					</tr>
					<tr>
						<td colspan = "2">
							<select id="select_year" name="transfer_year" onchange="javascript:lastday();">
							</select>
						</td>
						<td colspan = "2">
							<select id="select_month" name="transfer_month" onchange="javascript:lastday();">
							</select>
						</td>
						<td colspan = "1">
							<select id="select_day" name="transfer_day">
							</select>
						</td>
					</tr>
					<tr align=center>
						<td colspan="5">���� �Է�(���� ��¥)</td>					
					</tr>
					<tr>
						<td colspan = "2">
							<select id="select_year2" name="transfer_year2" onchange="javascript:lastday_select();">
							</select>
						</td>
						<td colspan = "2">
							<select id="select_month2" name="transfer_month2" onchange="javascript:lastday_select();">
							</select>
						</td>
						<td colspan = "1">
							<select id="select_day2" name="transfer_day2">
							</select>
						</td>
					</tr>
			
				
					<tr>
						<td colspan="5"><input type="submit" value="Ȯ��"></td>
					</tr>
			</table>
</form>

<table>
<tr>
	<td>���� �ð�</td>
	<td>���� ���</td>
	<td>���� �ݾ�</td>
</tr>
<tr>

</tr>
<c:forEach var= "transList" items="${transList}">
	<tr>
		<td>${transList.transfer_day}</td>
		<td>${transList.transfer_to_member_id}</td>
		<td>${transList.transfer_price}</td>
	</tr>
</c:forEach>
</table>
</body>
<script>
      function money(price) {                           /* type �޴� ���ý� type�� �ش��ϴ� ���̺� ����ϴ� �Լ�   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("select_period").value);
    	  document.getElementById("select_period").value=element+price;
      }
</script>
<script> 
var start_year="2020";// ������ �⵵ 
var today = new Date(); 
var today_year= today.getFullYear(); 
var index=0; 
for(var y=start_year; y<=today_year; y++){ //start_year ~ ���� �⵵ 
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
function lastday(){ //��� ���� ���� ������ �� ���ϱ� 
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
function lastday_select(){ //��� ���� ���� ������ �� ���ϱ� 
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

</body>
</html>