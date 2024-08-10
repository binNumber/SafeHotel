// 유저 삭제
function deleteUser(button) {
    const row = button.closest('tr');
    const userName = row.querySelector('td:nth-child(2)').textContent;

    if (confirm(`${userName} 유저를 삭제하시겠습니까?`)) {
        // 서버에 유저 삭제 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
        alert(`${userName} 유저가 삭제되었습니다.`);
        row.remove(); // 테이블에서 행 제거
    }
}
