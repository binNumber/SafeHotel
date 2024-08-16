//카테고리 사이드바 관련 스크립트
document.addEventListener("DOMContentLoaded", function() {
	// 사이드바 열기 버튼 클릭 이벤트
	const iconBtn = document.getElementById("icon-btn");
	if (iconBtn) {
		iconBtn.addEventListener("click", function(event) {
			event.preventDefault(); // 기본 링크 동작을 막기 위해
			var sidebar = document.getElementById("sidebar");
			if (sidebar) {
				sidebar.classList.toggle("show");
			}
		});
	}

	// 사이드바 닫기 버튼 클릭 이벤트
	const closeBtn = document.getElementById("close-btn");
	if (closeBtn) {
		closeBtn.addEventListener("click", function() {
			var sidebar = document.getElementById("sidebar");
			if (sidebar) {
				sidebar.classList.remove("show");
			}
		});
	}

	// 카테고리 클릭 이벤트
	const categories = document.querySelectorAll(".category");
	if (categories.length) {
		categories.forEach(function(category) {
			category.addEventListener("click", function(event) {
				event.preventDefault(); // 기본 링크 동작 방지

				var targetId = this.getAttribute("data-target");
				var targetElement = document.getElementById(targetId);
				var subcategories = targetElement?.querySelectorAll("li") || [];
				var delay = 100; // 각 하위 카테고리 표시 간격 (밀리초)

				// 모든 하위 카테고리 숨기기
				document.querySelectorAll(".subcategories").forEach(function(sub) {
					sub.style.maxHeight = null;
					sub.classList.remove("show");
					sub.querySelectorAll("li").forEach(function(item) {
						item.style.opacity = 0;
					});
				});

				// 클릭한 카테고리의 하위 카테고리만 보여주기
				if (targetElement && !targetElement.classList.contains("show")) {
					targetElement.classList.add("show");
					targetElement.style.maxHeight = targetElement.scrollHeight + "px"; // 실제 높이 설정

					// 순차적으로 하위 카테고리 표시
					subcategories.forEach(function(subcategory, index) {
						setTimeout(function() {
							subcategory.style.opacity = 1;
							subcategory.style.transition = "opacity 0.5s ease-in";
						}, delay * index);
					});
				}
			});
		});
	}
});

// 리뷰 예약자 정보 수정 관련 스크립트
document.addEventListener("DOMContentLoaded", function() {
	const modifybtn = document.querySelector("#modify-reservation-popup-btn");
	const cancelIcon = document.querySelector("#icon-cancel");

	// 수정 팝업 열기
	if (modifybtn) {

		modifybtn.addEventListener("click", () => {
			document.querySelector("#modify-reservation-popup").classList.remove("display-none");
		});
	}

	// 수정 팝업 닫기
	if (cancelIcon) {
		cancelIcon.addEventListener("click", () => {
			document.querySelector("#modify-reservation-popup").classList.add("display-none");
		});
	}


	//페이지 뒤로가기
	const backbtn = document.querySelector('.fa-arrow-left');

	if (backbtn) {
		backbtn.addEventListener("click", () => {
			window.history.back(); // 이전 페이지로 돌아가기
		});
	}
});