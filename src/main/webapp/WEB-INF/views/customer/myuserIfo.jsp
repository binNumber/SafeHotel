<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유저 MY PAGE</title>
    <link href="/css/myPageUser.css" rel="stylesheet" type="text/css">
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
        <div class="sidebar">
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
                <p>비밀번호를 입력해주세요</p>
                <input type="password" id="password">
                <button onclick="checkPassword()" class="btn">확인</button>
            </div>
            <div class="updateUser">
                <h2>개인 정보 변경</h2>
                <p>아이디 : <input type="text" placeholder="기존값"></p>
                <p>비밀번호 : <input type="password"></p>
                <p>이름 : <input type="text" placeholder="기존값"></p>
                <p>전화번호 : <input type="text" placeholder="01000008888"></p>
                <p>이메일 : <input type="text" placeholder="example@example.com"></p>
                <button type="submit" class="btn">수정하기</button>
            </div>
            <div class="checkReservation">
                <h2>예약내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>숙소 이름</th>
                            <th>체크인 날짜</th>
                            <th>체크아웃 날짜</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>호텔 A</td>
                            <td>2024-08-01</td>
                            <td>2024-08-03</td>
                            <td><button class="btn deleteBtn" onclick="deleteReservation(this)">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="checkReview">
                <h2>내가 작성한 리뷰</h2>
                <table>
                    <thead>
                        <tr>
                            <th>리뷰 번호</th>
                            <th>숙소 이름</th>
                            <th>별점</th>
                            <th>리뷰 내용</th>
                            <th>작성 날짜</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>호텔 A</td>
                            <td>★★★★★</td>
                            <td>정말 좋은 숙소였어요~!</td>
                            <td>2024-08-01</td>
                            <td><button class="btn deleteBtn" onclick="deleteReview(this)">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="deleteUser">
                <h2>회원 탈퇴</h2>
                <form id="deleteForm" action="/delete-account" method="post">
                    <p>비밀번호 : <input type="password" name="deletePassword" id="deletePassword"></p>
                    <button type="submit" onclick="checkDeleteUser(event)" class="btn">탈퇴하기</button>
                </form>
            </div>
        </div>
    </div>
    <script src="/js/myPageUser.js"></script>
</body>
</html>
