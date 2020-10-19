<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<c:if test="${account_num==null}">
	<script>
		alert("������ �������� �ʽ��ϴ�");
	</script>
</c:if>	
<c:if test="${error==2 }">
	<script>
		alert("�ݾ��� �����Ͽ� ��ü�� �Ұ��� �մϴ�");
	</script>
</c:if>
<c:if test="${error==3 }">
	<script>
		alert("��ü�ϰ��� �ϴ� ������ �������� �ʽ��ϴ�");
	</script>
</c:if>
<c:if test="${error==4 }">
	<script>
		alert("��� ���¿� ��ü�ϰ��� �ϴ� ���°� ��ġ�ϸ� �ȵ˴ϴ�");
	</script>
</c:if>
<c:if test="${error==5 }">
	<script>
		alert("���� ��¥���� �� �ʰ� �Է�");
	</script>
</c:if>
<c:if test="${error==6 }">
	<script>
		alert("��¥ ������ ��Ȯ�ϰ� �Է����ּ���");
	</script>
</c:if>
</head>
<body>
<form action="./TransferAuth" method="post" name="transferform">
	<table class = "table table-bordered table-hover" style = "text-align: center; border: 1px solid #dddddd">
	<input type="hidden" name="TransferNum" value="3"/>
				<thead>
					<tr>
						<th colspan = "5"><h4>���� ��ü</h4></th>
					</tr>
				</thead>
					<tr>
						<td colspan = "5">��� ���� ��ȣ</td>
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
						<td colspan="5">��ü�ݾ�</td>					
					</tr>
					<tr>
						<td><input type="button" value="+100��" onclick="money(1000000)"></td>
						<td><input type="button" value="+50��" onclick="money(500000)"></td>
						<td><input type="button" value="+10��" onclick="money(100000)"></td>
						<td><input type="button" value="+1��" onclick="money(10000)"></td>
						<td><input type="button" value="+����"  onclick="money()"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" value=0 name= "TRANSFER_PRICE" id="TRANSFER_PRICE" placeholder="���ڸ� �Է�">��</td>
					</tr>
					
					<tr>
						<td colspan = "5">�޴� �� ���� ��ȣ</td>
					</tr>
					<tr>
						<td><input type="text" name="TRANSFER_TO_ACCOUNT_NO"></td>
					</tr>
					<tr>
						<td colspan = "5">�޴� �� ǥ��</td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" name="TRANSFER_ALIAS"></td>
					</tr>
					<tr>
						<td colspan="5">���� ��ü ��¥</td>
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
						<td colspan="5"><input type="submit" value="Ȯ��"></td>
					</tr>
			</table>
</form>
</body>
<script>
      function money(price) {                           /* type �޴� ���ý� type�� �ش��ϴ� ���̺� ����ϴ� �Լ�   /  cityName => kind(type) */
          var element= parseInt(document.getElementById("TRANSFER_PRICE").value);
    	  document.getElementById("TRANSFER_PRICE").value=element+price;
      }
</script>

<script> 
var start_year="2020";// ������ �⵵ 
var today = new Date(); 
var today_year= today.getFullYear(); 
var index=0; 
for(var y=start_year; y<=today_year; y++){ //start_year ~ ���� �⵵ 
	document.getElementById('select_year').options[index] = new Option(y, y); 
	index++; 
	} 
index=0; 
for(var m=1; m<=12; m++){ 
	document.getElementById('select_month').options[index] = new Option(m, m); 
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
</script>

</html>