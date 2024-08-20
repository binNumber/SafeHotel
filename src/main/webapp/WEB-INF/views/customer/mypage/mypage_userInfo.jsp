<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 MY PAGE</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="/css/customer/mypage_userInfo.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/customer/alertMsg.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="/img/icon1.png" /></a>
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
				<div class="nav-top-right" id="success-login">
					<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
					<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="mypage-sidebar">
				<ul>
					<li class="backgorundColor-gray"><a href="/mypage/userInfo">회원정보 변경<i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/checkReservation/confirmed">예약 내역 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/review">내가 쓴 리뷰 <i class="fa-solid fa-chevron-right"></i></a></li>
					<li><a href="/mypage/useableCoupon">쿠폰함 <i class="fa-solid fa-chevron-right"></i></a></li>
				</ul>
			</div>
			<div class="userinfo-content">
				<div id="userinfo-container">
					<h1>회원정보 확인 및 변경</h1>
					<form action="/mypage/ModifyuserInfo" method="post" class="modifycontent" id="modifyForm">
						<div class="email modifyinfo">
							<h4>이메일</h4>
							<input type="email" value="${user.userEmail}" disabled>
						</div>
						
						<div class="name modifyinfo">
							<h4>이름</h4>
							<input type="text" value="${user.userName}" disabled>
						</div>
						
						<div class="nicknamemodifyinfo">
							<h4>닉네임</h4>
							<input type="text" name="userNickname" value="${user.userNickname}"
									class="nickname">
							<button type="button" class="check-btn" id="btn_checkDupId">중복확인</button>
							<p id="nicknameMessage" class="errormsg"></p>
							<p id="nicknameError" class="errormsg color-red"></p>
						</div>

						<div class="pw modifyinfo">
							<h4>비밀번호</h4>
							<input type="password" name="userPw"
								placeholder="8자 이상 비밀번호를 입력해주세요.">
								<p id="pwError" class="errormsg color-red"></p>
						</div>
						<div class="pw modifyinfo">
							<h4>비밀번호 확인</h4>
							<input type="password" name="userPwCheck" placeholder="위 비밀번호와 동일한 비밀번호 입력">
							<p id="pwCheckError" class="errormsg color-red"></p>
							<p id="phoneNumError" class="errormsg color-red"></p>
						</div>

						<div class="phone_num modifyinfo">
							<h4>휴대폰 번호</h4>
							<input type="text" name="userPhoneNum" id="phone-input"
								maxlength="13" value="${user.userPhoneNum}">
						</div>

						<div class="address modifyinfo">
							<div class="addresstitle">
								<h4>주소</h4>
							</div>
							<div class="addressbox">
								<input type="text" id="postcode" name="userPostalCode" value="${user.userPostalCode}" readonly>
								<button type="button" class="check-btn" onclick="execDaumPostcode()">우편번호
									찾기</button>
								<div></div>
							</div>
							<div class="addressinput">
								<input type="text" id="address" name="userAddr" value="${user.userAddr}" readonly>
									<input type="text" id="detailAddress" name="userAddrLine"
										<c:choose>
        									<c:when test="${not empty user.userAddrLine}">
        										value="${user.userAddrLine}"
											</c:when>
        									<c:otherwise>
												placeholder="상세주소"
											</c:otherwise>
										</c:choose>
									>
							</div>
							<p id="addressError" class="errormsg color-red"></p>
						</div>

						<button type="submit" class="btn-modify">수정하기</button>
					</form>
				</div>
				<br/><br/>
				<hr/>
				<br/><br/>
				
				<div id="deleteUser">
					<p>더 이상 이용을 원치 않으신가요?<a href="/userDeactivation?userCode=${user.userCode }">회원 탈퇴 <i class="fa-solid fa-chevron-right"></i></a></p>
				</div>
			</div>
		</div>
	</div>
	
	<script src="/js/customer/customer_mypage_userInfo.js" async></script>
</body>
</html>
