<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<title>MyPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<div class="mainPageB">
	<div class="header">
		<div class="thumb-wrapper">
			<img class="thumb" src="<%=request.getContextPath()%>/images/person.png">
			<div class="badge">6</div>
		</div>
		<div class="text-area">
			<h2 class="greeting">${member_name}님,어서오십시오</h2>
			<div class="desc">무엇을 도와드릴까요</div>
		</div>
		<div class="mail">${member_email}</div>

	</div>

	<ul class="list">
		<li class="item">
			<div class="left">
				<div class="name"><a href="">Bookmark</a></div>
			</div>
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
		<li class="item">
			<div class="left">
				<div class="name"><a href="<%=request.getContextPath()%>/view/myInfo">Account Info</a></div>
			</div>
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
		<li class="item">
			<div class="left">
				<div class="name"><a onclick="myFunction('Business')" >계좌</a></div>
			</div>
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
		<div id="Business" class="w3-hide w3-container w3-center w3-pale-white">
  				<p>계좌 소메뉴</p>
		</div>
		<li class="item">
			<div class="left">
				<div class="name"><a onclick="myFunction('Transfer')" >Transfer</a></div>
			</div>
			
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
		<div id="Transfer" class="w3-hide w3-container w3-center w3-pale-white">
  				<p>Transfer 소메뉴 추가 예정</p>
		</div>
	</ul>
</div>
<script>
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>
</html>