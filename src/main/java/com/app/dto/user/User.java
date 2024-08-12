package com.app.dto.user;

import lombok.Data;

@Data
public class User {

	int userCode;	//유저 코드 (PRIMARY KEY)
	String userType;	//유저 타입	고객-CUS / 사업자-BIS / 관리자-ADM
    String userEmail;	//이메일
    String userPw;	//비밀번호
    String userNickname;	//닉네임
    String userName;	//이름
    String userRsdRegNum;	//주민번호 
    String userPhoneNum;	//전화번호
    String userPostalCode;	//우편번호
    String userAddr;		//주소
    String userAddrLine;	//상세주소
    String userRegDt;	//가입날짜
    String userStatus;	//회원 상태	1-가입 / 0-탈퇴	
}
