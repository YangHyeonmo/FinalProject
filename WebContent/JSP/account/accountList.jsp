<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="account_font">나루뱅크 계좌조회</h3>
<h3 class="account_font2">
	<a href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking">
		다른은행 계좌조회</a>
</h3>
<h5 class="account_date">
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
						year + '.' + month + '.' + date + ' ' + hours + ':'
								+ minutes + ':' + seconds)
	</script>
</h5>
<h1 class="cta-title">${member.member_name }고객님</h1>
<h4 class="account_title">입출금</h4>

<div class="account_list_table">
	<table class="account_list_table_form" align="center">
		<tr class="account_list_table_tr">
			<td class="account_list_table_td" align="center">입출금 (${count1 })계좌</td>
		</tr>
	</table>
	
	<c:if test="${count1 == 0 }">
		<div class="noAccountMessage">
			<span>입출금통장 만들 때 은행 방문 NO, 이젠 모바일로 손안에서 OK <a class="accountLink" href="<%=request.getContextPath()%>/finance/financeMain?dbno=5"> 개설하기</a></span>
			
		</div>
	</c:if>

	<div class="accountList_a">
		<c:if test="${count1 != 0 }">
			<div class="table">
				<c:forEach var="article" items="${aaList}">
					<div class="row">
						<div class="cell">${article.account_name}</div>
						<div class="cell">${article.account_num }</div>
						<div class="cell">${article.account_alias }</div>
						<div class="cell">잔액 ${article.balance }원</div>
						<div class="cell">
							<a
								href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">조회</a>
						</div>
						<div class="cell">
							<a href="<%=request.getContextPath()%>/transfer/TransferWrite">
								이체</a>
						</div>
						<button class="button">계좌관리</button>
						<div class="cell2">
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
									별명 관리</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=850px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌개설확인서(통장사본)</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=650px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌비밀번호변경</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=1030px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌해지</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>

<h4 class="account_title">예금</h4>
<div class="account_list_table">

	<c:if test="${count2 == 0 }">
			<div class="noAccountMessage">
			<span>조회 내역이 없습니다. <br/> 재테크 고수는 놓치지 않는
					예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.<a class="accountLink" href="<%=request.getContextPath()%>/finance/financeMain?dbno=1"> 가입하기</a></span>
			
		</div>
	</c:if>
	<c:if test="${count2 != 0 }">

		<table class="account_list_table_form" align="center">
			<tr class="account_list_table_tr">
				<td class="account_list_table_td" align="center">예금 (${count2 })계좌</td>
			</tr>
		</table>


		<div class="accountList_a">
			<div class="table">
				<c:forEach var="article" items="${bbList}">
					<div class="row">
						<div class="cell">${article.account_name}</div>
						<div class="cell">${article.account_num }</div>
						<div class="cell">${article.account_alias }</div>
						<div class="cell">잔액 ${article.balance }원</div>
						<div class="cell">
							<a
								href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">조회</a>
						</div>
						<div class="cell">
							<a href="<%=request.getContextPath()%>/transfer/TransferWrite">
								이체</a>
						</div>
						<button class="button">계좌관리</button>
						<div class="cell2">
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
									별명 관리</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=850px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌개설확인서(통장사본)</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌비밀번호변경</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=1030px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌해지</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</c:if>
</div>

<h4 class="account_title">적금</h4>

<div class="account_list_table">
	<table class="account_list_table_form" align="center">
		<tr class="account_list_table_tr">
			<td class="account_list_table_td" align="center">적금 (${count3 })계좌</td>
		</tr>
	</table>




	<c:if test="${count3 == 0 }">
	<div class="noAccountMessage">
			<span>조회 내역이 없습니다. <br/>알뜰살뜰하게 나루뱅크에서 모아보아요<a class="accountLink" href="<%=request.getContextPath()%>/account/dbno=2"> 가입하기</a>
			</span>
					</div>
	</c:if>

	<div class="accountList_a">
		<c:if test="${count3 != 0 }">
			<div class="table">
				<c:forEach var="article" items="${ccList}">
					<div class="row">
						<div class="cell">${article.account_name}</div>
						<div class="cell">${article.account_num }</div>
						<div class="cell">${article.account_alias }</div>
						<div class="cell">잔액 ${article.balance }원</div>
						<div class="cell">
							<a
								href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">조회</a>
						</div>
						<div class="cell">
							<a href="<%=request.getContextPath()%>/transfer/TransferWrite">
								이체</a>
						</div>
						<button class="button">계좌관리</button>
						<div class="cell2">
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
									별명 관리</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=850px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌개설확인서(통장사본)</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌비밀번호변경</a>
							</div>
							<div class="moreMenu">
								<a href="URL"
									onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=1030px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
									계좌해지</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>


<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('.moreMenu').hide();
		$('.button').click(function() {
			$('.moreMenu').toggle();

		});
	});
</script>


