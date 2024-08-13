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
		backbtn.addEventListener("click", ()=> {
			window.history.back(); // 이전 페이지로 돌아가기
		});
	}
});