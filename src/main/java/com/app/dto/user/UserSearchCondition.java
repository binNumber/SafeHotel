package com.app.dto.user;

import lombok.Data;

@Data
public class UserSearchCondition {

	//유저 검색 시 사용하는 DTO
	
	String userEmail;	//이메일
	String userPw;	//비밀번호
	String userType;	//유저 타입  CUS '고객' / BIS '사업자' / ADM '관리자'
	
}
