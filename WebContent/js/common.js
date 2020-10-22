
	// loginCheck()
	function loginCheck() {
	   var frm = document.formm;
	   if (frm.member_id.value == "") {
	      alert("아이디를 입력하세요");
	      frm.member_id.focus();
	      return;
	   } else if (frm.member_password.value == "") {
	      alert("비밀번호를 입력하세요");
	      frm.member_password.focus();
	      return;
	   }
	   frm.submit();
	}

	function sendRequest(url, params, callback, method) {
//		alert("ajax 실행);
		httpRequest = new XMLHttpRequest();
		let httpMethod = method ? method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}
		let httpParams = (params == null || params == '') ? null : params;
		let httpUrl = url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		httpRequest.open(httpMethod, httpUrl, true);
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		httpRequest.onreadystatechange = callback;
		httpRequest.send(httpMethod == 'POST' ? httpParams : null);
	}
	
	function joinUseridCheck(member_id) {
		console.log("joinUseridCheck:" + member_id);
		let url = "idCheck?member_id=" + member_id;
		//문자와 숫자 합쳐서 8자리이상 
		if (member_id.length >= 8 && member_id.length <= 12) {
			sendRequest(url, "", joinUseridCallBack, "GET");
			
		} else {
			document.getElementById("viewstat").innerHTML = "<font color='red'>최소 8자리 최대 12자리입니다</font>";
		}
	}
	
	function joinUseridCallBack() {
		console.log(httpRequest.readyState + ":" + httpRequest.status);
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				console.log("back:" + httpRequest.responseText);
				if (httpRequest.responseText == "Yes") {
					document.getElementById("viewstat").innerHTML = "<font color='blue'>사용가능한 아이디입니다</font>";
				} else {
					document.getElementById("viewstat").innerHTML = "<font color='red'>사용불가한 아이디입니다</font>";
				}
			}
		}

	}
	// 회원가입 check
	function inputCheck() {
		let pattern1 = /[0-9]/;
		let pattern2 = /[a-zA-Z]/;
		let pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;

	   if (document.reg_form.member_id.value == "") {
	      alert("아이디 입력해주세요");
	      document.reg_form.member_id.focus();
	      return false;
	   }
	   if (document.reg_form.member_password.value == "" ){
		      alert("비밀번호 입력해주세요");
		      document.reg_form.member_password.focus();
		      return false;
	   }
	   if (document.reg_form.member_password_co.value != document.reg_form.member_password.value) {
	      alert("비밀번호가 틀렸습니다 다시입력해주세요");
	      document.reg_form.member_password_co.focus();
	      return false;
	   }
	   if (document.reg_form.member_name.value == "") {
	      alert("이름을 입력하세요");
	      document.reg_form.member_name.focus();
	      return false;
	   }
	   if (document.reg_form.member_email.value == "") {
	      alert("이메일을 입력 하세요");
	      document.reg_form.member_email.focus();
	      return false;
	   }
	   if (document.reg_form.member_phonenumber.value == "") {
	      alert("휴대본 번호를 입력 하세요");
	      document.reg_form.member_phonenumber.focus();
	      return false;
	   }
	   if (document.reg_form.member_birthdate.value == "") {
	      alert("생일을 입력 하세요");
	      document.reg_form.member_birthdate.focus();
	      return false;
	   }
	   if (document.reg_form.member_gender.value == "성별") {
	      alert("성별을 확인 하세요");
	      document.reg_form.member_gender.focus();
	      return false;
	   }
	   if (document.reg_form.member_zipcode.value == "") {
	      alert("우편번호를 검색 하세요");
	      document.reg_form.member_zipcode.focus();
	      return false;
	   }

	   if (document.reg_form.member_address.value == "") {
	      alert("나머지 주소를 입력 하세요");
	      document.reg_form.member_address.focus();
	      return false;
	   }
	   return true;
	}
	function win_close() {
	   self.close();
	}


	//우편번호 찾기
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
	   new daum.Postcode({
	       oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	           // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var roadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 참고 항목 변수

	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	               extraRoadAddr += data.bname;
	           }
	           // 건물명이 있고, 공동주택일 경우 추가한다.
	           if(data.buildingName !== '' && data.apartment === 'Y'){
	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	           }
	           // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	           if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	           }

	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           document.getElementById('sample4_postcode').value = data.zonecode;
	           document.getElementById("sample4_roadAddress").value = roadAddr;

	       }
	   }).open();
	}


	/*popup open/close */
	function openPop(){
		document.getElementById("popup").style.display = "block";
	}

	function closePop() {
		document.getElementById("popup").style.display = "none";
	}



