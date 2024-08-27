//addFlashAttribute로 msg를 보낸 경우 alert창으로 출력하기
document.addEventListener('DOMContentLoaded', function() {
	var msg = document.querySelector('.msg').value;
	var url = document.querySelector('.url').value;

	if (msg) {
		alert(msg);
	}

	location.href = url;
});