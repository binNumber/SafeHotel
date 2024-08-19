
//addFlashAttribute로 msg를 보낸 경우 alert창으로 출력하기
window.onload = function() {

	var msg = /*[[${msg}]]*/ '';
	if (msg) {
		alert(msg);
	}
}

document.addEventListener("DOMContentLoaded", function() {
	// 슬라이드 쇼 관련 변수 및 함수 설정
	let currentSlide = 0;
	const slides = document.querySelectorAll(".slides .event.list");
	const dots = document.querySelectorAll(".dot");
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

	// 도트 클릭 이벤트
	if (dots.length) {
		dots.forEach((dot, index) => {
			dot.addEventListener("click", () => {
				currentSlide = index;
				updateSlides();
			});
		});
	}

	// 자동 슬라이드 이동 (10초 간격)
	interval = setInterval(nextSlide, 10000);

	// 슬라이드 자동 이동 일시 중지 및 재개
	const pauseInterval = () => clearInterval(interval);
	const resumeInterval = () => (interval = setInterval(nextSlide, 10000));

	const sectionPage = document.querySelector(".sectionpage");
	if (sectionPage) {
		sectionPage.addEventListener("mouseenter", pauseInterval);
		sectionPage.addEventListener("mouseleave", resumeInterval);
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
document.addEventListener("DOMContentLoaded", function() {
	const nextButton = document.getElementById("next-btn");

	nextButton.addEventListener("click", function() {
		const requiredCheckboxes = document.querySelectorAll(
			".accept-checkbox[data-required='true']"
		);
		let allChecked = true;

		requiredCheckboxes.forEach(function(checkbox) {
			if (!checkbox.checked) {
				allChecked = false;
			}
		});

		if (allChecked) {
			if (window.location.pathname.includes("/businesssignup")) {
				window.location.href = "/businesssignuppage";
			} else if (window.location.pathname.includes("/signup-agreement")) {
				window.location.href = "/usersignup";
			}
		} else {
			alert("필수 항목에 모두 동의해주세요.");
		}
	});

	const acceptAllCheckbox = document.getElementById("accept-all");
	acceptAllCheckbox.addEventListener("change", function() {
		const allCheckboxes = document.querySelectorAll(".accept-checkbox");
		allCheckboxes.forEach(function(checkbox) {
			checkbox.checked = acceptAllCheckbox.checked;
		});
	});

	const individualCheckboxes = document.querySelectorAll(".accept-checkbox");
	individualCheckboxes.forEach(function(checkbox) {
		checkbox.addEventListener("change", function() {
			const totalCheckboxes = individualCheckboxes.length;
			const checkedCheckboxes = document.querySelectorAll(
				".accept-checkbox:checked"
			).length;
			acceptAllCheckbox.checked = totalCheckboxes === checkedCheckboxes;
		});
	});
});

//주소창 DaumApi
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			document.getElementById("postcode").value = data.zonecode;
			document.getElementById("address").value = data.address;
			document.getElementById("detailAddress").focus();
		},
	}).open();
}

document.addEventListener("DOMContentLoaded", function() {
	const ssnInput = document.getElementById("ssn-input");

	if (ssnInput) {
		// 주민등록번호를 포맷하는 함수
		const formatSSN = (value) => {
			// 숫자가 아닌 문자를 모두 제거
			value = value.replace(/\D/g, "");
			// 6번째 자리 후에 하이픈 추가
			if (value.length > 6) {
				value = value.slice(0, 6) + "-" + value.slice(6, 13);
			}
			return value;
		};

		// 입력할 때마다 포맷 적용
		ssnInput.addEventListener("input", function() {
			const formattedValue = formatSSN(ssnInput.value);
			ssnInput.value = formattedValue;
		});

		// 입력 시 숫자만 허용하고 13자리로 제한
		ssnInput.addEventListener("keydown", function(event) {
			// 백스페이스, 탭, 화살표 키는 허용
			if (
				event.key === "Backspace" ||
				event.key === "Tab" ||
				event.key === "ArrowLeft" ||
				event.key === "ArrowRight"
			) {
				return;
			}
			// 숫자가 아닌 문자는 입력을 막음
			if (!/\d/.test(event.key)) {
				event.preventDefault();
			}
		});

		ssnInput.addEventListener("input", function() {
			// 입력 길이를 14자로 제한
			if (ssnInput.value.length > 14) {
				ssnInput.value = ssnInput.value.slice(0, 14);
			}
		});
	}
});

