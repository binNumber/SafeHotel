/**
 * 
 */
//
//function btnSaveAccommodation(userCode) {
//
//	document.getElementById("btn_updateName").classList.add('d-none');
//	document.getElementById("input_Name").readOnly = true;
//	document.getElementById("btn_changeName").value = "변경";
//	
//	let data = {
//		userCode: userCode,
//		userName: $("#input_Name").val(),
//		userPhoneNum: $("#input_Phone").val(),
//		userAddr: $("#input_addr").val(),
//		userNickname: $("#input_nickName").val(),
//		userEmail: $("#input_email").val(),
//		userPw: $("#input_password").val()
//	};
//
//	$.ajax({
//		type: "post",
//		url: "/modifyBusiness/" + userCode,
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