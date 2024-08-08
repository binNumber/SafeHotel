document.addEventListener('DOMContentLoaded', function() {
	// 슬라이드 쇼 관련 변수 및 함수 설정
	let currentSlide = 0;
	const slides = document.querySelectorAll('.slides .event.list');
	const dots = document.querySelectorAll('.dot');
	const slidesContainer = document.querySelector('.slides');
	const totalSlides = Math.ceil(slides.length / 3); // 총 슬라이드 수
	let interval;

	// 슬라이드 위치 업데이트
	const updateSlides = () => {
		const slideWidth = slides[0]?.clientWidth || 0; // 한 개 슬라이드의 너비
		const gap = 20; // 슬라이드 간격
		const offset = (-(slideWidth + gap) * currentSlide) * 3; // 슬라이드 이동 거리 계산
		if (slidesContainer) {
			slidesContainer.style.transform = `translateX(${offset}px)`;
		}
		dots.forEach((dot, index) => {
			dot.classList.toggle('active', index === currentSlide);
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
	const nextButton = document.querySelector('.btn_sectionpage.next button');
	const prevButton = document.querySelector('.btn_sectionpage.prev button');

	if (nextButton) {
		nextButton.addEventListener('click', nextSlide);
	}

	if (prevButton) {
		prevButton.addEventListener('click', prevSlide);
	}

	// 도트 클릭 이벤트
	if (dots.length) {
		dots.forEach((dot, index) => {
			dot.addEventListener('click', () => {
				currentSlide = index;
				updateSlides();
			});
		});
	}

	// 자동 슬라이드 이동 (10초 간격)
	interval = setInterval(nextSlide, 10000);

	// 슬라이드 자동 이동 일시 중지 및 재개
	const pauseInterval = () => clearInterval(interval);
	const resumeInterval = () => interval = setInterval(nextSlide, 10000);

	const sectionPage = document.querySelector('.sectionpage');
	if (sectionPage) {
		sectionPage.addEventListener('mouseenter', pauseInterval);
		sectionPage.addEventListener('mouseleave', resumeInterval);
	}

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

	// 검색바 열기 버튼 클릭 이벤트
	const searchButton = document.querySelector(".search button");
	if (searchButton) {
		searchButton.addEventListener("click", function() {
			var searchBar = document.getElementById("searchbar");
			if (searchBar) {
				searchBar.classList.add("show");
			}
		});
	}

	// 검색바 닫기 버튼 클릭 이벤트
	const searchCloseBtn = document.getElementById("btn-close");
	if (searchCloseBtn) {
		searchCloseBtn.addEventListener("click", function() {
			var searchBar = document.getElementById("searchbar");
			if (searchBar) {
				searchBar.classList.remove("show");
			}
		});
	}
});
//체크박스 클릭 관련
document.addEventListener('DOMContentLoaded', function() {
	const acceptAll = document.getElementById('accept-all');
	const checkboxes = document.querySelectorAll('.accept-checkbox');
	const nextBtn = document.getElementById('next-btn');

	acceptAll.addEventListener('change', function() {
		checkboxes.forEach(checkbox => {
			checkbox.checked = acceptAll.checked;
		});
	});

	nextBtn.addEventListener('click', function(event) {
		const requiredCheckboxes = document.querySelectorAll('.accept-checkbox[data-required="true"]');
		let allRequiredChecked = true;

		requiredCheckboxes.forEach(checkbox => {
			if (!checkbox.checked) {
				allRequiredChecked = false;
			}
		});

		if (!allRequiredChecked) {
			event.preventDefault();
			alert('(필수) 항목은 필수선택 사항입니다.');
		} else {
			location.href = '/usersignup';
		}
	});
});

//주소창 DaumApi
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById('address').value = data.address;
			document.getElementById('detailAddress').focus();
		}
	}).open();
}

document.addEventListener('DOMContentLoaded', function() {
	const ssnInput = document.getElementById('ssn-input');

	if (ssnInput) {
		// 주민등록번호를 포맷하는 함수
		const formatSSN = (value) => {
			// 숫자가 아닌 문자를 모두 제거
			value = value.replace(/\D/g, '');
			// 6번째 자리 후에 하이픈 추가
			if (value.length > 6) {
				value = value.slice(0, 6) + '-' + value.slice(6, 13);
			}
			return value;
		};

		// 입력할 때마다 포맷 적용
		ssnInput.addEventListener('input', function() {
			const formattedValue = formatSSN(ssnInput.value);
			ssnInput.value = formattedValue;
		});

		// 입력 시 숫자만 허용하고 13자리로 제한
		ssnInput.addEventListener('keydown', function(event) {
			// 백스페이스, 탭, 화살표 키는 허용
			if (event.key === 'Backspace' || event.key === 'Tab' || event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
				return;
			}
			// 숫자가 아닌 문자는 입력을 막음
			if (!/\d/.test(event.key)) {
				event.preventDefault();
			}
		});

		ssnInput.addEventListener('input', function() {
			// 입력 길이를 13자로 제한
			if (ssnInput.value.length > 13) {
				ssnInput.value = ssnInput.value.slice(0, 13);
			}
		});
	}
});

document.addEventListener('DOMContentLoaded', function() {
	const phoneInput = document.getElementById('phone-input');

	if (phoneInput) {
		// 핸드폰 번호를 포맷하는 함수
		const formatPhone = (value) => {
			// 숫자만 남기고 제거
			value = value.replace(/\D/g, '');
			// 포맷 적용
			if (value.length > 10) {
				value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
			} else if (value.length > 6) {
				value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7);
			} else if (value.length > 3) {
				value = value.slice(0, 3) + '-' + value.slice(3);
			}
			return value;
		};

		// 입력할 때마다 포맷 적용
		phoneInput.addEventListener('input', function() {
			const formattedValue = formatPhone(phoneInput.value);
			phoneInput.value = formattedValue;
		});

		// 입력 시 숫자만 허용하고 11자리로 제한
		phoneInput.addEventListener('keydown', function(event) {
			// 백스페이스, 탭, 화살표 키는 허용
			if (event.key === 'Backspace' || event.key === 'Tab' || event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
				return;
			}
			// 숫자가 아닌 문자는 입력을 막음
			if (!/\d/.test(event.key)) {
				event.preventDefault();
			}
		});

		phoneInput.addEventListener('input', function() {
			// 입력 길이를 11자로 제한
			if (phoneInput.value.replace(/\D/g, '').length > 11) {
				phoneInput.value = phoneInput.value.slice(0, 11 + Math.floor((phoneInput.value.length - 11) / 3));
			}
		});
	}
});

//usersingup 페이지에서 사용되는 스크립트

/*//회원가입용 스크립트
$(document).ready(function() {
	$('#signupForm').submit(function(event) {
		event.preventDefault(); // 기본 폼 제출 동작 제한
		var nickname = $('#userNickname').val();

		$.ajax({
			url: '/usersignup/isNicknameAvailable',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(nickname),
			success: function(response) {
				if (response) {
					// 닉네임 사용 가능
					alert('사용가능한 닉네임입니다.');
					$('#signupForm').off('submit').submit(); // 폼 제출
				} else {
					// 닉네임 중복 실패 시 뒤로가기
					alert('이미 사용 중인 닉네임입니다.');
					window.history.back(); // 뒤로가기
				}
			},
			error: function() {
				$('#nicknameMessage').removeClass('display-none')
				$('#nicknameMessage').text('닉네임 중복 확인 오류.');
			}
		});
	});
});*/