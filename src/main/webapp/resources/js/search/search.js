function submitSearchForm() {
	// 폼 필드 값 설정
	const searchText = document.getElementById("search_term").value.trim();
	const checkInDate = document.getElementById("checkInDate").value;
	const checkOutDate = document.getElementById("checkOutDate").value;
	const peopleCount = document.getElementById("peopleCount").innerText.trim();

	// 유효성 검사
	if (searchText === "") {
		alert("검색어를 입력해주세요.");
		return;
	}

	if (checkInDate === "") {
		alert("체크인 날짜를 선택해주세요.");
		return;
	}

	if (checkOutDate === "") {
		alert("체크아웃 날짜를 선택해주세요.");
		return;
	}

	if (new Date(checkInDate) > new Date(checkOutDate)) {
		alert("체크아웃 날짜는 체크인 날짜보다 나중이어야 합니다.");
		return;
	}

	// 폼 필드 값 설정
	document.getElementById("formSearchText").value = searchText;
	document.getElementById("formCheckIn").value = checkInDate;
	document.getElementById("formCheckOut").value = checkOutDate;
	document.getElementById("formPeople").value = peopleCount;

	// 폼 전송
	document.getElementById("searchForm").submit();
}

document.addEventListener("DOMContentLoaded", function() {
	const decreaseButton = document.querySelector('.decrease');
	const increaseButton = document.querySelector('.increase');

	// 현재 이벤트 리스너를 모두 제거하고 다시 추가합니다.
	decreaseButton.replaceWith(decreaseButton.cloneNode(true));
	increaseButton.replaceWith(increaseButton.cloneNode(true));

	const newDecreaseButton = document.querySelector('.decrease');
	const newIncreaseButton = document.querySelector('.increase');

	// 이벤트 리스너를 등록합니다.
	newDecreaseButton.addEventListener('click', function() {
		let count = parseInt(document.getElementById("peopleCount").innerText.trim());
		if (count > 1) {
			document.getElementById("peopleCount").innerText = count - 1;
			document.getElementById("peopleNum").innerText = "인원 " + (count - 1);
		}
	});

	newIncreaseButton.addEventListener('click', function() {
		let count = parseInt(document.getElementById("peopleCount").innerText.trim());
		document.getElementById("peopleCount").innerText = count + 1;
		document.getElementById("peopleNum").innerText = "인원 " + (count + 1);
	});
});