document.addEventListener("DOMContentLoaded", function() {
	const phoneInput = document.getElementById("phone-input");

	if (phoneInput) {
		// 핸드폰 번호를 포맷하는 함수
		const formatPhone = (value) => {
			// 숫자만 남기고 제거
			value = value.replace(/\D/g, "");
			// 포맷 적용
			if (value.length > 10) {
				value =
					value.slice(0, 3) +
					"-" +
					value.slice(3, 7) +
					"-" +
					value.slice(7, 11);
			} else if (value.length > 6) {
				value =
					value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7);
			} else if (value.length > 3) {
				value = value.slice(0, 3) + "-" + value.slice(3);
			}
			return value;
		};

		// 입력할 때마다 포맷 적용
		phoneInput.addEventListener("input", function() {
			const formattedValue = formatPhone(phoneInput.value);
			phoneInput.value = formattedValue;
		});

		// 입력 시 숫자만 허용하고 11자리로 제한
		phoneInput.addEventListener("keydown", function(event) {
			// 백스페이스, 탭, 화살표 키는 허용
			if (
				event.key === "Backspace" ||
				event.key === "Tab" ||
				event.key === "ArrowLeft" ||
				event.key === "ArrowRight"
			) {
				return;
			}
			// 숫자가 아닌 문자는 입력을 막음
			if (!/\d/.test(event.key)) {
				event.preventDefault();
			}
		});

		phoneInput.addEventListener("input", function() {
			// 입력 길이를 11자로 제한
			if (phoneInput.value.replace(/\D/g, "").length > 11) {
				phoneInput.value = phoneInput.value.slice(
					0,
					11 + Math.floor((phoneInput.value.length - 11) / 3)
				);
			}
		});
	}
});

//사업자 등록 번호 관련
document.addEventListener("DOMContentLoaded", function() {
	const bizRegNumInput = document.getElementById("biz-reg-num");

	if (bizRegNumInput) {
		// 사업자 등록번호를 포맷하는 함수
		const formatBizRegNum = (value) => {
			// 숫자가 아닌 문자를 모두 제거
			value = value.replace(/\D/g, "");
			// 3번째와 5번째 자리 후에 하이픈 추가
			if (value.length > 3 && value.length <= 5) {
				value = value.slice(0, 3) + "-" + value.slice(3);
			} else if (value.length > 5) {
				value = value.slice(0, 3) + "-" + value.slice(3, 5) + "-" + value.slice(5);
			}
			return value;
		};

		// 입력할 때마다 포맷 적용
		bizRegNumInput.addEventListener("input", function() {
			const formattedValue = formatBizRegNum(bizRegNumInput.value);
			bizRegNumInput.value = formattedValue;
		});

		// 입력 시 숫자만 허용하고 12자리로 제한
		bizRegNumInput.addEventListener("keydown", function(event) {
			// 백스페이스, 탭, 화살표 키는 허용
			if (
				event.key === "Backspace" ||
				event.key === "Tab" ||
				event.key === "ArrowLeft" ||
				event.key === "ArrowRight"
			) {
				return;
			}
			// 숫자가 아닌 문자는 입력을 막음
			if (!/[0-9]/.test(event.key)) {
				event.preventDefault();
			}
		});
	}
});

