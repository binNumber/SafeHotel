function btnUpdate(btnUpdateId, inputId, btnChangeId, column, acmCode) {
	document.getElementById(btnUpdateId).classList.add('d-none');
	document.getElementById(inputId).readOnly = true;
	document.getElementById(btnChangeId).value = "변경";
	
	value = document.getElementById(inputId).value;
	
	console.log(value);
	
	let data = {
		column,
		acmCode,
		value
//		acmDtlTransport: $("#input_acmDtlTransport").val()
	};

	console.log(data);
	
//	$.ajax({
//		type: "put",
//		url: "/modifyAcmDe/" + userCode,
//		data: JSON.stringify(data),
//		contentType: "application/json; charset=utf-8",
//		dataType: "json",
//		success: function(result) {
//			if (result.header.resultCode == '200') {
//				alert(result.header.resultMessage);
//			} else {
//				alert(result.header.resultMessage);
//			}
//		}, error: function(error) {
//			console.log(error);
//		}
//	});
}

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

function btnUpdateAcmDtlNotice() {
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

function btnUpdateAcmDtlInfo() {
}

function btnChangeAcmDtlInfo(acmDetailInfo){
	let id = document.getElementById("btn_updateAcmDtlInfo");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlInfo").classList.remove('d-none');
		document.getElementById("input_acmDtlInfo").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlInfo").classList.add('d-none');
		document.getElementById("input_acmDtlInfo").readOnly = true;
        if (acmDetailInfo != undefined && acmDetailInfo != null) {
            document.getElementById("input_acmDtlInfo").value = acmDetailInfo;
        } else {
            document.getElementById("input_acmDtlInfo").value = "";
        }
	}	
}

function btnUpdateAcmDtlUsageGuide() {
}

function btnChangeAcmDtlUsageGuide(acmDetailUsageGuide){
	let id = document.getElementById("btn_updateAcmDtlUsageGuide");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlUsageGuide").classList.remove('d-none');
		document.getElementById("input_acmDtlUsageGuide").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlUsageGuide").classList.add('d-none');
		document.getElementById("input_acmDtlUsageGuide").readOnly = true;
        if (acmDetailUsageGuide != undefined && acmDetailUsageGuide != null) {
            document.getElementById("input_acmDtlUsageGuide").value = acmDetailUsageGuide;
        } else {
            document.getElementById("input_acmDtlUsageGuide").value = "";
        }
	}	
}

function btnUpdateAcmDtlAddPersonnel() {
}

function btnChangeAcmDtlAddPersonnel(acmDetailAddPersonnel){
	let id = document.getElementById("btn_updateAcmDtlAddPersonnel");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlAddPersonnel").classList.remove('d-none');
		document.getElementById("input_acmDtlAddPersonnel").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlAddPersonnel").classList.add('d-none');
		document.getElementById("input_acmDtlAddPersonnel").readOnly = true;
        if (acmDetailAddPersonnel != undefined && acmDetailAddPersonnel != null) {
            document.getElementById("input_acmDtlAddPersonnel").value = acmDetailAddPersonnel;
        } else {
            document.getElementById("input_acmDtlAddPersonnel").value = "";
        }
	}	
}

function btnUpdateAcmDtlRoomInfo() {
}

function btnChangeAcmDtlRoomInfo(acmDetailRoomInfo){
	let id = document.getElementById("btn_updateAcmDtlRoomInfo");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlRoomInfo").classList.remove('d-none');
		document.getElementById("input_acmDtlRoomInfo").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlRoomInfo").classList.add('d-none');
		document.getElementById("input_acmDtlRoomInfo").readOnly = true;
        if (acmDetailRoomInfo != undefined && acmDetailRoomInfo != null) {
            document.getElementById("input_acmDtlRoomInfo").value = acmDetailRoomInfo;
        } else {
            document.getElementById("input_acmDtlRoomInfo").value = "";
        }
	}	
}

function btnUpdateAcmDtlFacilities() {
}

function btnChangeAcmDtlFacilities(acmDetailFacilities){
	let id = document.getElementById("btn_updateAcmDtlFacilities");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlFacilities").classList.remove('d-none');
		document.getElementById("input_acmDtlFacilities").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlFacilities").classList.add('d-none');
		document.getElementById("input_acmDtlFacilities").readOnly = true;
        if (acmDetailFacilities != undefined && acmDetailFacilities != null) {
            document.getElementById("input_acmDtlFacilities").value = acmDetailFacilities;
        } else {
            document.getElementById("input_acmDtlFacilities").value = "";
        }
	}	
}

function btnUpdateAcmDtlParking() {
	
	
}

