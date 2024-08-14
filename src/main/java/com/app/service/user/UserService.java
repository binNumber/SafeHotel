package com.app.service.user;

import javax.validation.Valid;

import com.app.dto.api.BusinessUserUpdatdReq;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserService {
	
	//유저 DB 검색
	//로그인 페이지에서 받아온 정보 기반으로 유저 검색
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition);
	
	//유저코드로 유저 검색
	public User findUserByUserCode(int userCode);
	
	//입력한 닉네임이 사용 가능한지 확인 (닉네임 중복 검색)
	public boolean isNicknameDuplicate(String userNickname);
	
	//다음 유저 번호 불러오기(유저코드 생성)
	public int getNextUserCode();
	
	//유저 회원가입 정보 DB에 저장
	public int saveUserInfo(User user);
	
	//유저 회원정보 업데이트
	public int updateUserInfo(User user);
	
	//아이디 기반으로 유저 정보 확인
	public User findUserById(String id);

	//유저 정보 수정
	public int modifyUser(@Valid BusinessUserUpdatdReq bsnsUserUpdateReq);
	
	//유저코드 기반으로 유저 회원상태 변경(회원탈퇴)
	public int updateUserStatusByUserCode(int userCode);
}
