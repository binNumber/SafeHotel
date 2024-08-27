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

//리뷰 작성 관련 스크립트
document.addEventListener("DOMContentLoaded", function() {
	const cancelIcon = document.querySelector("#icon-cancel");

	// 리뷰 작성&수정 팝업 닫기
	if (cancelIcon) {
		cancelIcon.addEventListener("click", () => {
			document.querySelector("#write-review-popup").classList.add("display-none");
		});
	}
});

//리뷰 작성 팝업 오픈 스크립트
function writeReviewBtn(rsvtCode, acmCode, acmName, userCode, roomCode) {
	document.querySelector("#write-review-popup").classList.remove("display-none");

	console.log("Reservation Code: " + rsvtCode);
	console.log("Academy Code: " + acmCode);
	console.log("Academy Name: " + acmName);
	console.log("User Code: " + userCode);
	console.log("Room Code: " + roomCode);

	document.getElementById('rsvtCode').value = rsvtCode;
	document.getElementById('userCode').value = userCode;
	document.getElementById('acmCode').value = acmCode;
	document.getElementById('roomCode').value = roomCode;
	document.getElementById('review-acm-name').value = acmName;
}


//업로드할 리뷰 이미지 처리 스크립트
document.getElementById('fileInput').addEventListener('change', handleFileSelect);

function handleFileSelect(event) {
	var fileInput = event.target;
	if (fileInput.files.length > 0) {

		const files = fileInput.files;
		const previewContainer = document.getElementById('review-img-preview');

		if (previewContainer) {

			previewContainer.style.height = '200px';

			previewContainer.innerHTML = '';

			for (let i = 0; i < files.length; i++) {

				const file = files[i];

				const reader = new FileReader();

				reader.onload = function(e) {
					const img = document.createElement('img');
					img.src = e.target.result;
					img.classList.add('preview-image');
					previewContainer.appendChild(img);
				};

				reader.readAsDataURL(file);
			}
		}
	}
}

//리뷰 평점관련 처리
//평점 마우스오버 했을 때
function mouseoverStar(count) {
	const star = document.querySelectorAll('.star');

	for (var i = 0; i < count; i++) {
		star[i].classList.add('color-gold');
	}
}

//평점 클릭했을 때
let clickStar = false;

function rating(count) {

	const star = document.querySelectorAll('.star');
	star.forEach(star => star.classList.remove('color-gold'));

	for (var i = 0; i < count; i++) {
		star[i].classList.add('color-gold');
	}

	clickStar = true;
	console.log(count + '번 별 클릭되었습니다.');

	const ratingVlaue = document.getElementById('rating');
	ratingVlaue.value = count;
	console.log(ratingVlaue.value);
}

//평점 마우스아웃 했을 때
function mouseoutStar(count) {

	//클릭 상태가 아닐 때만 적용
	if (!clickStar) {
		const star = document.querySelectorAll('.star');

		for (var i = 0; i < count; i++) {
			star[i].classList.remove('color-gold');
		}
	}
}