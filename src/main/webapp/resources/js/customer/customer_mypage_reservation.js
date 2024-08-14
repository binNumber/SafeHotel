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
	const cancelIcon = document.querySelector("#icon-cancel");



	// 리뷰 작성&수정 팝업 닫기
	if (cancelIcon) {
		cancelIcon.addEventListener("click", () => {
			document.querySelector("#write-review-popup").classList.add("display-none");
		});
	}
});


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
		const hiddenInfoContainer = document.getElementById('hidden-img-info-container');

		if (previewContainer && hiddenInfoContainer) {
			
			previewContainer.style.height = '200px';

			previewContainer.innerHTML = '';
			hiddenInfoContainer.innerHTML = '';

			for (let i = 0; i < files.length; i++) {

				const file = files[i];

				const fullName = files[i].name;	//파일이름+확장자명
				const fileName = fullName.substring(0, fullName.lastIndexOf('.'));	//파일 이름만
				const fileExtenstion = '.' + fullName.split('.').pop();	//파일확장자면

				const reader = new FileReader();

				reader.onload = function(e) {
					const img = document.createElement('img');
					img.src = e.target.result;
					img.classList.add('preview-image');
					previewContainer.appendChild(img);
				};

				reader.readAsDataURL(file);

				//파일 이름을 저장할 수 있는 input hidden 필드 생성
				var nameInput = document.createElement('input');
				nameInput.type = 'hidden';
				nameInput.name = 'reviewImgOriginName[]';
				nameInput.value = fileName;
				hiddenInfoContainer.appendChild(nameInput);

				//파일 확장자를 저장할 수 있는 input hidden 필드 생성
				var extensionInput = document.createElement('input');
				extensionInput.type = 'hidden';
				extensionInput.name = 'reviewImgExtension[]';
				extensionInput.value = fileExtenstion;
				hiddenInfoContainer.appendChild(extensionInput);
			}
		}
	}
}