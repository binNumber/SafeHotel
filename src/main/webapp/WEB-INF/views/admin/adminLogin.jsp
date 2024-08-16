<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="/css/adminPage/adminLogin.css" rel="stylesheet">
</head>
<body>
	<div class="login-container">
		<h2>관리자 로그인</h2>
		<form id="adminLoginForm" action="/adminLogin" method="post">
			<div class="form-group">
				<label for="email">이메일:</label>
				<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="password">비밀번호:</label>
				<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
		<p id="errorMessage" style="color:red; display:none;">잘못된 이메일 또는 비밀번호입니다.</p>
	</div>

	<script src="/js/admin/adminLogin.js"></script>
</body>
</html>
