function changeStatus(acmCode, status) {
	if (confirm("정말로 상태를 변경하시겠습니까?")) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "/adminpage/updateAccommodationStatus", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// 상태 변경 성공 시, 페이지의 해당 숙소 상태를 업데이트합니다.
				document.getElementById("status-" + acmCode).innerText = getStatusText(status);
			}
		};

		xhr.send("acmCode=" + acmCode + "&status=" + status);
	}
}

function getStatusText(status) {
	switch (status) {
		case 0: return "대기";
		case 1: return "승인됨";
		case 2: return "거절됨";
		default: return "알 수 없음";
	}
}
