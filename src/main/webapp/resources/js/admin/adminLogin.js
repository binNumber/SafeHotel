document.getElementById('adminLoginForm').addEventListener('submit', function(event) {
	var email = document.getElementById('email').value;
	var password = document.getElementById('password').value;
	var errorMessage = document.getElementById('errorMessage');

	// 간단한 클라이언트 측 유효성 검사
	if (!email || !password) {
		errorMessage.style.display = 'block';
		errorMessage.textContent = '모든 필드를 입력해주세요.';
		event.preventDefault();
	}
});
