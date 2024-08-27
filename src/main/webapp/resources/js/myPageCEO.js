let isAuthenticated = false; // 사용자가 인증되었는지 확인하는 변수

function checkPassword() {
	var password = document.getElementById("password").value;
	var correctPassword = "1234"; // 여기에 실제 비밀번호를 설정하세요.

	if (password === correctPassword) {
		isAuthenticated = true; // 인증 성공
		document.getElementById("password-container").style.display = "none";
		updateCEO(); // 비밀번호 입력 후 기본 섹션을 표시합니다.
	} else {
		alert("비밀번호가 올바르지 않습니다.");
	}
}

function showReservation() {
	// 예약내역을 표시하는 함수
	if (isAuthenticated) {
		hideAllSections();
		document.querySelector(".checkReservation").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function deleteUserCEO() {
	if (isAuthenticated) {
		hideAllSections();
		document.querySelector(".deleteUserCEO").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function updateCEO() {
	// 회원 정보 변경 화면을 표시하는 함수
	if (isAuthenticated) {
		hideAllSections();
		document.querySelector(".updateCEO").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function showPlaceList() {
	if (isAuthenticated) {
		hideAllSections();
		document.querySelector(".updatePlace .placeList").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function showPlaceListDetail(placeName) {
	if (isAuthenticated) {
		document.querySelector(".placeListDetail h2").innerText = placeName + " 상세 정보";
		hideAllSections();
		document.querySelector(".updatePlace .placeListDetail").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function showReviewList() {
	if (isAuthenticated) {
		hideAllSections();
		document.querySelector(".checkReview .reviewList").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function showReviewListDetail(placeName) {
	if (isAuthenticated) {
		document.querySelector(".reviewListDetail h2").innerText = placeName + " 리뷰";
		hideAllSections();
		document.querySelector(".checkReview .reviewListDetail").style.display = "block";
	} else {
		alert("먼저 비밀번호를 입력해주세요.");
	}
}

function deleteReservation(button) {
	// 버튼이 속한 <tr> 요소를 찾아 삭제하는 함수
	var row = button.parentNode.parentNode;
	row.parentNode.removeChild(row);
}

function checkDeleteUser(event) {
	event.preventDefault(); // 폼의 기본 제출 동작을 막음

	var enteredPassword = document.getElementById("deletePassword").value;
	var correctPassword = "1234"; // 여기에 실제 비밀번호를 설정하세요.

	if (enteredPassword === correctPassword) {
		var userConfirmed = confirm("정말 탈퇴하시겠습니까?");
		if (userConfirmed) {
			document.getElementById("deleteForm").submit(); // 확인되면 폼 제출
		} else {
			alert("탈퇴가 취소되었습니다."); // 취소 시 메시지 표시 (선택 사항)
		}
	} else {
		alert("비밀번호가 올바르지 않습니다.");
	}
}

function reviewReport() {
	window.open("/review/report", "리뷰신고", "width=400, height=375, top=10, left=10");
}

function hideAllSections() {
	document.querySelector(".updateCEO").style.display = "none";
	document.querySelector(".checkReservation").style.display = "none";
	document.querySelector(".updatePlace .placeList").style.display = "none";
	document.querySelector(".updatePlace .placeListDetail").style.display = "none";
	document.querySelector(".checkReview .reviewList").style.display = "none";
	document.querySelector(".checkReview .reviewListDetail").style.display = "none";
	document.querySelector(".deleteUserCEO").style.display = "none";
}
