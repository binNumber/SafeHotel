package com.app.dao.user;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserDAO {
	
	//유저검색
	//로그인 페이지에서 받아온 정보 기반으로 유저 검색
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition);
	
	//닉네임 기반으로 유저 검색
	public User findUserByNickname(String usernickname);
	
	//유저코드 기반으로 유저 검색
	public User findUserByUserCode(int userCode);
	
	//다음 유저 번호 불러오기(유저코드 생성)
	public int getNextUserCode();
	
	//유저 회원가입 정보 DB에 저장
	public int saveUserInfo(User user);
}
