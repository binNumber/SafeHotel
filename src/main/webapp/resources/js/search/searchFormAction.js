document.addEventListener('DOMContentLoaded', function() {
	// 모든 .reserve-btn 버튼을 선택
	var reserveButtons = document.querySelectorAll('.roominfo-btn');

	reserveButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			// room 정보 추출
			var roomCode = this.getAttribute('data-room-code');
			var roomName = this.getAttribute('data-room-name');
			var roomType = this.getAttribute('data-room-type');
			var checkInTime = this.getAttribute('data-check-in-time');
			var checkOutTime = this.getAttribute('data-check-out-time');
			var roomAmount = this.getAttribute('data-room-amount');

			// 숨겨진 입력 필드에 값 설정
			document.querySelector('input[name="roomCode"]').value = roomCode;
			document.querySelector('input[name="roomName"]').value = roomName;
			document.querySelector('input[name="roomType"]').value = roomType;
			document.querySelector('input[name="rsvtChekInTime"]').value = checkInTime;
			document.querySelector('input[name="rsvtChekOutTime"]').value = checkOutTime;
			document.querySelector('input[name="rsvtRoomAmount"]').value = roomAmount;

			// 폼 제출
			document.getElementById('reservationForm').submit();
		});
	});
});