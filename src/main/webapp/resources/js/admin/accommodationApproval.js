// 숙소 등록 승인
function approveAccommodation(button) {
    const row = button.closest('tr');
    const accommodationName = row.querySelector('td:nth-child(2)').textContent;
    const acmCode = row.querySelector('input[name="acmCode"]').value;

    if (confirm(`${accommodationName}을(를) 승인하시겠습니까?`)) {
        $.ajax({
            url: '/adminpage/accommodationApproval/approve',
            method: 'POST',
            data: { acmCode: acmCode },
            success: function(response) {
                alert(`${accommodationName}이(가) 승인되었습니다.`);
                row.remove(); // 테이블에서 행 제거
            },
            error: function(error) {
                alert('승인 처리 중 오류가 발생했습니다.');
            }
        });
    }
}

// 숙소 등록 거절
function rejectAccommodation(button) {
    const row = button.closest('tr');
    const accommodationName = row.querySelector('td:nth-child(2)').textContent;
    const acmCode = row.querySelector('input[name="acmCode"]').value;

    if (confirm(`${accommodationName}을(를) 거절하시겠습니까?`)) {
        $.ajax({
            url: '/adminpage/accommodationApproval/reject',
            method: 'POST',
            data: { acmCode: acmCode },
            success: function(response) {
                alert(`${accommodationName}이(가) 거절되었습니다.`);
                row.remove(); // 테이블에서 행 제거
            },
            error: function(error) {
                alert('거절 처리 중 오류가 발생했습니다.');
            }
        });
    }
}