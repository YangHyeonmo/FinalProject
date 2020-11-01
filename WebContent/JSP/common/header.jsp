<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
></script>
</head>
<div class="search-header">
			<img class="navbar-img" src="<%=request.getContextPath()%>/images/NaruCat.png">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/view/mainPage"
				style="margin-left: 95px; font-size: 50px; color: white">
			<strong>Narubank</strong></a>
			
			<input class="search" type="text" placeholder="여기는 검색창" size="20">
			
		</div>

<nav class="navbar navbar-inverse" style="margin-top:9rem; background-color: rgba(0,0,0,0); box-shadow: 5px 5px 5px 5px grey;">
	<div class="container-fluid">
		
		<c:if test="${sessionScope.login eq 1}">
			<ul class="nav navbar-nav">
				<li class="dropdown" ><a class="dropdown-toggle" data-toggle="dropdown" style="margin-left:28rem;"
					href="#"
				>조회 <span class="caret"></span></a>
					<ul class="dropdown-menu" style="margin-left:28rem;">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"
					href="#"
				>이체 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/transfer/TransferWrite">이체</a></li>
						<li><a href="<%=request.getContextPath()%>/transfer/TransferSelect">이체
								내역 조회</a></li>
						<li><a href="<%=request.getContextPath()%>/stock/stockinput">">Page 1-3</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"
					href="#"
				>환전 / 환율 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/exchange/exchangeForm">환전</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"
					href="#"
				>오픈뱅킹 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking"
						>오픈뱅킹 계좌</a></li>
						<li><a
							href="<%=request.getContextPath()%>/openbanking/SelectReservation"
						>오픈뱅킹 예약</a></li>
						<li><a
							href="<%=request.getContextPath()%>/openbanking/SelectWithdrawLog"
						>오픈뱅킹 내역</a></li>
					</ul></li>
			</ul>
		</c:if>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${sessionScope.login ne 1}">
				<li><a href="URL"
					onclick="window.open('<%=request.getContextPath()%>/member/loginRegister', '_blank', 'top=250px,left=550px,width=756px,height=609px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;"
				style="margin-right:24rem;"><span class="glyphicon glyphicon-user"></span> Login / Sign Up</a></li>
			</c:if>
			<c:if test="${sessionScope.login eq 1}">
				<li><a href="<%=request.getContextPath()%>/view/memberMyPage"><span
						class="glyphicon glyphicon-user"
					></span> 마이페이지</a></li>
				<li><a href="<%=request.getContextPath()%>/view/logout" style="margin-right:23rem;"><span
						class="glyphicon glyphicon-log-in"
					></span> 로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</nav>
</html>
