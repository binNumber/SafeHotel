package com.app.dao.user.impl;

import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.user.UserDAO;
import com.app.dto.api.BusinessUserUpdatdReq;
import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//로그인 페이지에서 받아온 정보 기반으로 유저 검색
	@Override
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserSearchCondition", userSearchCondition);
		
		return user;
	}
	
	//닉네임 기반으로 유저 검색
	@Override
	public User findUserByNickname(String userNickname) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByNickname", userNickname);
		
		return user;
	}

	//유저코드 기반으로 유저 검색
	@Override
	public User findUserByUserCode(int userCode) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserCode", userCode);
		
		return user;
	}
	
	//다음 유저 번호 불러오기(유저코드 생성)
	@Override
	public int getNextUserCode() {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.selectOne("user_mapper.getNextUserCode");
		
		return result;
	}

	//유저 회원가입 정보 DB에 저장
	@Override
	public int saveUserInfo(User user) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("user_mapper.saveUserInfo", user);
		
		return result;
	}

	//유저 회원정보 업데이트
	@Override
	public int updateUserInfo(User user) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("user_mapper.updateUserInfo", user);
		
		return result;
	}


	//아이디 기반으로 유저 정보 확인
	@Override
	public User findUserById(String id) {
		return sqlSessionTemplate.selectOne("user_mapper.findUserById", id);
	}

	//유저 정보 수정
	@Override
	public int modifyUser(@Valid BusinessUserUpdatdReq bsnsUserUpdateReq) {
		return sqlSessionTemplate.update("user_mapper.modifyUser", bsnsUserUpdateReq);
	}

	//유저코드 기반으로 유저 회원상태 변경(회원탈퇴)	
	@Override
	public int updateUserStatusByUserCode(int userCode) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("user_mapper.updateUserStatusByUserCode", userCode);
		
		return result;
	}
}
