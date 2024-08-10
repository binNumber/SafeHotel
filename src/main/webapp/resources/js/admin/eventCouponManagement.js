document.addEventListener("DOMContentLoaded", function() {
	const eventCouponRegistrationSection = document.getElementById('eventCouponRegistration');
	const eventCouponListSection = document.getElementById('eventCouponList');

	// 모든 섹션 숨기기
	function hideAllSections() {
		eventCouponRegistrationSection.style.display = 'none';
		eventCouponListSection.style.display = 'none';
	}

	// 특정 섹션 표시
	function showSection(sectionId) {
		hideAllSections();
		if (sectionId === 'eventCouponRegistration') {
			eventCouponRegistrationSection.style.display = 'block';
		} else if (sectionId === 'eventCouponList') {
			eventCouponListSection.style.display = 'block';
		}
	}

	// 전역 함수로 노출
	window.showSection = showSection;
});

// 이벤트/쿠폰 등록
function addEventCoupon() {
	// 서버에 이벤트/쿠폰 등록 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
	alert('이벤트/쿠폰이 등록되었습니다.');
}

// 이벤트/쿠폰 삭제
function deleteEventCoupon(button) {
	const row = button.closest('tr');
	const eventName = row.querySelector('td:nth-child(1)').textContent;

	if (confirm(`${eventName}을(를) 삭제하시겠습니까?`)) {
		// 서버에 이벤트/쿠폰 삭제 요청 보내기 (AJAX 요청 또는 폼 제출 방식으로 처리 가능)
		alert(`${eventName}이(가) 삭제되었습니다.`);
		row.remove(); // 테이블에서 행 제거
	}
}
