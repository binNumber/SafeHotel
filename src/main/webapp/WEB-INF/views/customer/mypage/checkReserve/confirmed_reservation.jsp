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
<link href="/css/customer/mypage_reservation.css" rel="stylesheet"
	type="text/css">
<script src="/js/customer/alertMsg.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="/img/icon1.png" /></a>
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
					<a href="/"><img src="/logo/가로로고 복사3.png"></a>
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
					<li class="backgorundColor-gray"><a href="/mypage/checkReservation/confirmed">예약 내역 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/review">내가 쓴 리뷰 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/useableCoupon">쿠폰함 <i class="fa-solid fa-chevron-right"></i></a></li>
				</ul>
			</div>

			<div class="reserve_content">
				<div id="reserve-container">
					<h1>예약내역</h1>

					<div class="status-container">
						<div class="reserve-status status-select" onclick="location.href='/mypage/checkReservation/confirmed'">예약 완료</div>
						<div class="reserve-status" onclick="location.href='/mypage/checkReservation/complete'">이용 완료</div>
						<div class="reserve-status" onclick="location.href='/mypage/checkReservation/cancelled'">예약 취소</div>
					</div>

					<c:forEach var="reservation" items="${comfirmedList}">

						<div class="reserve-box">
							<img
								src="${reservation.imgUrl}/${reservation.imgSaveName}${reservation.imgExtension}"
								width="160px" height="160px">
							<div class="reserve-text-container">
								<div>
									<p><a href="/mypage/checkReservation/reservationInfo?rsvtCode=${reservation. rsvtCode}">예약번호 : ${reservation.rsvtCode} | 예약 완료</a></p>
									<h2>${reservation.acmName}</h2>
								</div>
								<h3>${reservation.roomName}· ${reservation.totalNight}박
									${reservation.totalDays}일</h3>
								<p class="checkin-text">체크인 : ${reservation.rsvtChekInDate} |
									체크아웃 : ${reservation.rsvtChekOutDate}</p>
								<div class="reserve-btn">
									<button type="button"
										onclick="location.href='/mypage/checkReservation/reservationInfo?rsvtCode=${reservation.rsvtCode}'">예약
										상세</button>
									<button type="button"
										onclick="location.href='/mypage/checkReservation/cancel?rsvtCode=${reservation.rsvtCode}'">예약
										취소</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="/js/customer/customer_mypage_reservation.js"></script>
</body>
</html>
