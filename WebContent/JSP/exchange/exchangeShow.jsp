<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:set var="member_id" value="${member_id }" /> --%>
${member_id }
<c:forEach var = "sel1" items = "${sel }">

${sel1.exc_name }, ${sel1.cur_unit}, ${sel1.kor_money }, ${sel1.exc_money} , ${sel1.zipcode}, ${sel1.exc_date }
</c:forEach>
</body>
</html>