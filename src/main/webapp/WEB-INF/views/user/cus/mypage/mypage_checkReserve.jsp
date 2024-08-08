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
<body onload="hideAllSections()">
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
					<a href="/main">여기가자</a>
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
					<li><a href="/mypage/useInfo">회원정보 변경<i class="fa-solid fa-chevron-right"></i></a></li>
					<li class="backgorundColor-gray"><a href="/mypage/checkReserve">예약 내역 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/review">내가 쓴 리뷰 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/coupon">쿠폰함 <i class="fa-solid fa-chevron-right"></i></a></li>
				</ul>
			</div>

			<div class="reserve_content">
				<div id="reserve-container">
					<h1>예약내역</h1>
					
					<div class="status-container">
						<div class="reserve-status">예약 완료</div>
						<div class="reserve-status">이용 완료</div>
						<div class="reserve-status">예약 취소</div>
					
					</div>

					<div class="reserve-box">
						<img src="../../img/accomodation_img/1 아바니호텔(A+VANI HOTEL&PLAY)/대표 사진.jpg"
							width="150px" height="150px">
						<div class="reserve-text-container">
							<div>
								<p>예약번호 : 202408071419-000001 | 예약 완료</p>
								<h2>아바니호텔(A+VANI HOTEL&PLAY)</h2>
							</div>
							<h3>AVANI_DELUXE 1박</h3>
							<div class="reserve-btn">
								<button type="button">예약 취소</button>
								<button type="button">다시 예약</button>
								<button type="button">리뷰 작성</button>
							</div>
						</div>
						<div class="moreItems"><i class="fa-solid fa-ellipsis"></i></div>
					</div>
					
					<div class="reserve-box">
						<img src="../../img/accomodation_img/1 아바니호텔(A+VANI HOTEL&PLAY)/대표 사진.jpg"
							width="150px" height="150px">
						<div class="reserve-text-container">
							<div>
								<p>예약번호 : 202408071419-000001 | 예약 완료</p>
								<h2>아바니호텔(A+VANI HOTEL&PLAY)</h2>
							</div>
							<h3>AVANI_DELUXE 1박</h3>
							<div class="reserve-btn">
								<button type="button">예약 취소</button>
								<button type="button">다시 예약</button>
								<button type="button">리뷰 작성</button>
							</div>
						</div>
						<div class="moreItems"><i class="fa-solid fa-ellipsis"></i></div>
					</div>
					
					<div class="reserve-box">
						<img src="../../img/accomodation_img/1 아바니호텔(A+VANI HOTEL&PLAY)/대표 사진.jpg"
							width="150px" height="150px">
						<div class="reserve-text-container">
							<div>
								<p>예약번호 : 202408071419-000001 | 예약 완료</p>
								<h2>아바니호텔(A+VANI HOTEL&PLAY)</h2>
							</div>
							<h3>AVANI_DELUXE 1박</h3>
							<div class="reserve-btn">
								<button type="button">예약 취소</button>
								<button type="button">다시 예약</button>
								<button type="button">리뷰 작성</button>
							</div>
						</div>
						<div class="moreItems"><i class="fa-solid fa-ellipsis"></i></div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="/js/myPageUser.js"></script>
</body>
</html>
