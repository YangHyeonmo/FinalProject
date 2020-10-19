<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="name"><a href="">Business</a></div>
			</div>
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
		<li class="item">
			<div class="left">
				<div class="name"><a href="">Transfer</a></div>
			</div>
			<div class="right">
				<img src="<%=request.getContextPath()%>/images/arrow.png">
			</div>
		</li>
	</ul>
</div>
</html>