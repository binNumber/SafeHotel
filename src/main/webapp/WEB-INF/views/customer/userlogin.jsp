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
					<span class="strikethrough"></span> <span class="signlogotext">이메일로
						시작하기</span>
				</div>
				<div class="loginbox">
					<form action="/userlogin" method="post">
						<div class="id login">
							<h4>이메일</h4>
							<input type="email" name="userEmail" placeholder="이메일을 입력해주세요.">
						</div>

						<div class="pw login">
							<h4>비밀번호</h4>
							<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요.">
						</div>

						<div class="loginfunction">
							<div class="logincheckbox">
								<input type="checkbox" name="checkRememberUser"> 로그인 유지
							</div>
							<div>
								<a href="/findaccount">아이디/비밀번호 찾기</a>
							</div>
						</div>
						
						

						<div class="btn-login">
							<button type="submit">로그인</button>
						</div>

						<div class="loginsignup">
							<h5>여기가자 계정이 없으신가요?</h5>
							<a href="/usersignup">여기가자 회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>