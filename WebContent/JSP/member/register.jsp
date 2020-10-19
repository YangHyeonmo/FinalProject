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
	href="<%=request.getContextPath()%>/css/main.css">
<script src = "http://code.jquery.com/jquery-1.7.js"></script>
</head>
<body>
<div id="regbar">
		<div>
			<form class="regform" name="reg_form" method="post" action="<%=request.getContextPath()%>/member/insertRegister" onsubmit="return inputCheck()" >
			<input type= "hidden" name="idCheckOk" value="no">
				<fieldset>
					<h2 align="center">회원가입</h2>
					<div style="text-align: right;"><span style="color: red; font-weight: bold;">v </span><span>표시항목 필수 입력 항목입니다</span><br>
               <table style="text-align: left; width: 100%; height: 320px; font-weight: bold;"border="1" cellpadding="2" cellspacing="2">
                  <tbody><br><br>
                  <tr>
                        <td><small>v</small>
                        <span>아이디</span></td>
                        <td><input id="member_id" name="member_id" autofocus placeholder = "아이디를 입력해주세요" 
                        title = "아이디 입력창입니다."  style="width:calc(100% - 96px)"  >
                        <div class="check-font" id="id_check"></div><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>비밀번호</span> </td>
                        <td><input name="member_password" type="password" placeholder = "비밀번호를 입력해주세요" title = "비밀번호 입력창입니다." ><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>비밀번호확인</span> </td>
                        <td><input name="member_password_co" type="password" placeholder = "비밀번호를 확인해주세요" title = "비밀번호 확인 입력창입니다." ><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>이름</span> </td>
                        <td><input name="member_name" autofocus placeholder = "이름을 입력해주세요" title = "이름 입력창입니다."><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>이메일</span> </td>
                        <td>
                            <input name="member_email" type = "email" placeholder = "@ 포함 이메일을 입력하세요" title = "이메일을 입력하세요" >
                           </td>
                     </tr>
                     <tr>
                        <td>&nbsp;&nbsp;핸드폰번호</td>
                        <td> 
                            <input type="text" name="member_phonenumber" placeholder="-빼고 입력해주세요">
                           </td>
                     </tr>
                     <tr>
                        <td>&nbsp;생년월일</td>
                        <td><input name="member_birthdate"  placeholder = "ex)19950209" title = "ex)19950209">
                        </td>
                     </tr>
                     <tr>
                        <td>&nbsp;&nbsp;성별</td>
                        <td><select style="width:100px;" name="member_gender">
                       	 <option value="성별" selected>성별
                           <option value="남">남</option>
                           <option value="여">여</option>
                        </select>
                        </td>
                     </tr>  
                     <tr>
						<td>우변번호</td>
						<td><input type = "text" name="member_zipcode" id="sample4_postcode" placeholder="우편번호를 검색하세요" style="width:180px">
						<input type="button" value="우편번호 찾기" style="vertical-align: top; height:35px ; width:110px ;  font-size : 13px" onclick="sample4_execDaumPostcode()">
						</td>
					</tr>	
                     <tr>
                        <td>&nbsp;&nbsp;주소</td>
                        <td><input name="member_address" type="text" id="sample4_roadAddress" placeholder="나머지 주소를 입력하세요">
                        </td>
                     </tr>  
                     
                  </tbody>
               </table>
                  <br>
                  <br>
                  <div style="text-align: center;">
                     <input  type="submit" name="회원가입" value="회원가입">
                     <input type="reset" style="vertical-align: top; height:30px ; width:90px ;  font-size : 13px" value="다시쓰기">
                  </div>
               </div>
			</form>
		</div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>

</body>
</html>