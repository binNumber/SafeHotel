<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
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
			<div class="signmain">
				<div class="signmaingtext">
					<span>여기가자</span>
				</div>
				<div class="signlogo">
					<span class="strikethrough"></span>
					<span class="signlogotext">로그인/회원가입</span>
				</div>
				<div class="signuplist">
				
					<div class="sociallogin naver">
						<button>
							<img src="img/naver.png" alt="네이버로 로그인하기">
							네이버로 로그인하기
						</button>
					</div>
					
					<div class="sociallogin kakao">
						<button>
							<img src="img/kakaotalk.png" alt="카카오톡으로 로그인하기">
							카카오톡으로 로그인하기
						</button>
					</div>

					<div class="sociallogin google">
						<button>
							<img src="img/google.png" alt="구글로 로그인하기">
							구글로 로그인하기
						</button>
					</div>
					
					<div class="sociallogin email">
						<button>
							<img src="img/email.png" alt="구글로 로그인하기">
							이메일로 로그인하기
						</button>
					</div>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>
