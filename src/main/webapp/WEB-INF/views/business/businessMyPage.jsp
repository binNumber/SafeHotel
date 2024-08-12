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
								<li><a class="dropdown-item" href="/businessMyPage">내 정보</a></li>
								<li><a class="dropdown-item" href="#">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>




		<div class="shadow-lg rounded container container-mypage-size mt-2 py-3 px-3">
			<div class="d-flex flex-row justify-content-around px-4 py-4 mt-5 mb-3">
				<div class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">개인 정보</div>
				<div class="d-flex flex-column w-75">
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">이름</p> </div>
						<input type="text" id="input_Name" class="w-40 h-35" readonly>
						<div class="w-25">
							<input type="button" id="btn_updateName" class="btn btn-sm btn-outline-primary d-none" onclick="btnUpdate()" value="확인"/>
							<input type="button" id="btn_changeName" class="btn btn-sm btn-outline-secondary" onclick="btnChangeName()" value="변경" />
						</div>
						
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">전화번호</p> </div>
						<input type="text" id="input_Phone" class="w-40 h-35" readonly>
						<div class="w-25">
							<input type="button" id="btn_updatePhone" class="btn btn-sm btn-outline-primary d-none" onclick="btnUpdate()" value="확인"/>
							<input type="button" id="btn_changePhone" class="btn btn-sm btn-outline-secondary" onclick="btnChangePhone()" value="변경" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100"> 
						<div class="w-25"> <p class="w-30 h-25 text-start">주소</p> </div>
						<input type="text" class="w-40 h-35" readonly>
						<div class="w-25">
							<input type="button" id="btn_updateName" class="btn btn-sm btn-outline-primary d-none" onclick="btnUpdate()" value="확인"/>
							<input type="button" id="btn_changeName" class="btn btn-sm btn-outline-secondary" onclick="btnChangeName()" value="변경" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="division-line"></div>

			<div class="d-flex flex-row justify-content-around px-4 py-4 mt-5 mb-3">
				<div class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">계정 정보</div>
				<div class="d-flex flex-column w-75">
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">닉네임</p> </div>
						<input type="text" class="w-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="h-25 text-start">이메일</p> </div>
						<input type="text" class="vw-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">비밀번호</p> </div>
						<input type="text" class="w-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>
				</div>
			</div>
			
			<div class="division-line"></div>

			<div class="d-flex flex-row justify-content-around px-4 py-4 mt-5 mb-3">
				<div class="fw-bold fs-4 d-flex justify-content-center align-items-start w-25">사업자 정보</div>
				<div class="d-flex flex-column w-75">
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="h-25 text-start">사업자명</p> </div>
						<input type="text" class="vw-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">사업자 대표 번호</p> </div>
						<input type="text" class="w-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>
					<div class="d-flex flex-row align-items-center justify-content-evenly w-100">
						<div class="w-25"> <p class="w-30 h-25 text-start">사업장 주소</p> </div>
						<input type="text" class="w-40 h-35" readonly>
						<button type="button" class="btn btn-sm btn-outline-secondary">변경</button>
					</div>					
				</div>
			</div>			
			
		</div>
	</div>

	<div class="footer"></div>

	<script src="js/business/businessMyPage.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
