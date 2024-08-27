document.addEventListener("DOMContentLoaded", function() {
	const accommodationApprovalSection = document.querySelector('.accommodationApproval');
	const userManagementSection = document.querySelector('.userManagement');
	const reviewReportManagementSection = document.querySelector('.reviewReportManagement');
	const eventCouponRegistrationSection = document.querySelector('.eventCouponRegistration');
	const eventCouponListSection = document.querySelector('.eventCouponList');
	const submenu = document.getElementById('eventCouponSubmenu');

	// 메뉴 토글 기능
	function toggleEventCouponSubmenu() {
		if (submenu.style.display === 'none' || submenu.style.display === '') {
			submenu.style.display = 'block';
		} else {
			submenu.style.display = 'none';
		}
	}

	// 모든 섹션 숨기기
	function hideAllSections() {
		accommodationApprovalSection.style.display = 'none';
		userManagementSection.style.display = 'none';
		reviewReportManagementSection.style.display = 'none';
		eventCouponRegistrationSection.style.display = 'none';
		eventCouponListSection.style.display = 'none';
	}

	// 특정 섹션 표시
	function showAccommodationApproval() {
		hideAllSections();
		accommodationApprovalSection.style.display = 'block';
	}

	function showUserManagement() {
		hideAllSections();
		userManagementSection.style.display = 'block';
	}

	function showReviewReportManagement() {
		hideAllSections();
		reviewReportManagementSection.style.display = 'block';
	}

	function showEventCouponRegistration() {
		hideAllSections();
		eventCouponRegistrationSection.style.display = 'block';
	}

	function showEventCouponList() {
		hideAllSections();
		eventCouponListSection.style.display = 'block';
	}

	// 페이지 로딩 시 모든 섹션 숨기기
	hideAllSections();

	// 전역 함수로 노출
	window.toggleEventCouponSubmenu = toggleEventCouponSubmenu;
	window.showAccommodationApproval = showAccommodationApproval;
	window.showUserManagement = showUserManagement;
	window.showReviewReportManagement = showReviewReportManagement;
	window.showEventCouponRegistration = showEventCouponRegistration;
	window.showEventCouponList = showEventCouponList;
});
