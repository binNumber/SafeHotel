<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 MY PAGE</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/customer_mypage.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="../../img/icon1.png" /></a>
					<div class="hidenav" id="sidebar">
						<div class="hidenavcontent">
							<button id="close-btn" class="close-btn">X</button>
							<ul>
								<li><a href="#" class="category" data-target="subcategory1">카테고리
										1</a>
									<ul class="subcategories" id="subcategory1">
										<li><a href="#">하위 카테고리 1-1</a></li>
										<li><a href="#">하위 카테고리 1-2</a></li>
										<li><a href="#">하위 카테고리 1-3</a></li>
									</ul></li>
								<li><a href="#" class="category" data-target="subcategory2">카테고리
										2</a>
									<ul class="subcategories" id="subcategory2">
										<li><a href="#">하위 카테고리 2-1</a></li>
										<li><a href="#">하위 카테고리 2-2</a></li>
										<li><a href="#">하위 카테고리 2-3</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="nav-top-center">
					<a href="/">여기가자</a>
				</div>
				<div class="nav-top-right" id="success-login">
					<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
					<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="mypage-sidebar">
				<ul>
					<li><a href="/mypage/userInfo">회원정보 변경<i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/checkReservation/confirmed">예약 내역 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/review">내가 쓴 리뷰 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li class="backgorundColor-gray"><a href="/mypage/useableCoupon">쿠폰함 <i class="fa-solid fa-chevron-right"></i></a></li>
				</ul>
			</div>

			<div class="coupon_content">
				<div id="coupon-container">
					<h1>받은 쿠폰 확인</h1>

					<div class="coupon-container">
						<div class="coupon-status status-select">사용 가능</div>
						<div class="coupon-status">사용 완료</div>
					</div>

					<div class="couponbox-container">

						<div class="coupon-box">
							<div>
								<h2>호텔 30% 할인</h2>
								<p>사용 기간 : 2024/08/07 ~ 2024/09/01
									<span class="coupon-status-text">30일 남음</span>
								</p>
							</div>
							<div>
								<p>50,000원 이상 결제 시 사용 가능</p>
								<p>최대 20,000원 할인</p>
								<p>
									사용처 : 호텔 <span>|</span> <span class="readMore">자세히 보기 <i
										class="fa-solid fa-chevron-right"></i></span>
								</p>
							</div>
							<div class="coupon-btn">
								<button type="button">사용하기</button>
							</div>
						</div>

						<div class="coupon-box">
							<div>
								<h2>호텔 30% 할인</h2>
								<p>사용 기간 : 2024/08/07 ~ 2024/09/01
									<span class="coupon-status-text">30일 남음</span>
								</p>
							</div>
							<div>
								<p>50,000원 이상 결제 시 사용 가능</p>
								<p>최대 20,000원 할인</p>
								<p>
									사용처 : 호텔 <span>|</span> <span class="readMore">자세히 보기 <i
										class="fa-solid fa-chevron-right"></i></span>
								</p>
							</div>
							<div class="coupon-btn">
								<button type="button">사용하기</button>
							</div>
						</div>
						
						<div class="coupon-box">
							<div>
								<h2>호텔 30% 할인</h2>
								<p>사용 기간 : 2024/08/07 ~ 2024/09/01
									<span class="coupon-status-text">30일 남음</span>
								</p>
							</div>
							<div>
								<p>50,000원 이상 결제 시 사용 가능</p>
								<p>최대 20,000원 할인</p>
								<p>
									사용처 : 호텔 <span>|</span> <span class="readMore">자세히 보기 <i
										class="fa-solid fa-chevron-right"></i></span>
								</p>
							</div>
							<div class="coupon-btn">
								<button type="button">사용하기</button>
							</div>
						</div>
						
						<div class="coupon-box">
							<div>
								<h2>호텔 30% 할인</h2>사용할 수 있는
								<p>사용 기간 : 2024/08/07 ~ 2024/09/01
									<span class="coupon-status-text">30일 남음</span>
								</p>
							</div>
							<div>
								<p>50,000원 이상 결제 시 사용 가능</p>
								<p>최대 20,000원 할인</p>
								<p>
									사용처 : 호텔 <span>|</span> <span class="readMore">자세히 보기 <i
										class="fa-solid fa-chevron-right"></i></span>
								</p>
							</div>
							<div class="coupon-btn">
								<button type="button">사용하기</button>
							</div>
						</div>

					</div>


				</div>
			</div>

		</div>
	</div>
</body>
</html>
