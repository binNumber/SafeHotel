<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userSignUpPage</title>
<link rel="stylesheet" href="css/style.css" />
<script src="/js/customer/alertMsg.js"></script>
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
								<li><a href="#" class="category" data-target="subcategory1">카테고리 1</a>
									<ul class="subcategories" id="subcategory1">
										<li><a href="#">하위 카테고리 1-1</a></li>
										<li><a href="#">하위 카테고리 1-2</a></li>
										<li><a href="#">하위 카테고리 1-3</a></li>
									</ul>
								</li>
								<li><a href="#" class="category" data-target="subcategory2">카테고리 2</a>
									<ul class="subcategories" id="subcategory2">
										<li><a href="#">하위 카테고리 2-1</a></li>
										<li><a href="#">하위 카테고리 2-2</a></li>
										<li><a href="#">하위 카테고리 2-3</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="nav-top-center">
					<a href="/">여기가자</a>
				</div>
				<div class="nav-top-right">
					<button onclick="location.href='/signupMain'">로그인/회원가입</button>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="signmain">
				<div class="signlogo">
					<span class="strikethrough"></span> <span class="signlogotext">비즈니스 회원가입</span>
				</div>
				<div class="loginbox">
					<div class="signupcontent">
						<div>
							<h2>약관동의 안내</h2>
						</div>

						<div class="accept-all">
							<label> <input type="checkbox" id="accept-all"> <span>약관 전체동의</span> <span class="accepttext">선택항목 포함</span></label>
						</div>
						<div class="acceptitem">
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox" data-required="true"> <span>(필수) 이용약관</span></label>
							</div>
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox" data-required="true"> <span>(필수) 만 14세 이상 확인</span></label>
							</div>
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox" data-required="true"> <span>(필수) 개인정보 수집 및 이용 동의</span></label>
							</div>
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox"> <span>(선택) 개인정보 수집 및 이용 동의</span></label>
							</div>
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox"> <span>(선택) 마케팅 알림 수신 동의</span></label>
							</div>
							<div class="accept">
								<label> <input type="checkbox" class="accept-checkbox"> <span>(선택) 위치기반 서비스 이용약관 동의</span></label>
							</div>
						</div>
						<button id="next-btn">
							<h5>다음</h5>
						</button>
					</div>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>