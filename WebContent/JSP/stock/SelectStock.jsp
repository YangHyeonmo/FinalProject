<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<form method="post" name="writeform"
	action="<%=request.getContextPath()%>/stock/SelectStock"
>
	<table class="w3-table-all">
		<br />
		<h1>
			<b>(임시)주식조회</b>
		</h1>
		<br />
		<tr>
			<td width="150" align="left">종목 검색</td>
			<td width="500">
				<input type="text" size="50" maxlength="50" id="exname" name="exname">
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<br />
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	<div class="w3-container">
		<table class="w3-table-all">
			<td>종목코드</td>
			<td>종목명</td>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.excode}&emsp;&emsp;</td>
					<td>${list.exname}&emsp;&emsp;</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
<script>
	$(function() { //화면 다 뜨면 시작
		var searchSource = [	
		
			<c:forEach var="list" items="${list}">
			"${list.exname}",
			</c:forEach>
			""
			
		]; // 배열 형태로  ]; // 배열 형태로 
		$("#exname").autocomplete({ //오토 컴플릿트 시작
			source : searchSource, // source 는 자동 완성 대상
			select : function(event, ui) { //아이템 선택시
				console.log(ui.item);
			},
			focus : function(event, ui) { //포커스 가면
				return false;//한글 에러 잡기용도로 사용됨
			},
			minLength : 1,// 최소 글자수
			autoFocus : true, //첫번째 항목 자동 포커스 기본값 false
			classes : { //잘 모르겠음
				"ui-autocomplete" : "highlight"
			},
			delay : 1, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
			//            disabled: true, //자동완성 기능 끄기
			position : {
				my : "right top",
				at : "right bottom"
			}, //잘 모르겠음
			close : function(event) { //자동완성창 닫아질때 호출
				console.log(event);
			}
		});

	});
</script>
