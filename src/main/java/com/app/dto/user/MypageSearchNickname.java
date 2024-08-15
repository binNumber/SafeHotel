package com.app.dto.user;

import lombok.Data;

@Data
public class MypageSearchNickname {
	//마이페이지에서 중복 닉네임 검사하기 위한 DTO
	//(본인의 닉네임은 중복검사에서 제외하기 위함)
	
	String nickname;
	int userCode;
}
