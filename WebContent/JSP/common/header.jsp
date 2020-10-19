<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body class="wrapper">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
       
    <div class="navbar-header">
    
   	<img class="navbar-img" src="<%=request.getContextPath()%>/images/naru3.png"><a class="navbar-brand" href="<%=request.getContextPath()%>/view/mainPage" style="margin-left:95px; font-size:50px; color:white"><strong>Narubank</strong></a>
    </div>
    
	<c:if test="${sessionScope.login eq 1}">
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">조회 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">이체 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">환전 / 환율 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
    </ul>
    </c:if>
   
    <ul class="nav navbar-nav navbar-right">
   	<c:if test="${sessionScope.login ne 1}">
      <li><a href="URL" onclick="window.open('<%=request.getContextPath()%>/member/login', '_blank', 'top=300px,left=700px,width=500px,height=300px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="URL" onclick="window.open('<%=request.getContextPath()%>/member/register', '_blank', 'top=120px,left=700px,width=500px,height=700px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    </c:if>
    <c:if test="${sessionScope.login eq 1}">
      <li><a href="<%=request.getContextPath()%>/view/memberMyPage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
      <li><a href="<%=request.getContextPath()%>/view/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
    </c:if>
    </ul>
  </div>
</nav>
 
</body>
</html>
