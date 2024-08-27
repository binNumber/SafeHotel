//비밀번호 확인 되지 않은 경우 경고창 출력
$(document).ready(function() {

	//세션에서 메시지 받아오기
	var errormsg =/*[[${session.error}]]*/'';

	if (errormsg) {
		alert(errormsg);
	}
});