<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<a href="/main">여기가자</a>
				</div>
				<div class="nav-top-right">
					<button onclick="location.href='/sign'">로그인/회원가입</button>
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
					<button>🔍 지역이나 숙소를 검색해보세요</button>
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
				<span class="dot active"></span>
				<span class="dot"></span>
				<span class="dot"></span>
			</div>
		</div>

		<div class="footer"></div>

		<script src="js/script.js"></script>
	</div>
</body>
</html>
