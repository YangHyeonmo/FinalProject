
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

	//==============================================================
	

	$(function(){
	 	
	  var month = 0;
	  var html = document.getElementsByTagName('html')[0];
	  var number = "";
	  
	  var selected_card = -1;
	  
	  $(document).click(function(e){
	    if(!$(e.target).is(".ccv") || !$(e.target).closest(".ccv").length){
	      $(".card").css("transform", "rotatey(0deg)");
	      $(".seccode").css("color", "rgba(0,0,0,0.3)");
	    }
	    if(!$(e.target).is(".expire") || !$(e.target).closest(".expire").length){
	      $(".date_value").css("color", "rgba(0,0,0,0.3)");
	    }
	    if(!$(e.target).is(".number") || !$(e.target).closest(".number").length){
	      $(".card_number").css("color", "rgba(0,0,0,0.3)");
	    }
	    if(!$(e.target).is(".inputname") || !$(e.target).closest(".inputname").length){
	      $(".fullname").css("color", "rgba(0,0,0,0.3)");
	    }
	  });
	  
	  
	  //Card number input
	  $(".number").keyup(function(event){
	    $(".card_number").text($(this).val());
	    number = $(this).val();
	    
	    if($(".card_number").text().length === 0){
	      $(".card_number").html("&#x25CF;&#x25CF;&#x25CF;&#x25CF; &#x25CF;&#x25CF; &#x25CF;&#x25CF;&#x25CF;&#x25CF; ");
	    }

	  }).focus(function(){
	    $(".card_number").css("color", "white");
	  }).on("keydown input", function(){
	    
	    $(".card_number").text($(this).val());
	    
	    if(event.key >= 0 && event.key <= 9){
	      if($(this).val().length === 4 || $(this).val().length === 7 || $(this).val().length === 12){
	        $(this).val($(this).val() +  " ");
	      }
	    }
	  })
	  
	  //Name Input
	  $(".inputname").keyup(function(){  
	    $(".fullname").text($(this).val());  
	    if($(".inputname").val().length === 0){
	        $(".fullname").text("FULL NAME");
	    }
	    return event.charCode;
	  }).focus(function(){
	    $(".fullname").css("color", "white");
	  });
	  
	  //Security code Input
	  $(".ccv").focus(function(){
	    $(".card").css("transform", "rotatey(180deg)");
	    $(".seccode").css("color", "white");
	  }).keyup(function(){
	    $(".seccode").text($(this).val());
	    if($(this).val().length === 0){
	      $(".seccode").html("&#x25CF;&#x25CF;&#x25CF;");
	    }
	  }).focusout(function() {
	      $(".card").css("transform", "rotatey(0deg)");
	      $(".seccode").css("color", "var(--text-color)");
	  });
	    
	  
	  //Date expire input
	  $(".expire").keypress(function(event){
	    if(event.charCode >= 48 && event.charCode <= 57){
	      if($(this).val().length === 1){
	          $(this).val($(this).val() + event.key + " / ");
	      }else if($(this).val().length === 0){
	        if(event.key == 1 || event.key == 0){
	          month = event.key;
	          return event.charCode;
	        }else{
	          $(this).val(0 + event.key + " / ");
	        }
	      }else if($(this).val().length > 2 && $(this).val().length < 9){
	        return event.charCode;
	      }
	    }
	    return false;
	  }).keyup(function(event){
	    $(".date_value").html($(this).val());
	    if(event.keyCode == 8 && $(".expire").val().length == 4){
	      $(this).val(month);
	    }
	    
	    if($(this).val().length === 0){
	      $(".date_value").text("MM / YYYY");
	    }
	  }).keydown(function(){
	    $(".date_value").html($(this).val());
	  }).focus(function(){
	    $(".date_value").css("color", "white");
	  });
	});

	      function money(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
	          var element= parseInt(document.getElementById("TRANSFER_PRICE").value);
	    	  document.getElementById("TRANSFER_PRICE").value=element+price;
	      }

	      function money2(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
	          var element= parseInt(document.getElementById("TRANSFER_PRICE2").value);
	    	  document.getElementById("TRANSFER_PRICE2").value=element+price;
	      }

	      function money3(price) {                           /* type 메뉴 선택시 type에 해당하는 테이블 출력하는 함수   /  cityName => kind(type) */
	          var element= parseInt(document.getElementById("TRANSFER_PRICE3").value);
	    	  document.getElementById("TRANSFER_PRICE3").value=element+price;
	      }

	function openTransfer(bank) {
	  var i;
	  var x = document.getElementsByClassName("bank");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  document.getElementById(bank).style.display = "block";
	}
	
	var start_year="2020";// 시작할 년도 
	var today = new Date(); 
	var today_year= today.getFullYear(); 
	var index=0; 
	for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
		document.getElementById('select_year').options[index] = new Option(y, y); 
		index++; 
		} 
	index=0; 
	for(var m=1; m<=12; m++){ 
		document.getElementById('select_month').options[index] = new Option(m, m); 
		index++; 
		} 
	for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도 
		document.getElementById('select_year2').options[index] = new Option(y, y); 
		index++; 
		} 
	index=0; 
	for(var m=1; m<=12; m++){ 
		document.getElementById('select_month2').options[index] = new Option(m, m); 
		index++; 
		} 
		
	lastday(); 
	function lastday(){ //년과 월에 따라 마지막 일 구하기 
		var Year=document.getElementById('select_year').value; 
		var Month=document.getElementById('select_month').value; 
		var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
		var dayindex_len=document.getElementById('select_day').length; 
		if(day>dayindex_len){ 
			for(var i=(dayindex_len+1); i<=day; i++){ 
				document.getElementById('select_day').options[i-1] = new Option(i, i); 
				} 
		} else if(day<dayindex_len){ 
			for(var i=dayindex_len; i>=day; i--){ 
				document.getElementById('select_day').options[i]=null;
				} 
			} 
		} 

	
	lastday2(); 
	function lastday2(){ //년과 월에 따라 마지막 일 구하기 
		var Year=document.getElementById('select_year2').value; 
		var Month=document.getElementById('select_month2').value; 
		var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
		var dayindex_len=document.getElementById('select_day2').length; 
		if(day>dayindex_len){ 
			for(var i=(dayindex_len+1); i<=day; i++){ 
				document.getElementById('select_day2').options[i-1] = new Option(i, i); 
				} 
		} else if(day<dayindex_len){ 
			for(var i=dayindex_len; i>=day; i--){ 
				document.getElementById('select_day2').options[i]=null;
				} 
			} 
		} 

