// 리뷰 신고 처리
function handleReviewReport(button) {
    const row = button.closest('tr');
    const reviewId = row.querySelector('td:nth-child(1)').textContent;

    if (confirm(`리뷰 번호 ${reviewId}의 신고를 처리하시겠습니까?`)) {
        // 서버에 신고 처리 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
        alert(`리뷰 번호 ${reviewId}의 신고가 처리되었습니다.`);
        row.remove(); // 테이블에서 행 제거
    }
}
