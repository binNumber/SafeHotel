<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />

</head>
<body>
	<div class="container-roominfo">
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
					<a href="/">여기가자</a>
				</div>
				<div class="nav-top-right" id="success-login">
					<c:if test="${empty user}">
						<button onclick="location.href='/usersign'">로그인/회원가입</button>
					</c:if>

					<c:if test="${not empty user}">
						<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
						<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>

		<div class="sticky-nav" id="sticky-nav">
			<ul>
				<li><a href="#section1">개요</a></li>
				<li><a href="#section2">지도</a></li>
				<li><a href="#section3">객실선택</a></li>
				<li><a href="#section4">리뷰</a></li>
			</ul>
		</div>
		<div class="content-roominfo">
			<div id="section1">
				<div class="content-info">
					<div class="content-mainphoto">
						<div class="mainphoto">사진1</div>

						<div class="subphoto">
							<div class="photosection">
								<div class="photo2">사진2</div>
								<div class="photo3">사진3</div>
							</div>

							<div class="photosection">
								<div class="photo4">사진4</div>
								<div class="photo5">
									사진5
									<div class="btn-photo">
										<button>사진 모두보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section2">
				<div class=content-roominfo-main>
					<div class="roominfo-top">
						<div class="roominfo-title">
							<h1>숙소명</h1>
						</div>
					</div>
				</div>
				<div class="roominfo-top-position">
					<h3>숙소주소</h3>
				</div>
				<div class="roominfo-top-map">
					<p>지도
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section3">
				<div class=content-roominfo-list>
					<div>
						<h1>객실 선택</h1>
					</div>
					<div class=content-roominfo-listsection>
						<div class="listsection-photo">
							<p>객실 대표사진</p>
							<button>더보기</button>
						</div>
						<div class="listsection-main">
							<div class="listmain-title">
								<h1>객실명</h1>
							</div>
							<div class="listmain-content">
								<div class="listmain-time">
									<h6>입실시간</h6>
									<h6>퇴실시간</h6>
								</div>
								<div class="listmain-remainder">
									<h3>가격</h3>
									<button>예약하기</button>
								</div>
							</div>
							<div class="listsection-roominfo">
								<div class="listsection-roominfo-text">
									<h6>객실정보</h6>
									<h6>기준2인/최대2인</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section4">
				<div class="content-roominfo-review">
					<div class="review-section">
						<div class="review-section-title">
							<h1>리뷰</h1>
							<h3>평점 x.x점</h3>
						</div>
						<div class="review-section-main">
							<div class="review-section-left">
								<div class="review-section-left-userinfo">
									<div class="userinfo-nickname">
										<p>닉네임</p>
									</div>
									<div class="userinfo-review">
										<h5>리뷰</h5>
										<h5>·</h5>
										<h5>사진</h5>
									</div>
								</div>
							</div>
							<div class="review-section-right">
								<div class="review-right-score">
									<p>(0/5)</p>
									<p>리뷰 남긴 날짜</p>
								</div>
								<div class="review-right-photo">

									<div class="btn_reviewpage prev">
										<button class="prev">&lt;</button>
									</div>
									<div class="reviewsection-slides">
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진1</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진2</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진3</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진4</div>
									</div>
									<div class="btn_reviewpage next">
										<button class="next">&gt;</button>
									</div>
								</div>

								<div class="reviewsection-roominfo">
									<h4>이용한 객실명</h4>
								</div>

								<div class="reviewsection-msg">
									<p class="review-message" id="review-text">리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다.</p>
									<button class="toggle-button" id="toggle-button"
										style="display: none;">더 보기 ▾</button>
								</div>

								<div class="reviewsection-adminmsg">
									<div class="adminmsg-date">
										<h4>업체명/</h4>
										<h5>답글남긴 날짜,시간</h5>
									</div>
									<div class="adminmsg-msg">
										<h5>업체가 남긴 답글</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="sectionline"></div>
				</div>
			</div>
			<script src="js/script.js"></script>
		</div>
	</div>
</body>
</html>