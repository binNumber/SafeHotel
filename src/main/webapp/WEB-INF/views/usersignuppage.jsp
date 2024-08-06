<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
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
				<div class="signlogo">
					<span class="strikethrough"></span> <span class="signlogotext">여기가자
						회원가입</span>
				</div>
				<div class="loginbox">
					<form>
						<div class="signupcontent">
							<div class="name signinfo">
								<h4>이름</h4>
								<input type="text" placeholder="이름을 입력해주세요.">
							</div>
							
							<div class="email signinfo">
								<h4>이메일</h4>
								<input type="email" placeholder="최소 8자 이상">
							</div>
							
							<div class="pw signinfo">
								<h4>비밀번호</h4>
								<input type="password" placeholder="8자 이상 비밀번호를 입력해주세요.">
							</div>
							<div class="pw signinfo">
								<h4>비밀번호 확인</h4>
								<input type="password" placeholder="위 비밀번호와 동일한 비밀번호 입력">
							</div>
							<div class="gendersigninfo">
								<h4>성별</h4>
								<div class="gender">
								<input type="radio"> 여자
								<input type="radio"> 남자
								</div>
							</div>
							<div class="name signinfo">
								<h4>닉네임</h4>
								<input type="text" placeholder="닉네임을 입력해주세요">
							</div>
							<button onclick="location.href='/usersignuppage'">다음</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>