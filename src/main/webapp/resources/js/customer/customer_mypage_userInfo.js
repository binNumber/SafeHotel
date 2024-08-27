//카테고리 사이드바 관련 스크립트
document.addEventListener("DOMContentLoaded", function() {
	// 사이드바 열기 버튼 클릭 이벤트
	const iconBtn = document.getElementById("icon-btn");
	if (iconBtn) {
		iconBtn.addEventListener("click", function(event) {
			event.preventDefault(); // 기본 링크 동작을 막기 위해
			var sidebar = document.getElementById("sidebar");
			if (sidebar) {
				sidebar.classList.toggle("show");
			}
		});
	}

	// 사이드바 닫기 버튼 클릭 이벤트
	const closeBtn = document.getElementById("close-btn");
	if (closeBtn) {
		closeBtn.addEventListener("click", function() {
			var sidebar = document.getElementById("sidebar");
			if (sidebar) {
				sidebar.classList.remove("show");
			}
		});
	}

	// 카테고리 클릭 이벤트
	const categories = document.querySelectorAll(".category");
	if (categories.length) {
		categories.forEach(function(category) {
			category.addEventListener("click", function(event) {
				event.preventDefault(); // 기본 링크 동작 방지

				var targetId = this.getAttribute("data-target");
				var targetElement = document.getElementById(targetId);
				var subcategories = targetElement?.querySelectorAll("li") || [];
				var delay = 100; // 각 하위 카테고리 표시 간격 (밀리초)

				// 모든 하위 카테고리 숨기기
				document.querySelectorAll(".subcategories").forEach(function(sub) {
					sub.style.maxHeight = null;
					sub.classList.remove("show");
					sub.querySelectorAll("li").forEach(function(item) {
						item.style.opacity = 0;
					});
				});

				// 클릭한 카테고리의 하위 카테고리만 보여주기
				if (targetElement && !targetElement.classList.contains("show")) {
					targetElement.classList.add("show");
					targetElement.style.maxHeight = targetElement.scrollHeight + "px"; // 실제 높이 설정

					// 순차적으로 하위 카테고리 표시
					subcategories.forEach(function(subcategory, index) {
						setTimeout(function() {
							subcategory.style.opacity = 1;
							subcategory.style.transition = "opacity 0.5s ease-in";
						}, delay * index);
					});
				}
			});
		});
	}
});

//주소창 DaumApi
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			document.getElementById("postcode").value = data.zonecode;
			document.getElementById("address").value = data.address;
			document.getElementById("detailAddress").focus();
		},
	}).open();
}