/*---------------------------main페이지-------------------------*/
document.addEventListener("DOMContentLoaded", function() {
	// 기본 인원수 설정
	const peopleCount = document.querySelector('#people_picker .people-count');
	peopleCount.textContent = '2';
	updatePeopleButton();

	// .input-search input 클릭 이벤트
	document.querySelector('.input-search input').addEventListener('click', function(event) {
		closeAllHiddenSections();
		document.getElementById('search_best').classList.toggle('show');
		event.stopPropagation();
	});


	// #btn_people 클릭 이벤트
	document.querySelector('#btn_people').addEventListener('click', function(event) {
		closeAllHiddenSections();
		document.getElementById('people_picker').classList.toggle('show');
		event.stopPropagation();
	});

	// 다른 곳 클릭 시 숨겨진 요소 닫기
	document.addEventListener('click', function(event) {
		closeAllHiddenSections();
	});

	// 요소 내부 클릭 시 숨겨진 요소 닫히지 않게 하기
	document.querySelector('#search_best').addEventListener('click', function(event) {
		event.stopPropagation();
	});

	document.querySelector('#people_picker').addEventListener('click', function(event) {
		event.stopPropagation();
	});

	// 인원 수 조절 버튼 이벤트
	const decreaseButton = document.querySelector('#people_picker .decrease');
	const increaseButton = document.querySelector('#people_picker .increase');

	decreaseButton.addEventListener('click', function() {
		let count = parseInt(peopleCount.textContent);
		if (count > 1) {
			peopleCount.textContent = count - 1;
			updatePeopleButton();
		}
	});

	increaseButton.addEventListener('click', function() {
		let count = parseInt(peopleCount.textContent);
		peopleCount.textContent = count + 1;
		updatePeopleButton();
	});

	function updatePeopleButton() {
		const btnPeopleSpan = document.querySelector('#btn_people span');
		btnPeopleSpan.textContent = `인원 ${peopleCount.textContent}`;
	}

	function closeAllHiddenSections() {
		document.getElementById('search_best').classList.remove('show');
		document.getElementById('people_picker').classList.remove('show');
	}
});

//상세페이지 stiky nav bar
window.onscroll = function() { scrollFunction() };

function scrollFunction() {
	var stickyNav = document.getElementById("sticky-nav");
	if (document.body.scrollTop > 10 || document.documentElement.scrollTop > 10) {
		stickyNav.classList.add("show");
	} else {
		stickyNav.classList.remove("show");
	}
}

document.addEventListener("DOMContentLoaded", function() {
	const stickyNav = document.getElementById("sticky-nav");
	const navItems = document.querySelectorAll('.sticky-nav ul li a');
	const sections = document.querySelectorAll('#section1, #section2, #section3, #section4, #section5');

	const updateActiveNavItem = () => {
		let currentSection = "";

		sections.forEach(section => {
			const sectionTop = section.getBoundingClientRect().top;
			const stickyNavHeight = stickyNav.offsetHeight + 150; // sticky-nav 아래 150px 추가

			// 현재 스크롤 위치가 섹션의 상단을 지나고, 섹션의 하단보다 위에 있을 때
			if (sectionTop <= stickyNavHeight && sectionTop + section.offsetHeight > stickyNavHeight) {
				currentSection = section.getAttribute('id');
			}
		});

		// 모든 navItems에서 active 클래스를 제거
		navItems.forEach(item => {
			item.parentElement.classList.remove('active');
			// 현재 섹션에 해당하는 메뉴 항목에 active 클래스 추가
			if (item.getAttribute('href').substring(1) === currentSection) {
				item.parentElement.classList.add('active');
			}
		});
	};

	window.addEventListener('scroll', updateActiveNavItem);
	updateActiveNavItem(); // 초기 로드 시 호출

	navItems.forEach(item => {
		item.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 링크 이동을 막음

			const targetId = this.getAttribute('href').substring(1);
			const targetElement = document.getElementById(targetId);

			if (targetElement) {
				const stickyNavHeight = stickyNav.offsetHeight + 150; // sticky-nav 높이 + 150px
				const targetPosition = targetElement.offsetTop - stickyNavHeight;

				window.scrollTo({
					top: targetPosition,
					behavior: 'smooth'
				});

				// active 클래스 추가
				navItems.forEach(nav => nav.parentElement.classList.remove('active'));
				this.parentElement.classList.add('active');
			}
		});
	});
});

//상페이지 리뷰영역 사진 슬라이드
document.addEventListener("DOMContentLoaded", function() {
	let currentSlide = 0;
	const slides = document.querySelectorAll(".reviewsection-photo");
	const totalSlides = slides.length;

	function updateSlides() {
		const slideWidth = slides[0].clientWidth + 20; // 슬라이드의 너비 + 간격
		const offset = -(slideWidth * currentSlide);
		document.querySelector(".reviewsection-slides").style.transform = `translateX(${offset}px)`;
	}

	document.querySelector(".btn_reviewpage.next").addEventListener("click", function() {
		if (currentSlide < totalSlides - 3) { // 화면에 보여질 슬라이드 수를 고려하여 설정
			currentSlide++;
			updateSlides();
		}
	});

	document.querySelector(".btn_reviewpage.prev").addEventListener("click", function() {
		if (currentSlide > 0) {
			currentSlide--;
			updateSlides();
		}
	});

	// 초기 슬라이드 설정
	updateSlides();
});

