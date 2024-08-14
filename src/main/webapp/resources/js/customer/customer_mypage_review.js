//mypage-review 리뷰 이미지 슬라이드 스크립트
document.addEventListener("DOMContentLoaded", function() {
	// 슬라이드 쇼 관련 변수 및 함수 설정
	let currentSlide = 0;
	const slides = document.querySelectorAll(".review-img-slides .review-event.list");
	const slidesContainer = document.querySelector(".review-img-slides");
	const totalSlides = Math.ceil(slides.length / 2); // 총 슬라이드 수
	let interval;

	// 슬라이드 위치 업데이트
	const updateSlides = () => {
		const slideWidth = slides[0]?.clientWidth || 0; // 한 개 슬라이드의 너비
		const gap = 20; // 슬라이드 간격
		const offset = -(slideWidth + gap) * currentSlide * 2; // 슬라이드 이동 거리 계산
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
	const nextButton = document.querySelector(".review-btn_sectionpage.next button");
	const prevButton = document.querySelector(".review-btn_sectionpage.prev button");

	if (nextButton) {
		nextButton.addEventListener("click", nextSlide);
	}

	if (prevButton) {
		prevButton.addEventListener("click", prevSlide);
	}
});

//글자수 넘친 경우 더보기 활성화+클릭해서 글 더 보여주기
/*document.addEventListener("DOMContentLoaded", function() {
    // 모든 텍스트 박스와 '더보기' 버튼을 선택
    const reviewTextBoxes = document.querySelectorAll(".review-text-box");
    const moreTextButtons = document.querySelectorAll(".more-text");

    // 각 버튼에 대해 처리
    moreTextButtons.forEach(button => {
        // 버튼이 속한 리뷰 텍스트 박스를 찾기
        const textBox = button.previousElementSibling; // .more-text 바로 앞에 있는 요소가 .review-text-box일 경우
        const lineHeight = parseFloat(getComputedStyle(textBox).lineHeight);
        const maxHeight = lineHeight * 2; // 최대 3줄 높이 설정

        // 초기 상태로 '더보기' 버튼 숨김
        button.classList.add("display-none");
        textBox.style.maxHeight = `${maxHeight}px`; // 초기 높이 설정

        // 텍스트의 전체 높이 측정
        const updateButtonVisibility = () => {
            const fullHeight = textBox.scrollHeight;

            if (fullHeight > maxHeight) {
                button.classList.remove("display-none");
            } else {
                button.classList.add("display-none");
            }
        };

        // 버튼 클릭 이벤트
        button.addEventListener("click", function() {
            if (textBox.classList.contains("expanded")) {
                textBox.classList.remove("expanded");
                textBox.style.maxHeight = `${maxHeight}px`;
            } else {
                textBox.classList.add("expanded");
                textBox.style.maxHeight = `${textBox.scrollHeight}px`; // 전체 높이로 확장
				button.classList.add("display-none");
            }
        });

        // 초기 버튼 상태 업데이트
        updateButtonVisibility();
    });
});*/

//mypage-review 리뷰 수정 팝업 열고 닫는 스크립트
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

//mypage-review 리뷰 수정 팝업 이미지 슬라이드 스크립트
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