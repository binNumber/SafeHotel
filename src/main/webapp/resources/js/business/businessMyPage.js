/**
 * 
 */

function btnUpdateName(userCode) {

	document.getElementById("btn_updateName").classList.add('d-none');
	document.getElementById("input_Name").readOnly = true;
	document.getElementById("btn_changeName").value = "변경";
	
	let data = {
		userCode: userCode,
		userName: $("#input_Name").val(),
		userPhoneNum: $("#input_Phone").val(),
		userAddr: $("#input_addr").val(),
		userNickname: $("#input_nickName").val(),
		userEmail: $("#input_email").val(),
		userPw: $("#input_password").val()
	};

	$.ajax({
		type: "put",
		url: "/modifyBusiness/" + userCode,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function(result) {
			if (result.header.resultCode == '200') {
				alert(result.header.resultMessage);
			} else {
				alert(result.header.resultMessage);
			}
		}, error: function(error) {
			console.log(error);
		}
	});
}

function btnChangeName(userName) {
	let id = document.getElementById("btn_changeName");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateName").classList.remove('d-none');
		document.getElementById("input_Name").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateName").classList.add('d-none');
		document.getElementById("input_Name").readOnly = true;
		document.getElementById("input_Name").value = userName;
	}
}

function btnChangePhone() {
	let id = document.getElementById("btn_changePhone");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updatePhone").classList.remove('d-none');
		document.getElementById("input_Phone").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updatePhone").classList.add('d-none');
		document.getElementById("input_Phone").readOnly = true;
	}
}

function btnChangeAddr() {
	let id = document.getElementById("btn_changeAddr");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAddr").classList.remove('d-none');
		document.getElementById("input_addr").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAddr").classList.add('d-none');
		document.getElementById("input_addr").readOnly = true;
	}
}

function btnChangeNickName() {
	let id = document.getElementById("btn_changeNickName");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateNickName").classList.remove('d-none');
		document.getElementById("input_nickName").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateNickName").classList.add('d-none');
		document.getElementById("input_nickName").readOnly = true;
	}
}

function btnChangeEmail() {
	let id = document.getElementById("btn_changeEmail");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateEmail").classList.remove('d-none');
		document.getElementById("input_email").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateEmail").classList.add('d-none');
		document.getElementById("input_email").readOnly = true;
	}
}

function btnChangePassword() {
	let id = document.getElementById("btn_changePassword");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updatePassword").classList.remove('d-none');
		document.getElementById("input_password").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updatePassword").classList.add('d-none');
		document.getElementById("input_password").readOnly = true;
	}
}

function btnChangeBusinessName() {
	let id = document.getElementById("btn_changeBusinessName");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateBusinessName").classList.remove('d-none');
		document.getElementById("input_businessName").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateBusinessName").classList.add('d-none');
		document.getElementById("input_businessName").readOnly = true;
	}
}

function btnChangeBusinessNumber() {
	let id = document.getElementById("btn_changeBusinessNumber");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateBusinessNumber").classList.remove('d-none');
		document.getElementById("input_businessNumber").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateBusinessNumber").classList.add('d-none');
		document.getElementById("input_businessNumber").readOnly = true;
	}
}

function btnChangeBusinessAddr() {
	let id = document.getElementById("btn_changeBusinessAddr");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateBusinessAddr").classList.remove('d-none');
		document.getElementById("input_businessAddr").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateBusinessAddr").classList.add('d-none');
		document.getElementById("input_businessAddr").readOnly = true;
	}
}

function btnUpdate() {

}

function update(userCode) {
	let data = {
		userCode: userCode,
		userName: $("#input_Name").val(),
		userPhoneNum: $("#input_Phone").val(),
		userAddr: $("#input_addr").val(),
		userNickname: $("#input_nickName").val(),
		userEmail: $("#input_email").val(),
		userPw: $("#input_password").val()
	};

	$.ajax({
		type: "put",
		url: "/modifyBusiness/" + userCode,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function(result) {
			if (result.header.resultCode == '200') {
				alert(result.header.resultMessage);
			} else {
				alert(result.header.resultMessage);
			}
		}, error: function(error) {
			console.log(error);
		}
	});

}