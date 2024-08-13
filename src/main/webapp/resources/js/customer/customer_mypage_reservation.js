//mypage-reservation 리뷰 작성 팝업 스크립트
document.addEventListener("DOMContentLoaded", function() {
	// 슬라이드 쇼 관련 변수 및 함수 설정
	let currentSlide = 0;
	const slides = document.querySelectorAll(".slides .event.list");
	const slidesContainer = document.querySelector(".slides");
	const totalSlides = Math.ceil(slides.length / 3); // 총 슬라이드 수
	let interval;

	// 슬라이드 위치 업데이트
	const updateSlides = () => {
		const slideWidth = slides[0]?.clientWidth || 0; // 한 개 슬라이드의 너비
		const gap = 20; // 슬라이드 간격
		const offset = -(slideWidth + gap) * currentSlide * 3; // 슬라이드 이동 거리 계산
		if (slidesContainer) {
			slidesContainer.style.transform = `translateX(${offset}px)`;
		}
		dots.forEach((dot, index) => {
			dot.classList.toggle("active", index === currentSlide);
		});
	};

	// 다음 슬라이드로 이동
	const nextSlide = () => {
		currentSlide = (currentSlide + 1) % totalSlides;
		updateSlides();
	};

	// 이전 슬라이드로 이동
	const prevSlide = () => {
		currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
		updateSlides();
	};

	// 버튼 클릭 이벤트
	const nextButton = document.querySelector(".btn_sectionpage.next button");
	const prevButton = document.querySelector(".btn_sectionpage.prev button");

	if (nextButton) {
		nextButton.addEventListener("click", nextSlide);
	}

	if (prevButton) {
		prevButton.addEventListener("click", prevSlide);
	}
});

//리뷰 작성&수정 관련 스크립트
document.addEventListener("DOMContentLoaded", function() {
	const reviewbtn = document.querySelectorAll(".write-review-popup-btn");
	const cancelIcon = document.querySelector("#icon-cancel");

	// 리뷰 작성 팝업 열기
	if (reviewbtn) {

		reviewbtn.forEach(btn => {
			btn.addEventListener("click", () => {
				document.querySelector("#write-review-popup").classList.remove("display-none");
				//
			});
		});
	}

	// 리뷰 작성&수정 팝업 닫기
	if (cancelIcon) {
		cancelIcon.addEventListener("click", () => {
			document.querySelector("#write-review-popup").classList.add("display-none");
		});
	}
});
