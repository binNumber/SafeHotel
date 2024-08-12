<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
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
					<a href="/">여기가자</a>
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
					<button class="btn-search">🔍 지역이나 숙소를 검색해보세요</button>
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
											<p>검색한 단어1</p>
											<p>검색한 단어2</p>
										</div>
									</div>
									<div class="btn-date">
										<button id="btn_date">
											<img src='img/calendar.png' /> <span> 08.15 목 - 08.16
												금 (1박 2일) </span>
										</button>
										<div class="hide date-picker" id="date_picker">
											<p>날짜 선택</p>
										</div>
									</div>
									<div class="btn-people">
										<button id="btn_people">
											<img src='img/human.png' /> <span> 인원 2 </span>
										</button>
										<div class="hide people-picker" id="people_picker">
											<p>인원</p>
											<div class="people-controls">
												<button class="decrease">-</button>
												<span class="people-count">2</span>
												<button class="increase">+</button>
											</div>
											<h6>유아 및 아동도 인원수에 포함해주세요.</h6>
										</div>
									</div>

									<div class="btn-searchright">
										<button onclick="location.href='/listpage'">
											<span><img> 검색 </span>
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

		<div class="footer"></div>

		<script src="js/script.js"></script>
	</div>
</body>
</html>
