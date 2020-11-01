<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR!!</title>
</head>
<body>
	<script>
		alert("ERROR!!ERROR!!");
		opener.parent.location.reload();
		opener.location.reload();
		history.go(-1);
	</script>
</body>
</html>