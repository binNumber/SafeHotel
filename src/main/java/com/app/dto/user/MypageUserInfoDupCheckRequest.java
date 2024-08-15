package com.app.dto.user;

import lombok.Data;

@Data
public class MypageUserInfoDupCheckRequest {
	//회원가입 중복체크용 DTO
	
	String userName;	//이름
	String userEmail;	//이메일
	String userPw;		//비밀번호
	String userPwCHeck;	//비밀번호 확인
	String userPhoneNum;	//전화번호
	String userRsdRegNum;	//주민번호
	String userPostalCode;	//우편번호
	String userAddr;	//주소
	String userAddrLine;	//상세주소
	String gender;	//성별
	String userNickname;	//닉네임
}
