<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userSignUpPage</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>

	<div class="container-roominfo">
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="img/icon1.png" /></a>
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
					<c:if test="${empty user}">
						<button onclick="location.href='/usersign'">로그인/회원가입</button>
					</c:if>

					<c:if test="${not empty user}">
						<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
						<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>

		<div class="reservation-section">
			<div class="reservation-section-top">
				<a><img src="img/arrow.png" /></a>
				<h2>예약 확인 및 결제</h2>
			</div>
			<div class="reservation-section-mid">
				<div class="reservation-section-left">
					<div class="left-userinfo">
						<p>예약자 정보</p>
					</div>

					<div class="left-username">
						<h5>예약자 이름</h5>
						<input type="text" placeholder="홍길동">
					</div>

					<div class="left-userphone">
						<h5>휴대폰 번호</h5>
						<input type="text" id="phoneInput" placeholder="010-1234-5678"
							maxlength="13" oninput="formatPhoneNumber(this)">
						<h5>개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</h5>
					</div>

					<div class="left-usermethod">
						<h5>방문 방법</h5>
						<div class="left-usermethod-btn">
							<button onclick="changeStyle(this)" class="active">
								<img src="img/walk.png" />
								<p>도보 방문</p>
							</button>
							<button onclick="changeStyle(this)">
								<img src="img/car.png" />
								<p>차량 방문</p>
							</button>
						</div>
						<div class="sectionline"></div>
					</div>
				</div>

				<div class="reservation-section-right">
					<div class="right-top">
						<div class="right-top-title">
							<p>숙소명</p>
						</div>

						<div class="right-top-photo">
							<p>유저가 선택한 객실의 대표사진</p>
						</div>

						<div class="right-top-info">
							<div class="right-top-title">
								<h4>객실</h4>
								<div class="right-top-title">
									<h5>유저가 선택한 객실명</h5>
								</div>
							</div>
							<div class="right-top-date">
								<h4>일정</h4>
								<div class="right-top-date-detail">
									<h5>xx.xx (x) xx:xx ~</h5>
									<h5>xx.xx (x) xx:xx (x박)</h5>
								</div>
							</div>
						</div>

					</div>

					<div class="right-bottom"></div>
				</div>
			</div>

		</div>

		<div class="footer">
			<div class="footer-top">
				<div class="footer-top-service">

					<div class="footer-top-call">
						<h4>고객센터</h4>
						<h5>오전9시 - 오후9시</h5>
					</div>

					<div class="company footer-top">
						<h4>회사</h4>
						<h5>
							<a>회사소개</a>
						</h5>
					</div>

					<div class="info footer-top">
						<h4>서비스</h4>
						<h5>
							<a>공지사항</a>
						</h5>
						<h5>
							<a>자주 묻는 질문</a>
						</h5>
					</div>

					<div class="bouns footer-top">
						<h4>혜택</h4>
						<h5>
							<a>쿠폰 이벤트</a>
						</h5>
						<h5>
							<a>일일 한정 이벤트</a>
						</h5>
						<h5>
							<a>선착순 이벤트</a>
						</h5>
					</div>


				</div>
			</div>
			<div class="footer-mid">
				<h6>(주)여기가자</h6>
				<h6>주소:충청남도 천안시 동남구 대흥로 215, 7,8층 휴먼교육센터 | 대표이사:김김김 |
					사업자등록번호:124-23-43980</h6>
				<h6>전자우편주소:help@gaja.com | 통신판매번호:2024-충남천안-02321 | 관광사업자
					등록번호:제1023-53호 | 전화번호:1698-2347 | 호스팅서비스제공자의 상호 표시:(주)여기가자</h6>
				<h6>(주)여기가자는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한
					의무와 책임은 각 판매자에게 있습니다.</h6>
			</div>
			<div class="footer-bottom">
				<h4>
					<a>이용약관</a>
				</h4>
				<h4>
					<a>개인정보처리방침</a>
				</h4>
				<h4>
					<a>소비자 분쟁해결 기준</a>
				</h4>
				<h4>
					<a>콘텐츠산업징흥법에 의한 표시</a>
				</h4>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>