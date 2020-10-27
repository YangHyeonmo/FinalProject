<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
</head>

<body class="main">
<img class="mainPageImg" src="<%=request.getContextPath()%>/images/pointerLogo.png">
<div class="phoneScreen">
	
	<c:if test="${login ne 1}">
	<span class="memberId">홍길동</span>
	</c:if>
	<c:if test="${login eq 1}">
	<span class="memberId">${member.member_name}</span>
	</c:if>
	
	
	
	<div class="insideScreen">
	<span class="my">내 계좌</span>
	<select name="member_gender" id="account_no" class="myAccount" onchange="change()">
	<option value="조회" selected>계좌조회
      <c:forEach var= "ACCOUNT_NO" items="${account_num }" varStatus="status">
			<option value=${ACCOUNT_NO }>${ACCOUNT_NO}</option>
	</c:forEach>
	</select>		
	
	<c:if test="${login ne 1 }">
	<input class="money" maxlength="11"  placeholder="로그인하세요" readonly >
	</c:if>
	<c:if test="${login eq 1 }">
	<input class="money" maxlength="11" value="${balance[0]}" placeholder="로그인하세요" id="balance" readonly><h1>원</h1>
	<a class="transfer" href="">이체</a>
	<a class="card" href="">카드내역</a>
	</c:if>
		</div>
	<div class="coinMoney">
	<span class="coin">잔돈</span>
	<span class="coinCollect">897,231원</span>
	</div>
	
	<div class="bankProduct">
	<span class="productName">금융상품</span>
	
	<select name="productListAll" class="productList">
          <option value="조회" selected>상품조회
          <option value="남">남</option>
          <option value="여">여</option>
	</select>
	
	<span class="moneySave">589,212</span>	
	</div>
	
	<div>
	
	
	</div>
	
	
	<div>
	<%-- <img  class="phoneImage" src="<%=request.getContextPath()%>/images/catFoot.png"> --%>
	</div>
		
	</div>
	
	<div class="introduce">
	<span class="introduceBank">차원이 다른 은행 <br>Naru뱅크</span>
	<span class="introduceBank2">고객님께 더욱 더 쉽고, 편리한 <br> 소통이 이루어지는 은행이 되도록 노력하겠습니다</span>
	</div>
	
<script type="text/javascript">
var balance=new Array();
<c:forEach items="${balance}" var="item">
	balance.push("${item}");
</c:forEach>


document.getElementById('balance').value=balance[0];
</script>
<script type="text/javascript">
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
}
</script>	
	
	
	
</body>

</html>
