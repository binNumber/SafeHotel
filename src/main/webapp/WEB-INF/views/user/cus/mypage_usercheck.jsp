<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유저 MY PAGE</title>
    <link href="../../css/myPageUser.css" rel="stylesheet" type="text/css">
    <!-- <style>
        @import url('https://fonts.googleapis.com/css2?family=Dongle&family=East+Sea+Dokdo&family=Nanum+Pen+Script&display=swap');
    </style> -->
</head>
<body onload="hideAllSections()">
    <div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="../../img/icon1.png" /></a>
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
				<div class="nav-top-right" id="success-login">
					<button id="mypage-btn" onclick="location.href='/user/mypageUser'">${user.userNickname}</button>
					<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
				</div>
			</div>
		</div>
    <div class="main">
        <div class="mypage-sidebar">
            <ul>
                <li><a href="#" onclick="updateUser()">개인정보변경</a></li>
                <li><a href="#" onclick="showReservation()">예약내역확인</a></li>
                <li><a href="#" onclick="showReviewList()">리뷰확인</a></li>
                <li><a href="#" onclick="deleteUser()">회원탈퇴</a></li>
            </ul>
        </div>
        <div class="content">
            <div id="password-container">
                <h1>유저 MY PAGE</h1>
                <input type="password" id="password" placeholder="비밀번호를 입력해주세요">
                <button onclick="checkPassword()" class="btn">확인</button>
            </div>
    	</div>
   	</div>
    <script src="/js/myPageUser.js"></script>
</body>
</html>
