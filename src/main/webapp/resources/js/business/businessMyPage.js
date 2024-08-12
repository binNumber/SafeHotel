/**
 * 
 */


function btnChangeName() {
	let id = document.getElementById("btn_changeName");
	
	if(id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updateName").classList.remove('d-none');
		document.getElementById("input_Name").readOnly = false;
	} else if(id.value == "취소"){
		id.value = "변경";
		document.getElementById("btn_updateName").classList.add('d-none');
		document.getElementById("input_Name").readOnly = true;
	}
}

function btnChangePhone(){
	let id = document.getElementById("btn_changePhone");
	
	if(id.value == "변경") {
		id.value = "취소";
		document.getElementById("btn_updatePhone").classList.remove('d-none');
		document.getElementById("input_Phone").readOnly = false;
	} else if(id.value == "취소"){
		id.value = "변경";
		document.getElementById("btn_updatePhone").classList.add('d-none');
		document.getElementById("input_Phone").readOnly = true;
	}	
}

function btnUpdate(){
	
}