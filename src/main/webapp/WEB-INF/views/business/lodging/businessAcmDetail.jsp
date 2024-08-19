<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사업장 상세 정보 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/businessCommon.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/businessNavbar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/businessSidebar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/businessMyPage.css">
</head>
<body>
	<div class="container container_backSize">
		<nav class="navbar navbar-expand-lg bg-body-tertiary nav_top mb-1 shadow-lg rounded">
			<div class="container-fluid">
				<a class="navbar-brand div_logo" href="/businessMain">여기 가자 비즈니스</a>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> ${user.userNickname} </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/businessMyPage">내 정보</a></li>
								<li><a class="dropdown-item" href="/businessLogout">로그아웃</a></li>
							</ul>
						</li>
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
								<li><a href="/businessRegister" class="link-dark rounded">사업장 등록</a></li>
								<li><a href="/businessManagement" class="link-dark rounded">사업장 관리</a></li>
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
			<div class="container_main shadow-lg rounded flex-column justify-content-start align-items-start px-5 py-5">
				<span class="px-5 fs-4 h-auto">사업장 상세 정보 관리</span>
				<div class="d-flex flex-row justify-content-start flex-wrap px-4 py-4 mt-1 mb-1 w-100">
					<div class="d-flex flex-column w-100">
						<div class="d-flex flex-column align-items-center justify-content-evenly w-100">
							<ul class="list-group list-group-horizontal w-100">
								<li class="list-group-item w-25">사업자 번호</li>
								<li class="list-group-item w-50">업소명</li>
								<li class="list-group-item w-25">업소 타입</li>
								<li class="list-group-item w-25">업소 등록일</li>
							</ul>
<%-- 							<a href="/businessManagement/AcmDetail/${accm.acmCode}" class="text-decoration-none w-100">  --%>
<%-- 								<c:forEach var="accm" items="${accmList}"> --%>
<!-- 									<ul class="list-group list-group-horizontal w-100"> -->
<%-- 										<li class="list-group-item w-25">${accm.bsnsCode}</li> --%>
<%-- 										<li class="list-group-item w-50">${accm.acmName}</li> --%>
<%-- 										<li class="list-group-item w-25">${accm.acmType}</li> --%>
<%-- 										<li class="list-group-item w-25">${accm.acmRegDt}</li> --%>
<!-- 									</ul> -->
<%-- 								</c:forEach> --%>
<!-- 							</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/business/businessMyPage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
