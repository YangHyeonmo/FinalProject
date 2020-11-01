<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.bs-calltoaction {
	position: relative;
	width: auto;
	padding: 15px 25px;
	border: 1px solid black;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.bs-calltoaction>.row {
	display: table;
	width: calc(100% + 30px);
}

.bs-calltoaction>.row>[class^="col-"], .bs-calltoaction>.row>[class*=" col-"]
	{
	float: none;
	display: table-cell;
	vertical-align: middle;
}

.cta-contents {
	padding-top: 10px;
	padding-bottom: 10px;
}

.cta-title {
	margin: 0 auto 15px;
	padding: 0;
}

.cta-desc {
	padding: 0;
}

.cta-desc p:last-child {
	margin-bottom: 0;
}

.cta-button {
	padding-top: 10px;
	padding-bottom: 10px;
}

.button {
	padding-top: 10px;
	padding-bottom: 10px;
}

@media ( max-width : 991px) {
	.bs-calltoaction>.row {
		display: block;
		width: auto;
	}
	.bs-calltoaction>.row>[class^="col-"], .bs-calltoaction>.row>[class*=" col-"]
		{
		float: none;
		display: block;
		vertical-align: middle;
		position: relative;
	}
	.cta-contents {
		text-align: center;
	}
}

.bs-calltoaction.bs-calltoaction-default {
	color: #333;
	background-color: #fff;
	border-color: #ccc;
	margin-bottom: 50px;
	margin-top: 50px;
}

.bs-calltoaction.bs-calltoaction-primary {
	color: #333;
	background-color: #FFD700;
	border-color: #2e6da4;
	margin-bottom: 50px;
}

.bs-calltoaction.bs-calltoaction-info {
	color: #333;
	background-color: #FFD700;
	border-color: #46b8da;
	margin-bottom: 50px;
}

.bs-calltoaction.bs-calltoaction-success {
	color: #333;
	background-color: #FFD700;
	border-color: #4cae4c;
}

.bs-calltoaction.bs-calltoaction-primary .cta-button .btn,
	.bs-calltoaction.bs-calltoaction-info .cta-button .btn,
	.bs-calltoaction.bs-calltoaction-success .cta-button .btn {
	border-color: #fff;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('td.moreMenu').hide();
		$('td.col-md-3 button').click(function() {
			$('td.moreMenu').toggle();

		});
	});
</script>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('td.moreMenu').hide();
		$('div.button').click(function() {
			$('td.moreMenu').toggle();

		});
	});
</script>
<meta charset="UTF-8">
<title>계좌 조회</title>
</head>
<body>
	<div class="container">
		<div class="col-sm-12">
			<h3 style="font-size: 30px; display: inline-block;">나루뱅크 계좌조회</h3>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h3 style="font-size: 15px; display: inline-block;">
				<a
					href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking">
					다른은행 계좌조회></a>
			</h3>
			<div class="bs-calltoaction bs-calltoaction-default">
				<div class="row">
					<div class="col-md-9 cta-contents">
						<h5>
							조회기준일시:
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
												year + '.' + month + '.' + date
														+ ' ' + hours + ':'
														+ minutes + ':'
														+ seconds)
							</script>
						</h5>
						<h1 class="cta-title">${member_name }고객님</h1>
						<div class="cta-desc">
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
						</div>
					</div>
					<div class="col-md-3 cta-button">
						<p>총 잔액</p>
						<h2>~~원</h2>
					</div>

				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-primary">
				<div class="row">
					<c:if test="${count1 == 0 }">
						<table class="w3-table-all" align="center">
							<tr class="w3-grey">
								<td align="center" width="1000"><strong>입출금통장</strong> 만들 때
									<br />은행 방문 NO, 이젠 모바일로 손안에서 OK</br></td>
								<td width="100"><a
									href="<%=request.getContextPath()%>/finance/financeDepositList">
										개설하기</a></td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count1 != 0 }">
						<c:forEach var="article" items="${aaList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">입출금</h1>
								<p>(${count1 })계좌</p>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">이체</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
											별명 관리</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌개설확인서(통장사본)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌비밀번호변경</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌해지</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-info">
				<div class="row">
					<c:if test="${count2 == 0 }">
						<div class="cta-desc" align="center">
							<h3>조회 내역이 없습니다.</h3>
							</br>
							<h4>재테크 고수는 놓치지 않는 예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a
								href="<%=request.getContextPath()%>/finance/financeDepositList"
								class="btn btn-lg btn-block btn-default">가입하기</a>
						</div>
					</c:if>
					<c:if test="${count2 != 0 }">
						<c:forEach var="article" items="${bbList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">예금 (${count2 })계좌</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">이체</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
											별명 관리</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌개설확인서(통장사본)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌비밀번호변경</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌해지</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-success">
				<div class="row">
					<c:if test="${count3 == 0 }">
						<div class="cta-desc" align="center">
							<h3>조회 내역이 없습니다.</h3>
							</br>
							<h4>모을수록 쌓이는 이자! 나루뱅크에서 저축하세요.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a href="<%=request.getContextPath()%>/finance/financeSavingList"
								class="btn btn-lg btn-block btn-default">가입하기</a>
						</div>
					</c:if>
					<c:if test="${count3 != 0 }">
						<c:forEach var="article" items="${ccList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">적금 (${count3 })계좌</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
											별명 관리</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌개설확인서(통장사본)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌비밀번호변경</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											계좌해지</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>