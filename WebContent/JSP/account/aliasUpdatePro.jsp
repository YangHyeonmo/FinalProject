<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>

<script>

window.open("<%=request.getContextPath()%>
	/account/aliasChange?account_num=${article.account_num}",
					"_self").close();
</script>
</html>