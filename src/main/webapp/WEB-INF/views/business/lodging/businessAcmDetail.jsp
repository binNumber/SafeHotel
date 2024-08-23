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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/business/businessAcmDetail.css">
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
			<div class="container_main overflow-y-auto shadow-lg rounded flex-column flex-nowrap justify-content-start align-items-start px-5 py-5">
				<span class="px-5 fs-4 h-auto">사업장 상세 정보 관리</span>
				<div class="d-flex flex-row justify-content-start flex-wrap px-4 py-4 mt-1 mb-1 w-100">
					<div class="d-flex flex-column w-100">
						<div class="d-flex flex-column align-items-center justify-content-evenly w-100">
							<form class="w-100">
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlIntro" class="form-label w-25">숙소 소개</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlIntro" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlIntro()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlIntro" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlIntro('${acmDetail.acmDtlIntroduction}')" value="변경" />
											
										</div>
									</div>
									<textarea class="form-control w-90 " id="input_acmDtlIntro" rows="3" readonly>${acmDetail.acmDtlIntroduction}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlNotice" class="form-label w-25">공지사항</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlNotice" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlNotice()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlNotice" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlNotice('${acmDetail.acmDtlNotice}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlNotice" rows="3" readonly>${acmDetail.acmDtlNotice}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlInfo" class="form-label w-25">기본정보</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlInfo" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlInfo()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlInfo" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlInfo('${acmDetail.acmDtlInfo}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlInfo" rows="3" readonly>${acmDetail.acmDtlInfo}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlUsageGuide" class="form-label w-25">숙소 이용 안내</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlUsageGuide" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlUsageGuide()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlUsageGuide" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlUsageGuide('${acmDetail.acmDtlUsageGuide}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlUsageGuide" rows="3" readonly>${acmDetail.acmDtlUsageGuide}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlAddPersonnel" class="form-label w-25">인원 추가 정보</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlAddPersonnel" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlAddPersonnel()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlAddPersonnel" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlAddPersonnel('${acmDetail.acmDtlAddPersonnel}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlAddPersonnel" rows="3" readonly>${acmDetail.acmDtlAddPersonnel}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlRoomInfo" class="form-label w-25">객실 정보</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlRoomInfo" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlRoomInfo()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlRoomInfo" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlRoomInfo('${acmDetail.acmDtlRoomInfo}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlRoomInfo" rows="3" readonly>${acmDetail.acmDtlRoomInfo}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlFacilities" class="form-label w-25">부대 시설 정보</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlFacilities" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlFacilities()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlFacilities" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlFacilities('${acmDetail.acmDtlFacilities}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlFacilities" rows="3" readonly>${acmDetail.acmDtlFacilities}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlParking" class="form-label w-25">주차장 안내</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlParking" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlParking()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlParking" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlParking('${acmDetail.acmDtlParking}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlParking" rows="3" readonly>${acmDetail.acmDtlParking}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlTransport" class="form-label w-25">대중교통 정보</label>
										<div class="w-75 d-flex justify-content-end">
<%-- 											<input type="button" id="btn_updateAcmDtlTransport" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlTransport(${acmDetail.acmCode})" value="확인" /> --%>
											<input type="button" id="btn_updateAcmDtlTransport" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdate('btn_updateAcmDtlTransport', 'input_acmDtlTransport', 'btn_changeAcmDtlTransport', 'acm_dtl_transport', ${acmDetail.acmCode})" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlTransport" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlTransport(escapeHtml(${acmDetail.acmDtlTransport}))" value="변경" />
<%-- 											<input type="button" id="btn_changeAcmDtlTransport" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlTransport('${acmDetail.acmDtlTransport}')" value="변경" /> --%>
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlTransport" rows="3" readonly>${acmDetail.acmDtlTransport}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlBenefit" class="form-label w-25">이용 혜택</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlBenefit" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlBenefit()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlBenefit" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlBenefit('${acmDetail.acmDtlBenefit}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlBenefit" rows="3" readonly>${acmDetail.acmDtlBenefit}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlSurroundingInfo" class="form-label w-25">주변 정보</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlSurroundingInfo" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlSurroundingInfo()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlSurroundingInfo" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlSurroundingInfo('${acmDetail.acmDtlSurroundingInfo}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlSurroundingInfo" rows="3" readonly>${acmDetail.acmDtlSurroundingInfo}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlGuide" class="form-label w-25">추가 안내사항</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlGuide" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlGuide()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlGuide" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlGuide('${acmDetail.acmDtlGuide}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlGuide" rows="3" readonly>${acmDetail.acmDtlGuide}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlPolicy" class="form-label w-25">취소 및 환불 규정</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlPolicy" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlPolicy()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlPolicy" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlPolicy('${acmDetail.acmDtlPolicy}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlPolicy" rows="3" readonly>${acmDetail.acmDtlPolicy}</textarea>
								</div>
								<div class="mb-3 w-100">
									<div class="w-100 d-flex flex-row">
										<label for="input_acmDtlEtc" class="form-label w-25">확인 사항 및 기타</label>
										<div class="w-75 d-flex justify-content-end">
											<input type="button" id="btn_updateAcmDtlEtc" class="btn m-1 btn-sm btn-outline-primary d-none" onclick="btnUpdateAcmDtlEtc()" value="확인" /> 
											<input type="button" id="btn_changeAcmDtlEtc" class="btn m-1 btn-sm btn-outline-secondary" onclick="btnChangeAcmDtlEtc('${acmDetail.acmDtlEtc}')" value="변경" />
										</div>
									</div>
								  <textarea class="form-control w-90" id="input_acmDtlEtc" rows="3" readonly>${acmDetail.acmDtlEtc}</textarea>
								</div>								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/business/businessAcmDetail.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