$(document).ready(function() {

	// 핸드폰 번호 포맷팅 함수
	const formatPhone = (value) => {
		value = value.replace(/\D/g, ""); // 숫자만 남기고 제거
		if (value.length > 10) {
			value = value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7, 11);
		} else if (value.length > 6) {
			value = value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7);
		} else if (value.length > 3) {
			value = value.slice(0, 3) + "-" + value.slice(3);
		}
		return value;
	};

	// 핸드폰 번호 입력 시 포맷 적용
	$('input[name="userPhoneNum"]').on('input', function() {
		$(this).val(formatPhone($(this).val()));
	}).on('keydown', function(event) {
		if (event.key === "Backspace" || event.key === "Tab" || event.key === "ArrowLeft" || event.key === "ArrowRight") {
			return;
		}
		if (!/\d/.test(event.key)) {
			event.preventDefault();
		}
	}).on('input', function() {
		if ($(this).val().replace(/\D/g, "").length > 11) {
			$(this).val($(this).val().slice(0, 11 + Math.floor(($(this).val().length - 11) / 3)));
		}
	});

	// 비밀번호 검사
	const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,20}$/;
	$('input[name="userPw"]').on('input', function() {
		const pw = $(this).val();
		if (!pwRegex.test(pw)) {
			$('#pwError').text('비밀번호 형식에 맞지 않습니다. 형식에 맞게 작성해주세요. 영어 대소문자, 숫자, 특수문자 포함 8~20자');
		} else {
			$('#pwError').text('');
		}
	});

	// 비밀번호 확인 검사
	$('input[name="userPwCheck"]').on('input', function() {
		const pw = $('input[name="userPw"]').val();
		const pwCheck = $(this).val();
		if (pw !== pwCheck) {
			$('#pwCheckError').text('입력하신 비밀번호와 동일하게 입력해주세요.');
		} else {
			$('#pwCheckError').text('');
		}
	});

	// 실시간 오류 메시지 제거
	$(' input[name="userNickname"], input[name="userPhoneNum"], input[name="userPostalCode"]').on('input', function() {
		const inputText = $(this).attr('userNickname');

		if (inputText === 'userNickname') {
			$('#nicknameMessage').text('');
		} else if (inputText === 'userPhoneNum') {
			$('#phoneNumError').text('');
		} else if (inputText === 'userPostalCode') {
			$('#addressError').text('');
		}
	});

	// 폼 제출 시 유효성 검사
	$('#modifyForm').on('submit', function(event) {
		let isValid = true;

		// 모든 오류 메시지 초기화
		$('.error').text('');

		// 닉네임 검사
		let userNickname = $('input[name="userNickname"]').val();
		if (!userNickname) {
			$('#nicknameError').text('닉네임을 입력해주세요.');
			isValid = false;
		}

		// 비밀번호 검사
		let userPw = $('input[name="userPw"]').val();
		if (!userPw) {
			$('#pwError').text('비밀번호를 입력해주세요.');
			isValid = false;
		}

		// 비밀번호 확인 검사
		let userPwCheck = $('input[name="userPwCheck"]').val();
		if (!userPwCheck) {
			$('#pwCheckError').text('비밀번호와 동일하게 입력해주세요.');
			isValid = false;
		}

		// 핸드폰 번호 검사
		let userPhoneNum = $('input[name="userPhoneNum"]').val();
		if (!userPhoneNum) {
			$('#phoneNumError').text('핸드폰 번호를 입력해주세요.');
			isValid = false;
		}

		// 주소 검사
		let userPostalCode = $('input[name="userPostalCode"]').val();
		let userAddr = $('input[name="userAddr"]').val();
		if (!userPostalCode || !userAddr) {
			$('#addressError').text('주소를 입력해주세요.');
			isValid = false;
		}

		// 유효성 검사 실패 시 폼 제출 방지
		if (!isValid) {
			alert('필수 입력 사항이 누락되었거나 올바르지 않습니다. 모든 항목을 올바르게 입력한 후 다시 시도해 주세요.');
			event.preventDefault();
		}
	});
});

//닉네임 중복확인
$(document).ready(function() {

	//닉네임 중복 클릭되었을 때
	$('#btn_checkDupId').click(function() {
		//input에 입력된 값들 가져오기
		let userNickname = $('input[name="userNickname"]').val();
		let userPw = $('input[name="userPw"]').val();
		let userPwCHeck = $('input[name="userPwCheck"]').val();
		let userPhoneNum = $('input[name="userPhoneNum"]').val();
		let userPostalCode = $('input[name="userPostalCode"]').val();
		let userAddr = $('input[name="userAddr"]').val();
		let userAddrLine = $('input[name="userAddrLine"]').val();

		console.log(userNickname);

		if (!userNickname.trim()) { //값이 없을 경우
			alert('닉네임을 입력해주세요.');

			return;
		}

		console.log(userPw);
		console.log(userPwCHeck);
		console.log(userPhoneNum);
		console.log(userPostalCode);
		console.log(userAddr);
		console.log(userAddrLine);

		let requestJsonData = {
			'userNickname': userNickname,
			'userPw': userPw,
			'userPwCHeck': userPwCHeck,
			'userPhoneNum': userPhoneNum,
			'userPostalCode': userPostalCode,
			'userAddr': userAddr,
			'userAddrLine': userAddrLine
		}

		console.log(requestJsonData);

		let requestJsonDataString = JSON.stringify(requestJsonData);
		console.log(requestJsonDataString);

		$.ajax({
			type: "POST",
			url: "http://localhost:8080/mypage/isNicknameDuplicate",
			headers: {
				"Content-type": "application/json;charset:UTF-8"
			},
			dataType: "json",
			data: requestJsonDataString,
			success: function(result) {
				console.log(result);
				console.log(result.header.resultCode);
				console.log(result.body);

				if (result.header.resultCode == '200') {
					$('#nicknameMessage').text('사용 가능한 닉네임입니다.')
						.removeClass('color-red') //텍스트 색상 제거
						.addClass('color-blue'); //텍스트 색상 푸른색으로
				} else {
					$('#nicknameMessage').text('사용할 수 없는 닉네임입니다. 다시 입력해주세요.')
						.removeClass('color-blue') //텍스트 색상 제거
						.addClass('color-red'); //텍스트 색상 붉은색으로

				}
			},
			error: function(error) {
				console.log(error);
			}
		});
	});
});