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

<section class="container">
		    <article class="half">
			        <h1>NARUBANK</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">로그인</a></span>
				            <span class="tab signup"><a href="#signup">회원가입</a></span>
			        </div>
			        <div class="contentLogin">
				            <div class="signin-cont cont">
					                <form name="formm" action="<%=request.getContextPath()%>/member/loginUser" method="post" >
						                    <input type="text" name="member_id" id="loginId" class="inptLogin" required="required" placeholder="아이디">
						                    <input type="password" name="member_password" id="loginPwd" class="inptLogin" required="required" placeholder="비밀번호">
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign in" class="submit" onclick="loginCheck();">
							                        <a href="URL" onclick="window.open('<%=request.getContextPath()%>/member/findMember', '_blank', 'top=250px,left=550px,width=756px,height=609px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;"> class="more">Forgot your password?</a>
						                    </div>
        					        </form>
    				        </div>
    		<div class="signup-cont cont">
                <form class="regform" name="reg_form" method="post" action="<%=request.getContextPath()%>/member/insertRegister" onsubmit="return inputCheck()">
						<input id="member_id" name="member_id" class="inpt" autofocus placeholder = "아이디를 입력해주세요" title = "아이디 입력창입니다." >
						<input name="member_password" type="password" class="inpt"  placeholder = "비밀번호를 입력해주세요" title = "비밀번호 입력창입니다." >
						<input name="member_password_co" type="password" class="inpt" placeholder = "비밀번호를 확인해주세요" title = "비밀번호 확인 입력창입니다." >
						<input type="text" name="member_name" id="name" class="inpt"  placeholder="이름을 입력해주세요">
                    	<input type="email" name="member_email" id="email" class="inpt" placeholder="@포함 이메일을 입력하세요">
                    	<input type="text" name="member_phonenumber" class="inpt" placeholder="-빼고 입력해주세요">
						<input type="text" name="member_birthdate"  placeholder="ex)19950209" class="birthdate" title = "생년월일">
                		<select name="member_gender" class="gender">
                       	 <option value="성별" selected>성별
                           <option value="남">남</option>
                           <option value="여">여</option>
                        </select>			
                        <input type ="text" name="member_zipcode" id="sample4_postcode" class="zipcode" placeholder="우편번호를 검색하세요" >	
                        <input type="button" value="우편번호 찾기" class="findZip" onclick="sample4_execDaumPostcode()">
                        <input name="member_address" type="text" id="sample4_roadAddress" class="inpt" placeholder="나머지 주소를 입력하세요">    
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign up" class="submit">
							                        <a href="#" class="more">Terms and conditions</a>
						                    </div>
        					        </form>
            </div>
			        </div>
		    </article>
		    <div class="half bg"></div>
	</section>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>

</body>
</html>