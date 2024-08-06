document.addEventListener('DOMContentLoaded', function () {
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

document.addEventListener('DOMContentLoaded', function () {
    const acceptAll = document.getElementById('accept-all');
    const checkboxes = document.querySelectorAll('.accept-checkbox');
    const nextBtn = document.getElementById('next-btn');

    acceptAll.addEventListener('change', function () {
        checkboxes.forEach(checkbox => {
            checkbox.checked = acceptAll.checked;
        });
    });

    nextBtn.addEventListener('click', function (event) {
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
            location.href = '/usersignuppage';
        }
    });
});

