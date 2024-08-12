<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="stylesheet" href="css/style.css" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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
					<button onclick="location.href='/signupMain'">로그인/회원가입</button>
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
					<form action="/usersignup" method="post" class="signupcontent" id="signupForm">
						<div class="name signinfo">
							<h4>이름</h4>
							<input type="text" name="userName" placeholder="이름을 입력해주세요.">
						</div>

						<div class="email signinfo">
							<h4>이메일</h4>
							<input type="email" name="userEmail" placeholder="최소 8자 이상">
						</div>

						<div class="pw signinfo">
							<h4>비밀번호</h4>
							<input type="password" name="userPw"
								placeholder="8자 이상 비밀번호를 입력해주세요.">
						</div>
						<div class="pw signinfo">
							<h4>비밀번호 확인</h4>
							<input type="password" placeholder="위 비밀번호와 동일한 비밀번호 입력">
						</div>

						<div class="phone_num signinfo">
							<h4>휴대폰 번호</h4>
							<input type="text" name="userPhoneNum" id="phone-input"
								maxlength="13" placeholder="휴대폰 번호를 입력해주세요.">
						</div>

						<div class="user_rsd_reg_num signinfo">
							<h4>주민등록번호</h4>
							<input type="text" name="userRsdRegNum" id="ssn-input"
								maxlength="13" placeholder="주민등록번호를 입력해주세요.">
						</div>

						<div class="addresssigninfo">
							<div class="addresstitle">
								<h4>주소</h4>
							</div>
							<div class="addressbox">
								<input type="text" id="postcode" name="userPostalCode" placeholder="우편번호" readonly>
								<button type="button" onclick="execDaumPostcode()">우편번호
									찾기</button>
								<div></div>
							</div>
							<div class="addressinput">
								<input type="text" id="address" name="userAddr" placeholder="주소"
									readonly> <input type="text" id="detailAddress" name="userAddrLine"
									placeholder="상세주소">
							</div>
						</div>

						<div class="gendersigninfo">
							<h4>성별</h4>
							<div class="gender">
								<input type="radio" id="female" name="gender"> 여자 <input
									type="radio" id="male" name="gender"> 남자
							</div>
						</div>
						<div class="nicknamesigninfo">
							<h4>닉네임</h4>
							<div class="namecheck">
								<input type="text" name="userNickname" placeholder="닉네임을 입력해주세요"
									class="nickname">
								<button type="button" onclick="location.href='/usersignup/isNicknameDuplicate?userNickName=${userNickNmae}'">중복확인</button>
							</div>
							<p id="nicknameMessage" class="display-none"></p>
						</div>

						<input type="hidden" name="userType" value="CUS">

						<button type="submit" class="btn-signup">회원가입</button>
					</form>
				</div>
			</div>
		</div>
		<script src="js/script.js"></script>
	</div>
</body>
</html>