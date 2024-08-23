<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
</head>
<body>
	<div class="container">
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
					<a href="/"><img src="/logo/가로로고 복사3.png"></a>
				</div>
				<div class="nav-top-right" id="success-login">
					<c:if test="${empty user}">
						<button onclick="location.href='/signupMain'">로그인/회원가입</button>
					</c:if>

					<c:if test="${not empty user}">
						<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
						<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="main_content">
				<div>
					<h1>
						<span>국내여행 안심숙소</span> <br /> <span>이번숙소 여기가자</span>
					</h1>
				</div>
				<div class="search">
					<!-- 검색 폼 추가 -->
					<form id="searchForm" action="/search/listpage" method="get">
						<input type="hidden" name="searchText" id="formSearchText">
						<input type="hidden" name="checkIn" id="formCheckIn"> 
						<input type="hidden" name="checkOut" id="formCheckOut"> 
						<input type="hidden" name="people" id="formPeople">
					</form>
					<button class="btn-search">🔍
						지역이나 숙소를 검색해보세요</button>
					<div class="hidesearch" id="searchbar">
						<div class="backimg"></div>
						<div class="hidesearchcontent">
							<button id="btn-close" class="btn-close">X</button>
							<div class="searchcontent">
								<div class="search-top">
									<p>여행일정을 검색해보세요</p>
								</div>
								<div class="search-main">
									<div class="input-search">
										<img src='img/magnifier.png' /> <input id="search_term"
											name="search_term" type="text" placeholder="여행지나 숙소를 검색해보세요.">
										<div class="hide search-best" id="search_best">
											<div class="search-best-history">
												<h3>최근 검색어</h3>
											</div>
										</div>
									</div>

									<div class="btn-date">
										<div class="btn-date-checkin">
											<input type="date" id="checkInDate">
										</div>
										<div class="btn-date-checkout">
											<input type="date" id="checkOutDate">
										</div>
									</div>

									<div class="btn-people">
										<button id="btn_people">
											<img src='img/human.png' /> <span id="peopleNum"> 인원
												2 </span>
										</button>
										<div class="hide people-picker" id="people_picker">
											<p>인원</p>
											<div class="people-controls">
												<button class="decrease" onclick="decreasePeople()">-</button>
												<span class="people-count" id="peopleCount">2</span>
												<button class="increase" onclick="increasePeople()">+</button>
											</div>
											<h6>유아 및 아동도 인원수에 포함해주세요.</h6>
										</div>
									</div>

									<div class="btn-searchright">
										<button type="button" onclick="submitSearchForm()">
											<span> 검색 </span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="eventsection">
			<div>
				<p>이벤트</p>
			</div>
			<div class="btn_sectionpage prev">
				<button class="prev">&lt;</button>
			</div>
			<div class="sectionpage">
				<div class="slides">
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
					<div class="event list">
						<img src="img/eventlist.jpg" />
					</div>
				</div>
			</div>
			<div class="btn_sectionpage next">
				<button class="next">&gt;</button>
			</div>
			<div class="dots">
				<span class="dot active"></span> <span class="dot"></span> <span
					class="dot"></span>
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

		<script
			src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
		<script src="js/kakaoMapApi.js"></script>
		<script src="js/script.js"></script>
		<script src="js/search/search.js"></script>

	</div>
</body>
</html>
