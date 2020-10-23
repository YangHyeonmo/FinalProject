<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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