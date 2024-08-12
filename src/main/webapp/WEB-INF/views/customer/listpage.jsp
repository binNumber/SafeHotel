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
	<div class="container-list">
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

		<div class="content">
			<div class="content-top-search">
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
							<img src='img/calendar.png' /> <span> 08.15 목 - 08.16 금
								(1박 2일) </span>
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
			<div class="content-top">
				<div class="content-top-text">
					<h2>'(검색어)'숙소 (개수)개</h2>
				</div>
			</div>
			<div class="content-main">
				<div class="content-main-roomlist">
					<div class="roomlist">
						<div class="roomthumbnail">
							<div class="roomphoto">
								<p><a href="roominfo">숙소 대표사진</a></p>
							</div>
							<div class="roominfo">
								<div class="roominfo-title">
									<h2><a href="roominfo">숙소명</a></h2>
									<h5><a href="roominfo">()시</a></h5>
								</div>
								<div class="roominfo-price">
									<h5><a href="roominfo">(쿠폰사용전금액)원</a></h5>
									<h3><a href="roominfo">(쿠폰적용금액)원</a></h3>
								</div>
							</div>
						</div>
						<div class="sectionline"></div>
					</div>
				</div>
			</div>

		</div>
		<script src="js/script.js"></script>
	</div>

</body>
</html>