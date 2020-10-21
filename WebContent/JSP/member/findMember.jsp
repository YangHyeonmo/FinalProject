<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>NARUBANK</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
</head>
<body> 
<div class="inner_login">
    <div class="login_tistory">

        <form  name="formm" method="post" id="authForm" action="<%=request.getContextPath()%>/member/loginUser" >
            <fieldset>
            <legend class="screen_out">로그인 정보 입력폼</legend>
            <div class="box_login">
                <div class="inp_text">
                <label for="loginId" class="screen_out">아이디</label>
                <input type="text" id="loginId" name="member_id" placeholder="ID" >
                </div>
                <div class="inp_text">
                <label for="loginPw" class="screen_out">비밀번호</label>
                <input type="password" id="loginPw" name="member_password" placeholder="Password" >
                </div>
            </div> 
     			<button type="button" class="btn_login" onclick="loginCheck();">로그인</button>
            <div class="login_append">
                <div class="inp_chk"> <!-- 체크시 checked 추가 -->
                <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                <label for="keepLogin" class="lab_g">
        <span class="img_top ico_check"></span>
        <span class="txt_lab">로그인 상태 유지</span>
        </label>
                </div>
                <span class="txt_find">
                <a href="URL" class="link_find" onclick="window.open('<%=request.getContextPath()%>/JSP/introBack/userFindId.jsp', '_blank', 'top=120px,left=500px,width=500px,height=500px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">아이디</a>               
                    / 
                <a href="URL" class="link_find" onclick="window.open('<%=request.getContextPath()%>/JSP/introBack/userFindPwd.jsp', '_blank', 'top=120px,left=500px,width=500px,height=500px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">비밀번호 찾기</a>
                </span>
            </div>
            
            </fieldset>
        </form>
        
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>

</body>
</html>