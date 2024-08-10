// 숙소 등록 승인
function approveAccommodation(button) {
    const row = button.closest('tr');
    const accommodationName = row.querySelector('td:nth-child(2)').textContent;

    if (confirm(`${accommodationName}을(를) 승인하시겠습니까?`)) {
        // 서버에 승인 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
        alert(`${accommodationName}이(가) 승인되었습니다.`);
        row.remove(); // 테이블에서 행 제거
    }
}

// 숙소 등록 거절
function rejectAccommodation(button) {
    const row = button.closest('tr');
    const accommodationName = row.querySelector('td:nth-child(2)').textContent;

    if (confirm(`${accommodationName}을(를) 거절하시겠습니까?`)) {
        // 서버에 거절 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
        alert(`${accommodationName}이(가) 거절되었습니다.`);
        row.remove(); // 테이블에서 행 제거
    }
}
