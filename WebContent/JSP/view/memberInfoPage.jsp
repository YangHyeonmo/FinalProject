<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 현모 바보 -->
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
</head>
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
 <form method="post" name="regFrm">

	<div class="header">
		<div class="thumb-wrapper">
			<img class="thumb" src="<%=request.getContextPath()%>/images/person.png">
			<div class="badge">6</div>
		</div>
		<div class="text-area">
			<h2 class="greeting">MyInfo</h2>
		</div>
	</div>

	<!-- 테이블 영역 -->
		<table class="tbl-reg">
			<tbody>
			<tr>
				<th>아이디</th>
				<td>
					${member.member_id}
				</td>
			</tr>
			<tr>
				<th>기존 비밀번호</th>
				<td>
					<input type="password" name="oldpwd"  placeholder="회원정보 수정, 탈퇴 시 기존 비밀번호를 입력해주세요"/>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="pwd" placeholder="변경할 비밀번호를 입력해주세요"/>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호 확인</th>
				<td>
					<input type="password" name="repwd" placeholder="변경할 비밀번호를 다시 입력해주세요"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value="${member.member_name}" />
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="email" value="${member.member_email}" /></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td>
	                <input type="text" name="tel" placeholder="-빼고 입력해주세요" value="${member.member_phonenumber}">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birthdate" size="6" value="${member.member_birthdate}" placeholder="ex)950101"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" id="male" value="남" ${member.member_gender.equals("남") ? "checked" : "" } /> <label for="male">남</label> &nbsp;
					<input type="radio" name="gender" id="female" value="여" ${member.member_gender.equals("여") ? "checked" : "" } /> <label for="female">여</label>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="zipcode" style="width:100px;" id="sample4_postcode" value="${member.member_zipcode}" />
					<button type="button" onClick="sample4_execDaumPostcode()">우편번호찾기</button>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="sample4_roadAddress" value="${member.member_address}"/></td>
			</tr>
			</tbody>
		</table>
		<div class="button">
		<button type="button" class="btn1"  onclick="memberDelete()">탈퇴하기</button>
		<button type="button" class="btn1" onclick="memberUpdate()">회원정보 수정</button>
		</div>
		<input type="hidden" name="author" value="${member.member_author}" />
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script>
//회원정보 수정
function memberUpdate(){
	var regForm = document.regFrm;
    var oldpwd = regForm.oldpwd.value;
    var pwd = regForm.pwd.value;
    var repwd = regForm.repwd.value;
    
    
    if(oldpwd==""){
        alert("비밀번호를 입력해주세요.");
    }
    else if(pwd!=repwd){
    	alert("변경할 비밀번호를 확인해주세요");
    }else{
    	regForm.action = "<%=request.getContextPath()%>/member/memberInfoUpdate";
    	regForm.submit();
    }
}

//회원탈퇴
function memberDelete(){
	var regForm = document.regFrm;
	var oldpwd = regForm.oldpwd.value;
	if(oldpwd==""){
        alert("비밀번호를 입력해주세요.");
	}
	else{
    	regForm.action = "<%=request.getContextPath()%>/member/memberDelete";
    	regForm.submit();
    }
}

</script>
</html>