document.addEventListener("DOMContentLoaded", function() {
	const reviewText = document.getElementById("review-text");
	const toggleButton = document.getElementById("toggle-button");

	function checkOverflow(element) {
		return element.scrollHeight > element.clientHeight;
	}

	if (checkOverflow(reviewText)) {
		toggleButton.style.display = "block";
	}

	toggleButton.addEventListener("click", function() {
		if (reviewText.classList.contains("expanded")) {
			reviewText.classList.remove("expanded");
			toggleButton.textContent = "더 보기 ▾";
		} else {
			reviewText.classList.add("expanded");
			toggleButton.textContent = "숨기기 ▴";
		}
	});
});

//상세정보 창 사진 모두보기버튼
document.addEventListener("DOMContentLoaded", function() {
	const openModalBtn = document.getElementById("openModalBtn");
	const closeModalBtn = document.getElementById("closeModalBtn");
	const modal = document.getElementById("photoModal");
	const largeImage = document.getElementById("largeImage");
	const thumbnails = document.querySelectorAll(".gallery-thumbnail");
	const prevBtn = document.querySelector(".gallery-prev");
	const nextBtn = document.querySelector(".gallery-next");

	let currentIndex = 0;

	openModalBtn.addEventListener("click", function() {
		modal.style.display = "block";
	});

	closeModalBtn.addEventListener("click", function() {
		modal.style.display = "none";
	});

	window.addEventListener("click", function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	});

	thumbnails.forEach(function(thumbnail, index) {
		thumbnail.addEventListener("click", function() {
			const largeSrc = this.getAttribute("data-large-src");
			largeImage.setAttribute("src", largeSrc);
			currentIndex = index;

			thumbnails.forEach(function(thumb) {
				thumb.classList.remove("active");
			});

			this.classList.add("active");
		});
	});

	prevBtn.addEventListener("click", function() {
		currentIndex = (currentIndex > 0) ? currentIndex - 1 : thumbnails.length - 1;
		updateLargeImage();
	});

	nextBtn.addEventListener("click", function() {
		currentIndex = (currentIndex < thumbnails.length - 1) ? currentIndex + 1 : 0;
		updateLargeImage();
	});

	function updateLargeImage() {
		const largeSrc = thumbnails[currentIndex].getAttribute("data-large-src");
		largeImage.setAttribute("src", largeSrc);

		thumbnails.forEach(function(thumb) {
			thumb.classList.remove("active");
		});

		thumbnails[currentIndex].classList.add("active");
	}
});

document.addEventListener('DOMContentLoaded', function() {
    // 방문 방법 버튼들을 모두 선택
    var visitMethodButtons = document.querySelectorAll('.left-usermethod-btn button');

    // 각 버튼에 클릭 이벤트 리스너를 추가
    visitMethodButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 모든 버튼의 기존 스타일을 초기화
            visitMethodButtons.forEach(function(btn) {
                btn.style.backgroundColor = '#fff';
                btn.style.border = '1px solid lightgray';
                btn.style.color = '#000'; // 텍스트 색상 초기화
            });

            // 클릭된 버튼의 스타일 변경
            this.style.backgroundColor = '#f2f8ff';
            this.style.border = '1px solid #b7d5f6';
            this.style.color = '#1273e5'; // 선택된 버튼의 텍스트 색상 변경
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('myModal');
    var btn = document.getElementById('openModal');
    var closeBtn = document.getElementById('closeModal');
    var requiredConsents = document.querySelectorAll('.individual-consent[data-required="true"]');
    var body = document.body;

    // 모달 열기
    btn.addEventListener('click', function(event) {
        // 모든 필수 체크박스가 체크되어 있는지 확인
        var allChecked = Array.from(requiredConsents).every(function(checkbox) {
            return checkbox.checked;
        });

        if (allChecked) {
            modal.style.display = 'block'; // 모든 필수 항목이 체크된 경우 모달 열기
            body.style.overflow = 'hidden'; // 배경의 스크롤을 없앰
        } else {
            event.preventDefault(); // 기본 동작 막기
        }
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    closeBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        body.style.overflow = 'auto'; // 배경의 스크롤을 다시 활성화
    });
});


