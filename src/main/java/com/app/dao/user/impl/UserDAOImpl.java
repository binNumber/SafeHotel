package com.app.dao.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.user.UserDAO;
import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserSearchCondition", userSearchCondition);
		
		return user;
	}

	@Override
	public User findUserById(String id) {
		return sqlSessionTemplate.selectOne("user_mapper.findUserById", id);
	}
}
