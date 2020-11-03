<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>


.w3-container .slideshow-container .mySlides {
	display: none
}

.w3-container .slideshow-container img {
	vertical-align: middle;
	max-height: 400px;
	overflow: hidden;
}

/* Slideshow container */
.w3-container .slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
	height:20rem;
	border:5px solid rgba(0,0,0,1);
	
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.w3-container .slideshow-container .text {
	color: black;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.w3-container .slideshow-container .numbertext {
	color: black;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.w3-container .dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.w3-container .slideshow-container .fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}
.w3-yellow, .w3-hover-yellow:hover{
	border-bottom:15px solid #fff;
}
@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
</style>
<c:if test="${message==0}">
	<script>
		alert("상품에 가입되었습니다.");
	</script>
</c:if>

<c:if test="${message==1}">
	<script>
		alert("인증번호가 맞지 않습니다.");
	</script>
</c:if>

</head>
	<div class="w3-container">
		<c:if test="${dbno == 1}">
			<div class="slideshow-container">
				<c:forEach var="bestD" items="${best1}">
					<!-- 예금 상품 best3 -->
					<div class="mySlides fade">
						<div class="numbertext">나루은행 추천상품 ${bestD.rnum }/3</div>
						<img src="<%=request.getContextPath()%>/images/${bestD.rnum}.png"
							style="width: 100%">
						<div class="text">
							<h1>${bestD.fin_name}</h1>
							<br> ${bestD.fin_content }<br> 금리 : ${bestD.fin_rate }<br>
						</div>

					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>

			</div>
			<br>

			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>


			<c:forEach var="depositP" items="${deposit}">
				<button onclick="finance('deposit${depositP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align"><span style="font-weight:bold;">상품</span> : ${depositP.fin_name } /
					<span style="font-weight:bold;">가입기간</span> : [${depositP.fin_date }]개월 </button>
				
				<div id="deposit${depositP.fin_no}" class="w3-container w3-hide">
					<span style="font-weight:bold;">상품 : </span>${depositP.fin_name}[${depositP.fin_content }] <br> <span style="font-weight:bold;">금리 :</span> 
					${depositP.fin_rate} % <br> <span style="font-weight:bold;">가입 기간 :</span>${depositP.fin_date}개월 상품입니다.<br>
					<button type="button" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${depositP.fin_no}'"
						style="float: right;">가입하기</button>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${dbno == 2}">
			<!-- 적금 상품 best3 -->
			<div class="slideshow-container">
				<c:forEach var="bestS" items="${best2}">
					<div class="mySlides fade">
						<div class="numbertext">나루은행 추천상품 ${bestS.rnum }/3</div>
						<img src="<%=request.getContextPath()%>/images/${bestS.rnum}.png"
							style="width: 100%">
						<div class="text">
							<h1>${bestS.fin_name}</h1>
							<br> ${bestS.fin_content }<br> 금리 : ${bestS.fin_rate }<br>
						</div>
					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>
			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
			
			
			<c:forEach var="savingP" items="${savings}">
				<button onclick="finance('savings${savingP.fin_no}')"
					class="w3-btn w3-block w3-yellow w3-left-align">${savingP.fin_name }[${savingP.fin_date }]개월
					상품</button>

				<div id="savings${savingP.fin_no}" class="w3-container w3-hide">
					<span style="font-weight:bold;">상품 : </span>${savingP.fin_name }[${savingP.fin_content }]<br> <span style="font-weight:bold;">금리 :</span>
					:${savingP.fin_rate} % <br> ${savingP.fin_amount }원 이상<br>
					<br> <span style="font-weight:bold;">가입 기간 :</span> ${savingP.fin_date}개월 상품입니다.<br>
					<button type="button" class="btn btn-light btn-lg active"
						onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${savingP.fin_no}'"
						style="float: right;">가입하기</button>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${dbno == 3}">
			<div class="slideshow-container">
				<c:forEach var="bestF" items="${best3}">
					<div class="numbertext">나루은행 추천상품 ${bestF.rnum }/3</div>
					<img src="<%=request.getContextPath()%>/images/${bestF.rnum}.png"
						style="width: 100%">
					<div class="text">
						<h1>${bestF.fin_name}</h1>
						<br> ${bestF.fin_content }<br> 최대 수익 :
						${bestF.fin_return }<br>
					</div>
			</div>
			</c:forEach>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>

	<c:forEach var="fundP" items="${fund}">
		<button onclick="finance('fund${fundP.fin_no}')"
			class="w3-btn w3-block w3-yellow w3-left-align">${fundP.fin_name }
			상품</button>


		<div id="fund${fundP.fin_no}" class="w3-container w3-hide">
			${fundP.fin_name }[${fundP.fin_content }]<br> 수익률 :
			${fundP.fin_return}% (3개월 누적)<br> 펀드 유형 : ${fundP.fin_type}<br>
			<button type="button" class="btn btn-light btn-lg active"
				onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${fundP.fin_no}'"
				style="float: right;">가입하기</button>
		</div>
	</c:forEach>
	</c:if>
	<c:if test="${dbno == 4}">
		<div class="slideshow-container">

			<c:forEach var="bestL" items="${best4}">
				<div class="mySlides fade">
					<div class="numbertext">나루은행 추천상품 ${bestL.rnum }/3</div>
					<img src="<%=request.getContextPath()%>/images/${bestL.rnum}.png"
						style="width: 100%">
					<div class="text">
						<h1>${bestL.fin_name}</h1>
						<br> ${bestL.fin_content }<br> 금리 : ${bestL.fin_rate }<br>
					</div>

				</div>
			</c:forEach>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>
		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
		<c:forEach var="loanP" items="${loan}">
			<button onclick="finance('loan${loanP.fin_no}')"
				class="w3-btn w3-block w3-yellow w3-left-align">${loanP.fin_name }
				상품</button>
			<div id="loan${loanP.fin_no}" class="w3-container w3-hide">
				${loanP.fin_name }[${loanP.fin_content }]<br> 기간 :
				${loanP.fin_date } 개월 <br> 상환방법 : ${loanP.fin_repay } <br>
				이자 : ${loanP.fin_rate} %<br> 최대 ${loanP.fin_amount }원 까지<br>
				<button type="button" class="btn btn-light btn-lg active"
					onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${loanP.fin_no}'"
					style="float: right;">가입하기</button>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${dbno == 5}">
		<c:forEach var="dw1" items="${DandW}">
			<button onclick="finance('dw1${dw1.fin_no}')"
				class="w3-btn w3-block w3-yellow w3-left-align">${dw1.fin_name }
				상품</button>
			<div id="dw1${dw1.fin_no}" class="w3-container w3-hide">
				${dw1.fin_name }[${dw1.fin_pro}]<br> ${dw1.fin_content }
				<button type="button" class="btn btn-light btn-lg active"
					onclick="javascript:location.href='<%=request.getContextPath()%>/finance/finCertification?fin_no=${dw1.fin_no}'"
					style="float: right;">가입하기</button>
			</div>
		</c:forEach>
	</c:if>
	</div>
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}

		function finance(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		};
	</script>
</html>