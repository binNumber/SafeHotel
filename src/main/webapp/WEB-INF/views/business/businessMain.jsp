<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여기 가자 비즈니스</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/business/businessCommon.css" />
<link rel="stylesheet" href="css/business/businessNavbar.css" />
<link rel="stylesheet" href="css/business/businessMain.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">

</head>
<body>
		<div class="container container_backSize">
			<nav
				class="navbar navbar-expand-lg bg-body-tertiary nav_top mb-1 shadow-lg rounded">
				<div class="container-fluid">
					<a class="navbar-brand div_logo" href="businessMain">여기 가자 비즈니스</a>
					<div class="collapse navbar-collapse justify-content-end"
						id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 유저 프로필 </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/businessMyPage">내 정보</a></li>
									<li><a class="dropdown-item" href="#">로그아웃</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="container-size">
				<div class="flex-shrink-0 p-3 bg-white shadow-lg rounded side_bar">
					<ul class="list-unstyled ps-0">
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#home-collapse"
								aria-expanded="true">사업장</button>
							<div class="collapse show" id="home-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#" class="link-dark rounded">사업장 등록</a></li>
									<li><a href="#" class="link-dark rounded">사업장 정보 수정</a></li>
									<li><a href="#" class="link-dark rounded">사업장 삭제</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
								aria-expanded="false">예약 현황</button>
							<div class="collapse" id="dashboard-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#" class="link-dark rounded">대기 예약 조회</a></li>
									<li><a href="#" class="link-dark rounded">예약 관리</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#orders-collapse"
								aria-expanded="false">리뷰</button>
							<div class="collapse" id="orders-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#" class="link-dark rounded">사업장 리뷰 조회</a></li>
									<li><a href="#" class="link-dark rounded">나의 리뷰 보기</a></li>
									<li><a href="#" class="link-dark rounded">리뷰 관리</a></li>
								</ul>
							</div>
						</li>
						<li class="border-top my-3"></li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#account-collapse"
								aria-expanded="false">통계</button>
							<div class="collapse" id="account-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#" class="link-dark rounded">개선 구현 시 구현</a></li>
									<li><a href="#" class="link-dark rounded">개선 구현 시 구현</a></li>
									<li><a href="#" class="link-dark rounded">개선 구현 시 구현</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>

				<!-- 본문 -->
				<div class="container_main shadow-lg rounded">
					<div class="contents_main shadow rounded bold-effect">
						<h3 class="mt-3 ms-3">예약 승인 대기 목록</h3><br/>
						<ul class="list-group">
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								예약 승인 대기 목록 동적으로 가져와야함 <span class="badge text-bg-primary rounded-pill">14</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								예약 승인 대기 목록 동적으로 가져와야함 <span
								class="badge text-bg-primary rounded-pill">2</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								예약 승인 대기 목록 동적으로 가져와야함 <span
								class="badge text-bg-primary rounded-pill">1</span>
							</li>
						</ul>
					</div>

					<div class="contents_main shadow rounded bold-effect">
						<h3 class="mt-3 ms-3">내 사업장 리뷰 목록</h3><br/>
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<span class="mb-1">리뷰 내용 축약</span>
									<small>3 days ago</small>
								</div>
								<p class="mb-1">사업장명</p>
							</a> 
							<a href="#" class="list-group-item list-group-item-action">
								<div class="d-flex w-100 justify-content-between">
									<span class="mb-1">리뷰 내용 축약</span>
									<small class="text-body-secondary">3 days ago</small>
								</div>
								<p class="mb-1">사업장명</p>
							</a>
						</div>
					</div>
					
					<div class="division-line"></div>

					<div class="chart-div ms-3">
						<canvas id="pieChartCanvas" width="400px" height="300px"></canvas>
					</div>
					
					<div class="contents_main shadow rounded">
						<h3 class="mt-3 ms-3">내 사업장 목록</h3><br/>
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								aria-current="true">
								<div class="d-flex w-100 justify-content-between">
									<span class="mb-1">사업장명 1</span>
								</div>
							</a> 
							<a href="#" class="list-group-item list-group-item-action">
								<div class="d-flex w-100 justify-content-between">
									<span class="mb-1">사업장명 2</span>
								</div>
							</a>
						</div>
					</div>
					
					
				</div>
			</div>


		</div>


		<div class="footer"></div>

	<script src="js/business/businessMain.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</body>
</html>
