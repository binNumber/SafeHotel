<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="stylesheet" href="css/style.css" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					<form action="/usersignup" method="post" class="signupcontent"
						id="signupForm">
						<div class="name signinfo">
							<h4>이름</h4>
							<input type="text" name="userName" id="userName"
								placeholder="이름을 입력해주세요.">
							<p id="nameError" class="errormsg color-red"></p>
						</div>

						<c:choose>
							<c:when test="${email == null && empty email }">
								<div class="email signinfo">
									<h4>이메일</h4>
									<input type="email" name="userEmail" id="userEmail"
										placeholder="yeogigaja123@example.com">
									<p id="emailError" class="errormsg color-red"></p>
								</div>
							</c:when>
							<c:otherwise>
								<div class="email signinfo">
									<h4>이메일</h4>
									<input type="email" name="userEmail" id="userEmail"
										value="${email }" readonly>
									<p id="emailError" class="errormsg color-red"></p>
								</div>
							</c:otherwise>
						</c:choose>

						<div class="pw signinfo">
							<h4>비밀번호</h4>
							<input type="password" name="userPw" id="userPw"
								placeholder="영어 대소문자, 숫자, 특수문자 포함 8자~20자">
							<p id="pwError" class="errormsg color-red"></p>
						</div>
						<div class="pw signinfo">
							<h4>비밀번호 확인</h4>
							<input type="password" id="userPwCheck" name="userPwCheck"
								placeholder="비밀번호와 동일하게 입력해주세요.">
							<p id="pwCheckError" class="errormsg color-red"></p>
						</div>

						<div class="phone_num signinfo">
							<h4>휴대폰 번호</h4>
							<input type="text" name="userPhoneNum" id="phone-input"
								maxlength="13" placeholder="휴대폰 번호를 입력해주세요.">
							<p id="phoneNumError" class="errormsg color-red"></p>
						</div>

						<div class="user_rsd_reg_num signinfo">
							<h4>주민등록번호</h4>
							<input type="text" name="userRsdRegNum" id="ssn-input"
								maxlength="13" placeholder="주민등록번호를 입력해주세요.">
							<p id="regNumError" class="errormsg color-red"></p>
						</div>

						<div class="addresssigninfo">
							<div class="addresstitle">
								<h4>주소</h4>
							</div>
							<div class="addressbox">
								<input type="text" id="postcode" name="userPostalCode"
									placeholder="우편번호" readonly>
								<button type="button" class="check-btn"
									onclick="execDaumPostcode()">우편번호 찾기</button>
								<div></div>
							</div>
							<div class="addressinput">
								<input type="text" id="address" name="userAddr" placeholder="주소"
									readonly> <input type="text" id="detailAddress"
									name="userAddrLine" placeholder="상세주소">
							</div>
							<p id="addressError" class="errormsg color-red"></p>
						</div>

						<div class="nicknamesigninfo">
							<h4>닉네임</h4>
							<div class="namecheck">
								<input type="text" name="userNickname" placeholder="닉네임을 입력해주세요"
									class="nickname">
								<button type="button" class="check-btn" id="btn_checkDupId">중복확인</button>
							</div>
							<p id="nicknameMessage" class="errormsg"></p>
							<p id="nicknameError" class="errormsg color-red"></p>
						</div>

						<input type="hidden" name="userType" id="userType" value="CUS">

						<button type="submit" class="btn-signup">회원가입</button>
					</form>
				</div>
			</div>
		</div>
		<script src="js/customer/customer_signup.js" async></script>
	</div>
</body>
</html>