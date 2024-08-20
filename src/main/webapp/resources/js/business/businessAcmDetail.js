function btnUpdateAcmDtlIntro(userCode) {

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

function btnChangeAcmDtlIntro(acmDetailIntro){
	let id = document.getElementById("btn_changeAcmDtlIntro");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlIntro").classList.remove('d-none');
		document.getElementById("input_acmDtlIntro").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlIntro").classList.add('d-none');
		document.getElementById("input_acmDtlIntro").readOnly = true;
        if (acmDetailIntro != undefined && acmDetailIntro != null) {
            document.getElementById("input_acmDtlIntro").value = acmDetailIntro;
        } else {
            document.getElementById("input_acmDtlIntro").value = "";
        }
		
	}	
}

function btnUpdateAcmDtlNotice(userCode) {

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

function btnChangeAcmDtlNotice(acmDetailNotice){
	let id = document.getElementById("btn_changeAcmDtlNotice");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlNotice").classList.remove('d-none');
		document.getElementById("input_acmDtlNotice").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlNotice").classList.add('d-none');
		document.getElementById("input_acmDtlNotice").readOnly = true;
        if (acmDetailIntro != undefined && acmDetailNotice != null) {
            document.getElementById("input_acmDtlIntro").value = acmDetailNotice;
        } else {
            document.getElementById("input_acmDtlIntro").value = "";
        }
		
	}	
}




function escapeHtml(text) {
    return text
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;")
        .replace(/`/g, "&#096;");
}