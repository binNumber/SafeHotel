package com.app.dto.admin;

import java.sql.Date;

import lombok.Data;

@Data
public class UserList {
	
	int userCode; //고유번호
	String userType; // 고객-'CUS' 사업자-'BIS' 관리자-'ADM'
	String userEmail; // 회원 이메일이자 아이디
	String userPw; // 회원 비밀번호
	String userNickname; // 회원 닉네임
	String userName; // 회원 이름
	String userRsdRegNum; // 주민번호
	String userPhoneNum; // 회원 전화번호
	String userAddr; // 회원 주소
	Date userRegDt; // 회원가입날짜 YYYY-MM-DD
	String userStatus; // 회원상태 0=탈퇴, 1=사용

}