function btnChangeAcmDtlParking(acmDetailParking){
	let id = document.getElementById("btn_updateAcmDtlParking");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlParking").classList.remove('d-none');
		document.getElementById("input_acmDtlParking").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlParking").classList.add('d-none');
		document.getElementById("input_acmDtlParking").readOnly = true;
        if (acmDetailParking != undefined && acmDetailParking != null) {
            document.getElementById("input_acmDtlParking").value = acmDetailParking;
        } else {
            document.getElementById("input_acmDtlParking").value = "";
        }
	}	
}

//function btnUpdateAcmDtlTransport(acmCode) {
//	document.getElementById("btn_updateAcmDtlTransport").classList.add('d-none');
//	document.getElementById("input_acmDtlTransport").readOnly = true;
//	document.getElementById("btn_changeAcmDtlTransport").value = "변경";
//	
//	let data = {
//		column: ''
//		acmCode: acmCode,
//		acmDtlTransport: $("#input_acmDtlTransport").val()
//	};
//
//	$.ajax({
//		type: "put",
//		url: "/modifyAcmDe/" + userCode,
//		data: JSON.stringify(data),
//		contentType: "application/json; charset=utf-8",
//		dataType: "json",
//		success: function(result) {
//			if (result.header.resultCode == '200') {
//				alert(result.header.resultMessage);
//			} else {
//				alert(result.header.resultMessage);
//			}
//		}, error: function(error) {
//			console.log(error);
//		}
//	});
//}

function btnChangeAcmDtlTransport(acmDetailTransport){
	let id = document.getElementById("btn_updateAcmDtlTransport");
	
	console.log('sadf');
	
	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlTransport").classList.remove('d-none');
		document.getElementById("input_acmDtlTransport").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlTransport").classList.add('d-none');
		document.getElementById("input_acmDtlTransport").readOnly = true;
        if (acmDetailTransport != undefined && acmDetailTransport != null) {
            document.getElementById("input_acmDtlTransport").value = acmDetailTransport;
        } else {
            document.getElementById("input_acmDtlTransport").value = "";
        }
	}	
}

function btnUpdateAcmDtlBenefit() {
}

function btnChangeAcmDtlBenefit(acmDetailBenefit){
	let id = document.getElementById("btn_updateAcmDtlBenefit");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlBenefit").classList.remove('d-none');
		document.getElementById("input_acmDtlBenefit").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlBenefit").classList.add('d-none');
		document.getElementById("input_acmDtlBenefit").readOnly = true;
        if (acmDetailBenefit != undefined && acmDetailBenefit != null) {
            document.getElementById("input_acmDtlBenefit").value = acmDetailBenefit;
        } else {
            document.getElementById("input_acmDtlBenefit").value = "";
        }
	}	
}

function btnUpdateAcmDtlGuide() {
}

function btnChangeAcmDtlGuide(acmDetailGuide){
	let id = document.getElementById("btn_updateAcmDtlGuide");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlGuide").classList.remove('d-none');
		document.getElementById("input_acmDtlGuide").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlGuide").classList.add('d-none');
		document.getElementById("input_acmDtlGuide").readOnly = true;
        if (acmDetailGuide != undefined && acmDetailGuide != null) {
            document.getElementById("input_acmDtlGuide").value = acmDetailGuide;
        } else {
            document.getElementById("input_acmDtlGuide").value = "";
        }
	}	
}


// 취소 및 환불 규정
function btnUpdateAcmDtlPolicy() {
}

function btnChangeAcmDtlPolicy(acmDetailPolicy){
	let id = document.getElementById("btn_updateAcmDtlPolicy");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlPolicy").classList.remove('d-none');
		document.getElementById("input_acmDtlPolicy").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlPolicy").classList.add('d-none');
		document.getElementById("input_acmDtlPolicy").readOnly = true;
        if (acmDetailPolicy != undefined && acmDetailPolicy != null) {
            document.getElementById("input_acmDtlPolicy").value = acmDetailPolicy;
        } else {
            document.getElementById("input_acmDtlPolicy").value = "";
        }
	}	
}


function btnUpdateAcmDtlEtc() {
}

function btnChangeAcmDtlEtc(acmDetailEtc){
	let id = document.getElementById("btn_updateAcmDtlEtc");

	if (id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateAcmDtlEtc").classList.remove('d-none');
		document.getElementById("input_acmDtlEtc").readOnly = false;
	} else if (id.value == "취소") {
		id.value = "변경";
		document.getElementById("btn_updateAcmDtlEtc").classList.add('d-none');
		document.getElementById("input_acmDtlEtc").readOnly = true;
        if (acmDetailEtc != undefined && acmDetailEtc != null) {
            document.getElementById("input_acmDtlEtc").value = acmDetailEtc;
        } else {
            document.getElementById("input_acmDtlEtc").value = "";
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