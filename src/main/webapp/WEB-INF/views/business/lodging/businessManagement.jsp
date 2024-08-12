<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사업자 내 정보 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/business/businessCommon.css">
<link rel="stylesheet" href="css/business/businessNavbar.css" />
<link rel="stylesheet" href="css/business/businessSidebar.css" />
<link rel="stylesheet" href="css/business/businessMyPage.css">
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
								<li><a class="dropdown-item" href="/businessMyPage">내
										정보</a></li>
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
							data-bs-toggle="collapse" data-bs-target="#business-collapse"
							aria-expanded="true">사업장</button>
						<div class="collapse show" id="business-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/businessRegister" class="link-dark rounded">사업장
										등록</a></li>
								<li><a href="/businessManagement" class="link-dark rounded">사업장
										관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#reservation-collapse"
							aria-expanded="false">예약 현황</button>
						<div class="collapse" id="reservation-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/businessWaitingReservation"
									class="link-dark rounded">예약 조회</a></li>
								<li><a href="/businessReservationManagement"
									class="link-dark rounded">예약 관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#review-collapse"
							aria-expanded="false">리뷰</button>
						<div class="collapse" id="review-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/review" class="link-dark rounded">사업장 리뷰
										조회</a></li>
								<li><a href="/reviewManagement" class="link-dark rounded">리뷰
										관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#user-collapse"
							aria-expanded="false">사용자 정보</button>
						<div class="collapse" id="user-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/businessMyPage" class="link-dark rounded">내
										정보 관리</a></li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#statistics-collapse"
							aria-expanded="false">통계</button>
						<div class="collapse" id="statistics-collapse">
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
			<form>
				<div class="container_main shadow-lg rounded">

					<div
						class="d-flex flex-row justify-content-around px-4 py-4 mt-1 mb-1 w-100">
						<div
							class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">사업장 관리</div>
						<div class="d-flex flex-column w-75 py-5">
							<div
								class="d-flex flex-row align-items-center justify-content-evenly w-100">
								<div class="w-25">
									<p class="w-30 h-25 text-start">숙소 타입</p>
								</div>
								<div class="w-50">
									<select class="form-select" id="select_acmType"
										aria-label="Default select example">
										<option disabled hidden="true" selected>숙소 타입을
											설정해주세요.</option>
										<option value="HOT">호텔</option>
										<option value="MOT">모텔</option>
										<option value="PEN">펜션</option>
										<option value="RES">리조트</option>
										<option value="CAM">캠핑</option>
										<option value="GTH">게스트하우스</option>
										<option value="VIL">홈/빌라</option>
									</select>
								</div>
							</div>
							<div
								class="d-flex flex-row align-items-center justify-content-evenly w-100">
								<div class="w-25">
									<p class="w-30 h-25 text-start">숙소명</p>
								</div>
								<div class="w-50">
									<input type="text" id="input_acmName" class="w-40 h-35"
										readonly>
								</div>
							</div>
							<div
								class="d-flex flex-row align-items-center justify-content-evenly w-100">
								<div class="w-25">
									<p class="w-30 h-25 text-start">사업자 번호</p>
								</div>
								<div class="w-50">
									<input type="text" id="input_acmPhone" class="w-40 h-35"
										readonly>
								</div>
							</div>
							<div
								class="d-flex flex-row align-items-center justify-content-evenly w-100">
								<div class="w-25">
									<p class="w-30 h-25 text-start">숙소 전화번호</p>
								</div>
								<div class="w-50">
									<input type="text" id="input_acmName" class="w-40 h-35"
										readonly>
								</div>
							</div>
							<div class="row w-100 justify-content-center px-4">
								<button type="submit"
									class="float-right mt-4 w-25 btn  btn-outline-secondary">확인</button>
							</div>

						</div>
					</div>
				</div>
			</form>

		</div>
	</div>

	<script src="js/business/businessMyPage.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
