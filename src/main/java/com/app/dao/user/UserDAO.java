package com.app.dao.user;

import javax.validation.Valid;

import com.app.dto.api.BusinessUserUpdatdReq;
import com.app.dto.business.Business;
import com.app.dto.user.MypageSearchNickname;
import com.app.dto.user.MypageUserInfoDupCheckRequest;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserDAO {
	
	//유저검색
	//로그인 페이지에서 받아온 정보 기반으로 유저 검색
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition);
	
	//닉네임 기반으로 유저 검색
	public User findUserByNickname(String usernickname);
	
	//닉네임 기반으로 입력된 유저코드를 제외한 유저 검색
	public User findUserByDupCheck(MypageSearchNickname searchNickname);
	
	//유저코드 기반으로 유저 검색
	public User findUserByUserCode(int userCode);
	
	//이메일로 유저 검색
	public User findUserByEmail(String email);
	
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
