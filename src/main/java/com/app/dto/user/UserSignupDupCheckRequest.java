package com.app.dto.user;

import lombok.Data;

@Data
public class UserSignupDupCheckRequest {
	//회원가입 중복체크용 DTO
	
	String userNickname;	//닉네임
	String userPw;		//비밀번호
	String userPwCHeck;	//비밀번호 확인
	String userPhoneNum;	//전화번호
	String userPostalCode;	//우편번호
	String userAddr;	//주소
	String userAddrLine;	//상세주소
}
