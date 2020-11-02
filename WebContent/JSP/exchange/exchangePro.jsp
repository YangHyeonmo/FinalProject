<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		var IMP = window.IMP;
		IMP.init("imp32318151");

		//IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : "ORD20180131-0000011", //주문번호 매번 바뀌어야함
			name : "${cur_unit}",
			amount : "${kor_money}",
			buyer_email : "gildong@gmail.com",
			buyer_name : "member_name",
			buyer_tel : "010-4242-4242",
			buyer_postcode : "01181"
		}, function(rsp) { // callback
			if (rsp.success) {
				alert("환전이 완료되었습니다.")
			} else {
				alert("환전에 실패하였습니다.")
			}
		});
	</script>
</body>
</html>