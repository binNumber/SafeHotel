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
        const slideWidth = slides[0].clientWidth; // 한 개 슬라이드의 너비
        const gap = 20; // 슬라이드 간격
        const offset = (-(slideWidth + gap) * currentSlide) * 3; // 슬라이드 이동 거리 계산
        slidesContainer.style.transform = `translateX(${offset}px)`;
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
    document.querySelector('.btn_sectionpage.next button').addEventListener('click', nextSlide);
    document.querySelector('.btn_sectionpage.prev button').addEventListener('click', prevSlide);

    // 도트 클릭 이벤트
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            currentSlide = index;
            updateSlides();
        });
    });

    // 자동 슬라이드 이동 (10초 간격)
    interval = setInterval(nextSlide, 10000);

    // 슬라이드 자동 이동 일시 중지 및 재개
    const pauseInterval = () => clearInterval(interval);
    const resumeInterval = () => interval = setInterval(nextSlide, 10000);

    document.querySelector('.sectionpage').addEventListener('mouseenter', pauseInterval);
    document.querySelector('.sectionpage').addEventListener('mouseleave', resumeInterval);

    // 사이드바 열기 버튼 클릭 이벤트
    document.getElementById("icon-btn").addEventListener("click", function(event) {
        event.preventDefault(); // 기본 링크 동작을 막기 위해
        var sidebar = document.getElementById("sidebar");
        sidebar.classList.toggle("show");
    });

    // 사이드바 닫기 버튼 클릭 이벤트
    document.getElementById("close-btn").addEventListener("click", function() {
        var sidebar = document.getElementById("sidebar");
        sidebar.classList.remove("show");
    });

    // 카테고리 클릭 이벤트
    document.querySelectorAll(".category").forEach(function(category) {
        category.addEventListener("click", function(event) {
            event.preventDefault(); // 기본 링크 동작 방지

            var targetId = this.getAttribute("data-target");
            var targetElement = document.getElementById(targetId);
            var subcategories = targetElement.querySelectorAll("li");
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
            if (!targetElement.classList.contains("show")) {
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
});
