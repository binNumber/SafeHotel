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
<body>
	<div id="modify-reservation-popup" class="display-none">
		<div id="modify-reservation-container">
			<div id="modify-reservation-box">

				<h1>예약자 정보 수정</h1>

				<div id="modify-reservation-container-cancel">
					<div id="icon-cancel">
						<i class="fa-solid fa-xmark"></i>
					</div>
				</div>

				<div id="reservation-modify-text-container">
					<h2>숙소 정보</h2>

					<div id="modify-reservation-acmInfo">
						<h3>어반스테이 속초등대해변</h3>

						<div id="modify-reserve-info">
							<table>
								<tr>
									<th>일정</th>
									<th>2024/08/09 ~ 2024/08/10 | 1박</th>
								</tr>
								<tr>
									<th>객실 정보</th>
									<th>New Fusion Family(고급어메니티)</th>
								</tr>
							</table>
						</div>

					</div>

					<hr />

					<h2>예약자 정보</h2>

					<div id="reservation-modify-form">
						<form action="" method="post">
							<input type="hidden" name="rsvtCode" value="">

							<div id="reservation-modify-gustName">
								<h3>예약자 이름</h3>
								<input type="text" name="guestName" value="게스트 이름">
							</div>

							<div id="reservation-modify-gusttel">
								<h3>예약자 번호</h3>
								<input type="text" name="guestTel" value="게스트 번호"
									class="nickname">
							</div>

							<button type="submit" class="btn-modify">수정하기</button>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>

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

			<div class="reserve-info-content">
				<div id="reserve-info-container">
					<h2>
						<i class="fa-solid fa-arrow-left"></i> <span id="back-icon-margin">예약내역
							상세</span>
					</h2>

					<br />

					<h1>예약 완료</h1>


					<div id="acm_info">
						<img src="/img/accomodation_img/10 어반스테이 속초등대해변/대표사진.jpg"
							width="180px" height="180px">
						<div class="acm-info-text">
							<h2>
								<a href="">어반스테이 속초등대해변</a>
							</h2>
							<h3>
								<i class="fa-solid fa-copy"></i> 주소 복사
							</h3>
						</div>
					</div>

					<br />

					<div id="reserve-info">
						<table>
							<tr>
								<th>일정</th>
								<th>2024/08/09 ~ 2024/08/10 | 1박</th>
							</tr>
							<tr>
								<th>객실 정보</th>
								<th>New Fusion Family(고급어메니티)</th>
							</tr>
						</table>
					</div>

					<hr />

					<div id="reserve-user-info">
						<h2>예약 정보</h2>
						<table>
							<tr>
								<th>예약 번호</th>
								<th>20240809-00001 <span><i class="fa-solid fa-copy"></i>
										예약번호 복사</span>
								</th>
							</tr>
							<tr>
								<th>예약자 이름</th>
								<th>우희선</th>
							</tr>
							<tr>
								<th>예약자 번호</th>
								<th>010-5472-4721</th>
							</tr>
						</table>
					</div>

					<hr />

					<div id="payment-container">
						<h2>결제 정보</h2>
						<div>
							<table>
								<tbody id="payment-info">
									<tr>
										<th>결제 일시</th>
										<th>2024/07/20</th>
									</tr>
									<tr>
										<th>결제 수단</th>
										<th>신용/체크카드</th>
									</tr>
								</tbody>

								<tr class="blankSpace">
									<td colspan="2"></td>
									<!-- 앞 뒤 공백용 -->
								</tr>
								<tr class="separator">
									<td colspan="2"></td>
									<!-- 전체 셀을 포함하는 빈 행으로 구분선 표시 -->
								</tr>
								<tr class="blankSpace">
									<td colspan="2"></td>
									<!-- 앞 뒤 공백용 -->
								</tr>

								<tbody id="amount-info">
									<tr>
										<th>객실 가격(1박)</th>
										<th>88,000원</th>
									</tr>
									<tr>
										<th>적용 쿠폰</th>
										<th>0원</th>
									</tr>
									<tr>
										<th>사용 포인트</th>
										<th>0원</th>
									</tr>
								</tbody>

								<tr class="blankSpace">
									<td colspan="2"></td>
									<!-- 앞 뒤 공백용 -->
								</tr>
								<tr class="separator">
									<td colspan="2"></td>
									<!-- 전체 셀을 포함하는 빈 행으로 구분선 표시 -->
								</tr>
								<tr class="blankSpace">
									<td colspan="2"></td>
									<!-- 앞 뒤 공백용 -->
								</tr>

								<tbody id="total-amount-info">
									<tr>
										<th>총 결제 금액</th>
										<th>88,000원</th>
									</tr>
								</tbody>

							</table>
						</div>

					</div>

					<div id="reserve-modify-btn">
						<button type="button" id="modify-reservation-popup-btn">예약 정보 수정하기</button>
						<button type="button">예약 취소</button>
					</div>

				</div>
			</div>

		</div>
	</div>
	<script src="/js/customer/customer_modifyReview.js"></script>
</body>
</html>
