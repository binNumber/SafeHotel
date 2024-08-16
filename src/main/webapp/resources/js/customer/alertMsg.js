//addFlashAttribute로 msg를 보낸 경우 alert창으로 출력하기
window.onload = function() {
	
    var msg = /*[[${msg}]]*/ '';
    if (msg) {
        alert(msg);
    }
}