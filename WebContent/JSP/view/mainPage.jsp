<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<html>
<head>
</head>
<c:if test="${finish==1}">
	<script>
		alert("이체가 완료되었습니다");
	</script>
</c:if>
<c:if test="${msg==1}">
	<script>
		alert("시작 날짜를 정확하게 입력해주세요");
	</script>
</c:if>
<c:if test="${msg==2 }">
	<script>
		alert("완료 날짜를 정확하게 입력해주세요");
	</script>
</c:if>
<c:if test="${msg==3 }">
	<script>
		alert("현재 날짜보다 일찍 입력");
	</script>
</c:if>

<div class="main-body">
	<img class="mainPageImg"
		src="<%=request.getContextPath()%>/images/pointerLogo.png">
	<div class="phoneScreen">
		<c:if test="${login ne 1}">
			<span class="memberId">홍길동</span>
		</c:if>
		<c:if test="${login eq 1}">
			<span class="memberId">${member.member_name}</span>
		</c:if>
		<div class="insideScreen">
			<span class="my">내 계좌</span> <select name="member_gender"
				id="account_no" class="myAccount" onchange="change()">
				<option value="조회" selected>계좌조회
					<c:forEach var="ACCOUNT_NO" items="${account_num }"
						varStatus="status">
						<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
					</c:forEach>
			</select>
			<c:if test="${login ne 1 }">
				<input class="money" maxlength="11" placeholder="로그인하세요" readonly>
			</c:if>
			<c:if test="${login eq 1 && num ne 1 }">
				<input class="money" maxlength="11" value="${message}">
			</c:if>
			<c:if test="${login eq 1 && num eq 1 }">
				<input class="money" maxlength="11" name="balance" value="${balance[0]}"
					placeholder="로그인하세요" readonly>
				<h1>원</h1>
				<a class="transfer" href="">이체</a>
				<a class="card" href="">카드내역</a>
			</c:if>
		</div>
		<div class="coinMoney">
			<span class="coin">오픈뱅킹</span>
			<c:if test="${login ne 1 }">
				<span class="coinCollect">0원</span>
			</c:if>
			<c:if test="${login eq 1 }">
				<span class="coinCollect">${total}원</span>
			</c:if>
		</div>
		<div class="bankProduct" style="overflow: auto;">
			<table class="w3-table-all">
				<c:forEach var="list" items="${list}">
					<tr>
						<td align="right">&emsp;&emsp;&emsp;${list.open_account_no}&emsp;</td>
						<td align="right">&emsp;${list.open_bank}&emsp;</td>
						<td align="right">&emsp;${list.open_balance}원&emsp;</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bankProduct">
			<span class="productName">금융상품</span> <select name="productListAll"
				class="productList">
				<option value="조회" selected>상품조회
				<option value="남">남</option>
				<option value="여">여</option>
			</select> <span class="moneySave">589,212</span>
		</div>
	</div>
	<div class="introduce">
		<span class="introduceBank">차원이 다른 은행 <br>Naru뱅크
		</span> <span class="introduceBank2">고객님께 더욱 더 쉽고, 편리한 <br> 소통이
			이루어지는 은행이 되도록 노력하겠습니다
		</span>
	</div>
</div>
<hr class="line">
<div class="stock_page">
	<img src="<%=request.getContextPath()%>/images/stock.png">
	<div class="stock_input">
		<form action="<%=request.getContextPath()%>/stock/stockgraph"
			method="post" name="transferform">

			<input type="text" class="stock_input_text" name="stockname" id="stockname" 
				placeholder="종목검색"> <span class="start">시작일 :</span> <input
				type="date" class="stock_input_date" name="startdate"
				min="2010-08-01" max="2020-12-31" contenteditable="false"
				placeholder="시작일"> <input type="date"
				class="stock_input_date2" name="enddate" min="2010-08-01"
				max="2020-12-31" contenteditable="false"> <span class="end">:종료일</span>

			<div class="page">
				<button type="submit">종목 확인하기</button>
			</div>
		</form>
	</div>

</div>




<script type="text/javascript">
	var balance = new Array();
	<c:forEach items="${balance}" var="item">
	balance.push("${item}");
	</c:forEach>

	document.getElementById('balance').value = balance[0];
</script>
<script type="text/javascript">
	function change() {
		var account = new Array();
		<c:forEach items="${account_num}" var="item">
		account.push("${item}");
		</c:forEach>

		var balance = new Array();
		<c:forEach items="${balance}" var="item">
		balance.push("${item}");
		</c:forEach>

		var num = document.getElementById('account_no');
		for (var i = 0; i < account.length; i++) {
			if (num.value == account[i]) {
				document.getElementById('balance').value = balance[i];
			}
		}
	}
</script>
<script>
	$(function() { //화면 다 뜨면 시작
		var searchSource = [	
		
			<c:forEach var="stocklist" items="${stocklist}">
			"${stocklist.exname} ${stocklist.excode}",
			</c:forEach>
			""
			
		]; // 배열 형태로  ]; // 배열 형태로 
		$("#stockname").autocomplete({ //오토 컴플릿트 시작
			source : searchSource, // source 는 자동 완성 대상
			select : function(event, ui) { //아이템 선택시
				console.log(ui.item);
			},
			focus : function(event, ui) { //포커스 가면
				return false;//한글 에러 잡기용도로 사용됨
			},
			minLength : 1,// 최소 글자수
			autoFocus : true, //첫번째 항목 자동 포커스 기본값 false
			classes : { //잘 모르겠음
				"ui-autocomplete" : "highlight"
			},
			delay : 1, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
			//            disabled: true, //자동완성 기능 끄기
			position : {
				my : "right top",
				at : "right bottom"
			}, //잘 모르겠음
			close : function(event) { //자동완성창 닫아질때 호출
				console.log(event);
			}
		});

	});
</script>
</html>
