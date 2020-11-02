<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<c:if test="${msg==1}">
	<script>
		alert("시작 날짜를 정확하게 입력해주세요");
	</script>
</c:if>	
<c:if test="${msg==2 }">
	<script>
		alert("완료 날짜를 정확하게 입력해주세요");
	</script>
</c:if>
<c:if test="${msg==3 }">
	<script>
		alert("현재 날짜보다 일찍 입력");
	</script>
</c:if>
<form action="<%=request.getContextPath()%>/stock/stockgraph" method="post" name="transferform">

<input type="text" name="stockname">
<input type="date"  name="startdate"
                  min="2010-08-01" max="2020-12-31"
                  contenteditable="false">
<input type="date"  name="enddate"
                  min="2010-08-01" max="2020-12-31"
                  contenteditable="false">
<input type="submit" value="입력">

</form>