//결제창 
document.addEventListener("DOMContentLoaded", function() {
    var toggleArea = document.getElementById('toggleArea');
    var arrowIcon = document.getElementById('arrowIcon');
    var refundDetails = document.getElementById('refundDetails');

    toggleArea.addEventListener('click', function() {
        // refundDetails의 표시 상태에 따라 toggle
        if (refundDetails.style.display === "none" || refundDetails.style.display === "") {
            refundDetails.style.display = "block";
            arrowIcon.src = 'img/arrow_up.png'; // 화살표가 위로 향하도록 이미지 변경
        } else {
            refundDetails.style.display = "none";
            arrowIcon.src = 'img/arrow_down.png'; // 화살표가 아래로 향하도록 이미지 변경
        }
    });
});

//예약하기 페이지 버튼
document.addEventListener('DOMContentLoaded', function() {
    const allConsentButton = document.getElementById('allConsentButton');
    const allConsentCheckbox = document.getElementById('allConsent');
    const consentList = document.getElementById('consentList');
    const arrowIcon = document.getElementById('arrowIcon');
    const individualConsents = document.querySelectorAll('.individual-consent');
    const btnConsent = document.querySelector('.btn-consent button');

    allConsentButton.addEventListener('click', function() {
        consentList.classList.toggle('open');
        arrowIcon.classList.toggle('open');

        if (consentList.classList.contains('open')) {
            arrowIcon.src = 'img/arrow_up.png'; // 화살표가 위로 향하도록 이미지 변경
        } else {
            arrowIcon.src = 'img/arrow_down.png'; // 화살표가 아래로 향하도록 이미지 변경
        }
    });

    allConsentCheckbox.addEventListener('click', function(e) {
        e.stopPropagation(); // 부모 요소로의 클릭 이벤트 전파를 막음
        const isChecked = this.checked;
        individualConsents.forEach(function(checkbox) {
            checkbox.checked = isChecked;
        });
    });

    individualConsents.forEach(function(checkbox) {
        checkbox.addEventListener('click', function() {
            const requiredConsents = document.querySelectorAll('.individual-consent[data-required="true"]');
            const allRequiredChecked = Array.from(requiredConsents).every(function(checkbox) {
                return checkbox.checked;
            });

            if (!allRequiredChecked) {
                allConsentCheckbox.checked = false;
            }
        });
    });

    btnConsent.addEventListener('click', function(e) {
        const requiredConsents = document.querySelectorAll('.individual-consent[data-required="true"]');
        const allRequiredChecked = Array.from(requiredConsents).every(function(checkbox) {
            return checkbox.checked;
        });

        if (!allRequiredChecked) {
            e.preventDefault(); // 버튼의 기본 동작을 막음 (예: 폼 제출 방지)
            alert('필수 항목에 모두 동의해주세요.');
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // 결제 수단 버튼들을 모두 선택
    var payButtons = document.querySelectorAll('.pay button');

    // 각 버튼에 클릭 이벤트 리스너를 추가
    payButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 모든 버튼의 기존 스타일을 초기화
            payButtons.forEach(function(btn) {
                btn.style.backgroundColor = '#fff';
                btn.style.border = '1.5px solid #ebebeb';
            });

            // 클릭된 버튼의 스타일 변경
            this.style.backgroundColor = '#f2f8ff';
            this.style.border = '1.5px solid #b7d5f6';
        });
    });
});

