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
<link href="/css/customer_mypage.css" rel="stylesheet" type="text/css">
</head>
<body onload="hideAllSections()">
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
					<li><a href="/mypage/userInfo">회원정보 변경<i
							class="fa-solid fa-chevron-right"></i></a></li>
					<li class="backgorundColor-gray"><a
						href="/mypage/checkReservation/confirmed">예약 내역 <i
							class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/review">내가 쓴 리뷰 <i
							class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/coupon">쿠폰함 <i
							class="fa-solid fa-chevron-right"></i></a></li>
				</ul>
			</div>

			<div class="reserve_content">
				<div id="reserve-container">
					<h1>
						<i class="fa-solid fa-arrow-left"></i> 예약내역 상세
					</h1>

					<br />

					<h1>예약 완료</h1>

					<div>
						<div class="acm_info">
							<img src="/img/accomodation_img/10 어반스테이 속초등대해변/대표사진.jpg"
								width="200px" height="200px">
							<div class="acm-info-text">
								<h2>어반스테이 속초등대해변</h2>
								<p><i class="fa-solid fa-copy"></i> 주소 복사<p>
							</div>
						</div>
					</div>

					<br />

					<div>
						<p>일정</p>
						<p>객실 정보</p>
					</div>

					<div>
						<p>
							<button type="button"></button>
							2024/08/09 ~ 2024/08/10 | 1박
						</p>
						<p>New Fusion Family(고급어메니티)</p>
					</div>

					<br />
					
					<div>
						<h2>예약 정보</h2>
						<div>
							<p>예약 번호</p>
							<p>예약자 이름</p>
							<p>예약자 연락처</p>
						</div>
						<div>
							<p>
								20240809-00001
								<span><i class="fa-solid fa-copy"></i> 예약번호 복사</span>
							</p>
							<p>우희선</p>
							<p>010-2785-2721</p>
						</div>
					</div>
					
					<br />

					<div>
						<h2>결제 정보</h2>
						<div>
							<table>
								<thead>
									<tr>
										<th>결제 일시</th>
										<th>결제 수단</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>2024/07/20</th>
										<th>신용/체크카드</th>
									</tr>
								</tbody>
							</table>
						</div>
						<div>
							<table>
								<thead>
									<tr>
										<th>객실 가격(1박)</th>
										<th>적용 쿠폰</th>
										<th>사용 포인트</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>88,000원</th>
										<th>0원</th>
										<th>0원</th>
									</tr>
								</tbody>
							</table>
							<table>
								<thead>
									<tr>
										<th>총 결제 금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>88,000원</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="/js/myPageUser.js"></script>
</body>
</html>
