document.addEventListener('DOMContentLoaded', function() {

	//form 전송 정보를 입력 받을 input
	var payInfo = document.querySelector('input[name="rsvtPaymentInfo"]');
	var guestName = document.querySelector('input[name="rsvtGuestName"]');
	var guestTel = document.querySelector('input[name="rsvtGuestTel"]');

	//결제정보 클릭
	var kakaopay = document.getElementById('kakaopay');
	var tosspay = document.getElementById('toss');
	var naverpay = document.getElementById('naverpay');
	var payco = document.getElementById('payco');
	var credit = document.getElementById('credit');
	var phone = document.getElementById('phone');
	var bank = document.getElementById('bank');

	//카카오페이 결제
	if (kakaopay) {
		kakaopay.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '카카오페이 결제';
			}
		});
	}

	//토스페이 결제
	if (tosspay) {
		tosspay.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '토스페이 결제';
			}
		});
	}

	//네이버페이 결제
	if (naverpay) {
		naverpay.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '네이버페이 결제';
			}
		});
	}


	//페이코 결제
	if (payco) {
		payco.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '페이코 결제';
			}
		});
	}

	//신용/체크카드 결제
	if (credit) {
		credit.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '신용/체크카드 결제';
			}
		});
	}

	//핸드폰 결제
	if (phone) {
		phone.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '핸드폰 결제';
			}
		});
	}

	//무통장입금 결제
	if (bank) {
		bank.addEventListener('click', () => {
			if (payInfo) {
				payInfo.value = '무통장 입금';
			}
		});
	}

	var patmentBtn = document.querySelector('.patment');

	patmentBtn.addEventListener('click', function() {

		var name = document.getElementById('nameInput');
		var tel = document.getElementById('phoneInput');

		guestName.value = name.value;
		guestTel.value = tel.value;

		// 폼 제출
		document.getElementById('reservationFrom').submit();
	});
});