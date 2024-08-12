// 리뷰 신고 처리 (1 -> 2)
function handleReviewReport(button) {
    const row = button.closest('tr');
    const reviewCode = row.querySelector('td:nth-child(1)').textContent;

    if (confirm(`리뷰 번호 ${reviewCode}의 신고를 처리하시겠습니까?`)) {
        // AJAX 요청으로 서버에 신고 처리 요청 보내기 (1 -> 2)
        fetch('/adminpage/reviewReportManagement/process', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `reviewCode=${reviewCode}`,
        })
        .then(response => {
            if (response.ok) {
                alert(`리뷰 번호 ${reviewCode}의 신고가 처리되었습니다.`);
                row.remove(); // 테이블에서 행 제거
            } else {
                alert(`리뷰 번호 ${reviewCode}의 신고 처리에 실패하였습니다.`);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('신고 처리 중 오류가 발생했습니다.');
        });
    }
}

// 리뷰 신고 상태 되돌리기 (1 -> 0)
function revertReviewReport(button) {
    const row = button.closest('tr');
    const reviewCode = row.querySelector('td:nth-child(1)').textContent;

    if (confirm(`리뷰 번호 ${reviewCode}의 신고를 취소하시겠습니까?`)) {
        // AJAX 요청으로 서버에 상태 되돌리기 요청 보내기 (1 -> 0)
        fetch('/adminpage/reviewReportManagement/revert', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `reviewCode=${reviewCode}`,
        })
        .then(response => {
            if (response.ok) {
                alert(`리뷰 번호 ${reviewCode}의 신고가 취소되었습니다.`);
                row.remove(); // 테이블에서 행 제거
            } else {
                alert(`리뷰 번호 ${reviewCode}의 신고 취소에 실패하였습니다.`);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('신고 취소 중 오류가 발생했습니다.');
        });
    }
}
