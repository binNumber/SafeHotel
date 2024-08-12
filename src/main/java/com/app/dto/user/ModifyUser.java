package com.app.dto.user;

import lombok.Data;

@Data
public class ModifyUser {
	//user 수정할 내용
	
    String userPw;	//비밀번호
    String userNickname;	//닉네임
    String userPhoneNum;	//전화번호
    String userAddr;	//주소
    
}
