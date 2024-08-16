package com.app.dto.api;

import lombok.Data;

@Data
public class ApiResponseHeader {
	
	String resultCode;		//200 성공 400 실패
	String resultMessage;
}
