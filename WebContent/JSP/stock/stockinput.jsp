<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/transfer/stockgraph" method="post" name="transferform">

<input type="text" name="stockname">
<input type="submit" value="입력">

</form>
</body>
</html>