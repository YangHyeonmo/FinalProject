<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
td.moreMenu {
	font-weight: bold;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('td.moreMenu').hide();
		$('td.button').click(function() {
			$('td.moreMenu').toggle();

		});
	});
</script>

<h3 style="font-size: 20px; display: inline-block;">�����ũ ������ȸ</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
	<a href="<%=request.getContextPath()%>����"> �ٸ����� ������ȸ</a>
</h3>
<h5>
	��ȸ�����Ͻ�:
	<script type="text/javascript">
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth();
		let date = today.getDate();
		let hours = today.getHours();
		let minutes = today.getMinutes();
		let seconds = today.getSeconds();
		document
				.write(
						year + '.' + month + '.' + date + ' ' + hours + ':'
								+ minutes + ':' + seconds)
	</script>
</h5>

<h4>�����</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<table class="w3-table-all" align="center">
		<tr class="w3-grey">
			<td align="center">����� (${count1 })����</td>
		</tr>
	</table>
	<c:if test="${count1 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000"><strong>���������</strong> ���� �� <br />����
					�湮 NO, ���� ����Ϸ� �վȿ��� OK</br></td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/���°����ϱ�"> �����ϱ�</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count1 != 0 }">
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${aaList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">�ܾ� ${article.balance }��</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							��ȸ</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/��ü�ϱ�"> ��ü</a></td>
					<td class="button" width="100">���°���</td>
					<td class="moreMenu"><a href="URL"
						onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">����
							���� ����</a></td>
					<td class="moreMenu"><a href="URL"
						onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
							���°���Ȯ�μ�(����纻)</a></td>
					<td class="moreMenu">���º�й�ȣ����</td>
					<td class="moreMenu">���»���</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<h4>����</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<c:if test="${count2 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000">��ȸ ������ �����ϴ�. </br> ����ũ ����� ��ġ�� �ʴ�
					��������, �� �Ѵ��̶� �����ڱ��� ���ݿ� �ðܵμ���.
				</td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/���ݰ����ϱ�"> �����ϱ�</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count2 != 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center">���� (${count2 })����</td>
			</tr>
		</table>
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${bbList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">�ܾ� ${article.balance }��</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							��ȸ</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/��ü�ϱ�"> ��ü</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/���°���"> ���°���</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<h4>����</h4>
<div
	style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
	<c:if test="${count3 == 0 }">
		<table class="w3-table-all" align="center">
			<tr class="w3-grey">
				<td align="center" width="1000">��ȸ ������ �����ϴ�. </br> ����ũ ����� ��ġ�� �ʴ�
					��������, �� �Ѵ��̶� �����ڱ��� ���ݿ� �ðܵμ���.
				</td>
				<td width="100"><a
					href="<%=request.getContextPath()%>/account/���ݰ����ϱ�"> �����ϱ�</a></td>
			</tr>
		</table>
	</c:if>
	<table class="w3-table-all" align="center">
		<tr class="w3-grey">
			<td align="center">���� (${count3 })����</td>
		</tr>
	</table>
	<c:if test="${count3 != 0 }">
		<table class="w3-table-all" align="center">
			<c:set var="member_id" value="${member_id }" />
			<c:forEach var="article" items="${ccList}">
				<tr height="30">
					<td align="center" width="200">${article.account_name}</td>
					<td align="center" width="200">${article.account_num }</td>
					<td align="center" width="150">${article.account_alias }</td>
					<td align="center" width="150">�ܾ� ${article.balance }��</td>
					<td width="100"><a
						href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
							��ȸ</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/��ü�ϱ�"> ����</a></td>
					<td width="100"><a
						href="<%=request.getContextPath()%>/account/���°���"> ���°���</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>