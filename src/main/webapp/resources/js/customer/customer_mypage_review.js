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

//mypage-review 리뷰 이미지 슬라이드 스크립트
/*document.addEventListener("DOMContentLoaded", function() {
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
*/

//이미지 슬라이드 슬릭
$(document).ready(function() {
	$('.img-slide').slick({
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 3,
		arrows: true
	});
});


//mypage-review 리뷰 수정 팝업 열고 닫는 스크립트
$(document).ready(function() {

	$('.write-review-popup-btn').click(function() {
		console.log('버튼 눌림');

		var reviewCode = $(this).data('review-code');
		console.log(reviewCode);

		$.ajax({
			url: '/mypage/mypage/review',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({ reviewCode: reviewCode }),
			success: function(review) {
				$('#acm_name').text(review.acmName);
				$('#reviewText').val(review.reviewText);
				$('input[name="reviewCode"]').val(review.reviewCode);
				$('#reviewDate').text(review.reviewDate);

				var starsHtml = '';
				for (var i = 0; i < 5; i++) {
					if (i < review.rating) {
						starsHtml += '<span class="color-gold">&#9733;</span>';
					} else {
						starsHtml += '<span>&#9733;</span>';
					}
				}
				$('#reviewRating').html(starsHtml);

				var imgSlide = $('#review-img');
				imgSlide.empty();

				review.reviewImgList.forEach(function(img) {
					var imgHtml = '<div class="review preview-image">' +
						'<img src="' + img.reviewImgUrl + '/' +
						img.reviewImgSaveName + img.reviewImgExtension + '" />' +
						'<button type="button" class="delete-img">사진 삭제 </button>' +
						'</div>';
					imgSlide.append(imgHtml);
				});

				$('#write-review-popup').removeClass('display-none');
			},
			error: function(xhr, status, error) {
				console.error('AJAX Error: ', {
					status: status,
					error: error,
					responseText: xhr.responseText
				});
			}
		});

	});

	//리뷰 수정 팝업 닫기
	$('#icon-cancel').click(function() {
		$('#write-review-popup').addClass('display-none');
	});

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