let isAuthenticated = false; // 사용자가 인증되었는지 확인하는 변수

function checkPassword() {
    var password = document.getElementById("password").value;
    var correctPassword = "1234"; // 여기에 실제 비밀번호를 설정하세요.

    if (password === correctPassword) {
        isAuthenticated = true; // 인증 성공
        document.getElementById("password-container").style.display = "none";
        updateUser(); // 비밀번호 입력 후 기본 섹션을 표시합니다.
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

function deleteUser() {
    if (isAuthenticated) {
        hideAllSections();
        document.querySelector(".deleteUser").style.display = "block";
    } else {
        alert("먼저 비밀번호를 입력해주세요.");
    }
}

function updateUser() {
    // 개인정보 변경 화면을 표시하는 함수
    if (isAuthenticated) {
        hideAllSections();
        document.querySelector(".updateUser").style.display = "block";
    } else {
        alert("먼저 비밀번호를 입력해주세요.");
    }
}

function showReviewList() {
    if (isAuthenticated) {
        hideAllSections();
        document.querySelector(".checkReview").style.display = "block";
    } else {
        alert("먼저 비밀번호를 입력해주세요.");
    }
}

function deleteReservation(button) {
    // 버튼이 속한 <tr> 요소를 찾아 삭제하는 함수
    var row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

function deleteReview(button) {
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

function hideAllSections() {
    document.querySelector(".updateUser").style.display = "none";
    document.querySelector(".checkReservation").style.display = "none";
    document.querySelector(".checkReview").style.display = "none";
    document.querySelector(".deleteUser").style.display = "none";
}
