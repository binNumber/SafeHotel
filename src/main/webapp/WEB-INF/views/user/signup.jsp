<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<button>로그인/회원가입</button>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="signmain">
				<div class="signlogo">
					<p>여기가자</p>
				</div>

				<div>
					<p>로그인/회원가입</p>
				</div>

				<div class="signuplist">
					<div class="naver sociallogin">
						<p>네이버로 로그인하기</p>
					</div>

					<div class="kakao sociallogin">
						<p>카카오톡으로 로그인하기</p>
					</div>

					<div class="google sociallogin">
						<p>구글로 로그인하기</p>
					</div>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>

</body>
</html>