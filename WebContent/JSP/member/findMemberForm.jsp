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
			
			<div class="tabs">
				<span class="tab findid active"><a href="#findid">ID</a></span> 
				<span class="tab findpwd"><a href="#findpwd">Password</a></span>
			</div>
			
			<div class="findid-cont cont">
			<form name="formm" method="post" id="authForm" action="<%=request.getContextPath()%>/member/findId">
					<div class="box_login">
						<div class="inp_text">
							<label for="findName" class="screen_out">이름</label> <input
								class="find" type="text" name="member_name" placeholder="이름을 입력해주세요">
						</div>
						<div class="inp_text">
							<label for="findEmail" class="screen_out">이메일 주소</label> <input
								class="find" type="email" name="member_email" placeholder="이메일을 입력해주세요">
						</div>
					</div>
					<button type="submit" class="btn_login">찾기</button>
			</form>
			</div>
		<div class="findpwd-cont cont">
			<form name="formm" method="post" id="authForm" action="<%=request.getContextPath()%>/member/findPwd">
					<div class="box_login">
						<div class="inp_text">
							 <input type="text" class="find" name="member_name" placeholder="아이디를 입력해주세요">
						</div>
						<div class="inp_text">
							 <input type="email" class="find" name="member_email" placeholder="이메일을 입력해주세요">
						</div>
							<div class="inp_text">
							 <input type="text" class="find" name="member_phonenumber" placeholder="전화번호를 입력해주세요">
						</div>
					</div>
					<button type="submit" class="btn_login">찾기</button>		
			</form>
			</div>

		</div>
	</div>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	<script>
	$('.tabs .tab').click(function(){
	    if ($(this).hasClass('findid')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.findid-cont').show();
	    } 
	    if ($(this).hasClass('findpwd')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.findpwd-cont').show();
	    }
	});
	</script>
</body>
</html>