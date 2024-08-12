package com.app.dto.api;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BusinessUserUpdatdReq {

	@NotNull
	int userCode;	//유저 코드 (PRIMARY KEY)
	
	@NotNull
	@Email
	String userEmail;	//이메일
	
	@NotNull
	String userPw;	//비밀번호
	
	@NotNull
	String userNickname;	//닉네임
	
	@NotNull
	String userName;	//이름
    
	@NotNull
	String userPhoneNum;	//전화번호
    
	@NotNull
	String userAddr;		//주소
	
}
