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
							data-bs-toggle="dropdown" aria-expanded="false">${user.userNickname}</a>
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
		
			<!-- side bar -->
			<div class="flex-shrink-0 p-3 bg-white shadow-lg rounded side_bar">
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#business-collapse"
							aria-expanded="false">사업장</button>
						<div class="collapse" id="business-collapse">
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
							aria-expanded="true">사용자 정보</button>
						<div class="collapse show" id="user-collapse">
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
			<div class="shadow-lg rounded container container-mypage-size mt-1 py-3 px-3">
				<div class="d-flex flex-row justify-content-around px-4 py-4 mt-1 mb-1">
					<div class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">
					개인 정보</div>
					<div class="d-flex flex-column w-75">
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">이름</p>
							</div>
							<input type="text" id="input_Name" value="${user.userName}" class="w-40 h-35" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateName"
									class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdateName(${user.userCode})" value="확인" /> <input type="button"
									id="btn_changeName" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeName('${user.userName}')" value="변경" />
							</div>

						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">전화번호</p>
							</div>
							<input type="text" id="input_Phone" class="w-40 h-35" value="${user.userPhoneNum}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updatePhone"
									class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changePhone" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangePhone()" value="변경" />
							</div>
						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">주소</p>
							</div>
							<input type="text" id="input_addr" class="w-40 h-35" value="${user.userAddr}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateAddr" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changeAddr" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeAddr()" value="변경" />
							</div>
						</div>
					</div>
				</div>

				<div class="division-line"></div>

				<div
					class="d-flex flex-row justify-content-around px-4 py-4 mt-5 mb-3">
					<div
						class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">계정
						정보</div>
					<div class="d-flex flex-column w-75">
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">닉네임</p>
							</div>
							<input type="text" id="input_nickName" class="w-40 h-35" value="${user.userNickname}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateNickName" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changeNickName" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeNickName()" value="변경" />
							</div>
						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="h-25 text-start">이메일</p>
							</div>
							<input type="text" id="input_email" class="w-40 h-35" value="${user.userEmail}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateEmail" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changeEmail" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeEmail()" value="변경" />
							</div>
						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">비밀번호</p>
							</div>
							<input type="password" id="input_password" class="w-40 h-35" readonly>
							<div class="w-25">
								<input type="button" id="btn_updatePassword" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changePassword" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangePassword()" value="변경" />
							</div>
						</div>
					</div>
				</div>

				<div class="division-line"></div>

				<div
					class="d-flex flex-row justify-content-around px-4 py-4 mt-5 mb-3">
					<div
						class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">사업자
						정보</div>
					<div class="d-flex flex-column w-75">
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="h-25 text-start">사업자명</p>
							</div>
							<input type="text" id="input_businessName" class="w-40 h-35" value="${business.bsnsOwnerName}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateBusinessName" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changeBusinessName" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeBusinessName()" value="변경" />
							</div>
						</div>
						<div
							class="d-flex flex-row align-items-center justify-content-evenly w-100">
							<div class="w-25">
								<p class="w-30 h-25 text-start">사업자 번호</p>
							</div>
							<input type="text" id="input_businessNumber" class="w-40 h-35" value="${business.bsnsCode}" readonly>
							<div class="w-25">
								<input type="button" id="btn_updateBusinessNumber" class="btn btn-sm btn-outline-primary d-none"
									onclick="btnUpdate()" value="확인" /> <input type="button"
									id="btn_changeBusinessNumber" class="btn btn-sm btn-outline-secondary"
									onclick="btnChangeBusinessNumber()" value="변경" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="js/business/businessMyPage.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
