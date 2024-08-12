package com.app.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.user.UserDAO;
import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	//로그인 페이지에서 받아온 정보 기반으로 유저 검색
	@Override
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub

		User user = userDAO.findUserByUserSearchCondition(userSearchCondition);

		return user;
	}

	//유저코드로 유저 검색
	@Override
	public User findUserByUserCode(int userCode) {
		// TODO Auto-generated method stub

		User user = userDAO.findUserByUserCode(userCode);

		return user;
	}

	//입력한 닉네임이 사용 가능한지 확인 (닉네임 중복 검색)
	@Override
	public boolean isNicknameDuplicate(String userNickname) {
		// TODO Auto-generated method stub

		//해당 닉네임의 유저가 있는지 검색
		User user = userDAO.findUserByNickname(userNickname);

		if(user != null) { //닉네임 중복O 사용X
			return true;
		} else { //닉네임 중복X 사용O
			return false;
		}
	}

	//다음 유저 번호 불러오기(유저코드 생성)
	@Override
	public int getNextUserCode() {
		// TODO Auto-generated method stub

		int result = userDAO.getNextUserCode();

		return result;
	}

	//유저 회원가입 정보 DB에 저장
	@Override
	public int saveUserInfo(User user) {
		// TODO Auto-generated method stub

		int result = userDAO.saveUserInfo(user);

		return result;
	}

	//유저 회원정보 업데이트
	@Override
	public int updateUserInfo(User user) {
		// TODO Auto-generated method stub
		
		int result = userDAO.updateUserInfo(user);
		
		return result;
	}



	



	@Override
	public User findUserById(String id) {
		return userDAO.findUserById(id);
	}

}