//검색창 달력 라이브러리
$(document).ready(function() {
	// Date Range Picker 초기화
	$('#btn_date').daterangepicker({
		locale: {
			format: 'MM월 DD일', // 날짜 포맷 설정
			separator: ' ~ ',
			applyLabel: '적용',
			cancelLabel: '취소',
			fromLabel: '부터',
			toLabel: '까지',
			customRangeLabel: '사용자 지정',
			daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			firstDay: 0 // 일요일 시작
		},
		startDate: moment().startOf('day'), // 기본 시작 날짜
		endDate: moment().startOf('day').add(1, 'days'), // 기본 종료 날짜 (다음 날)
		minDate: moment().startOf('day'), // 최소 선택 날짜는 오늘부터
		maxDate: moment().add(1, 'years'), // 최대 선택 날짜는 1년 후까지
		autoApply: true // 날짜 선택 시 자동으로 적용
	}, function(start, end, label) {
		var days = end.diff(start, 'days'); // 선택된 일수 계산
		$('#btn_date span').html(start.format('MM월 DD일') + ' - ' + end.format('MM월 DD일') + ' (' + days + '박 ' + (days + 1) + '일)');
	});

	// Date Range Picker가 열릴 때마다 초기화
	$('#btn_date').on('apply.daterangepicker', function(ev, picker) {
		var days = picker.endDate.diff(picker.startDate, 'days');
		$('#btn_date span').html(picker.startDate.format('MM월 DD일') + ' - ' + picker.endDate.format('MM월 DD일') + ' (' + days + '박 ' + (days + 1) + '일)');
	});

	// 초기 설정값 표시
	var initialStart = moment().startOf('day');
	var initialEnd = moment().startOf('day').add(1, 'days');
	$('#btn_date span').html(initialStart.format('MM월 DD일') + ' - ' + initialEnd.format('MM월 DD일') + ' (1박 2일)');
});



//예약페이지 전화번호 포맷
function formatPhoneNumber(input) {
	// 입력된 값에서 숫자만 추출
	let numbers = input.value.replace(/\D/g, '');

	// 글자 수를 11자리로 제한
	if (numbers.length > 11) {
		numbers = numbers.slice(0, 11);
	}

	// 010-1234-5678 형식으로 변환
	let formattedNumber = numbers.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

	// input 필드에 포맷된 번호를 반영
	input.value = formattedNumber;
}

// 숫자 이외의 입력 방지
document.getElementById('phoneInput').addEventListener('input', function(e) {
	// 숫자만 허용
	this.value = this.value.replace(/\D/g, '');
	formatPhoneNumber(this);
});

//객실 상세정보 페이지 -> 예약 페이지로 폼 넘기는 액션
/*$(document).ready(function() {

	$('.reserve-btn').on('click', function() {

		//room 정보 추출
		var roomCode = $(this).data('room-code');
		var roomName = $(this).data('room-name');
		var roomType = $(this).data('room-type');
		var checkInTime = $(this).data('check-in-time');
		var checkOutTime = $(this).data('check-out-time');
		var roomAmount = $(this).data('room-amount');

		// 숨겨진 입력 필드에 값 설정
		$('input[name="roomCode"]').val(roomCode);
		$('input[name="roomName"]').val(roomName);
		$('input[name="roomType"]').val(roomType);
		$('input[name="rsvtChekInTime"]').val(checkInTime);
		$('input[name="rsvtChekOutTime"]').val(checkOutTime);
		$('input[name="rsvtRoomAmount"]').val(roomAmount);

		// 폼 제출
		$('#reservationForm').submit();
	});
});*/
document.addEventListener('DOMContentLoaded', function() {
	// 모든 .reserve-btn 버튼을 선택
	var reserveButtons = document.querySelectorAll('.reserve-btn');

	reserveButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			// room 정보 추출
			var roomCode = this.getAttribute('data-room-code');
			var roomName = this.getAttribute('data-room-name');
			var roomType = this.getAttribute('data-room-type');
			var checkInTime = this.getAttribute('data-check-in-time');
			var checkOutTime = this.getAttribute('data-check-out-time');
			var roomAmount = this.getAttribute('data-room-amount');

			// 숨겨진 입력 필드에 값 설정
			document.querySelector('input[name="roomCode"]').value = roomCode;
			document.querySelector('input[name="roomName"]').value = roomName;
			document.querySelector('input[name="roomType"]').value = roomType;
			document.querySelector('input[name="rsvtChekInTime"]').value = checkInTime;
			document.querySelector('input[name="rsvtChekOutTime"]').value = checkOutTime;
			document.querySelector('input[name="rsvtRoomAmount"]').value = roomAmount;

			// 폼 제출
			document.getElementById('reservationForm').submit();
		});
	});
});


