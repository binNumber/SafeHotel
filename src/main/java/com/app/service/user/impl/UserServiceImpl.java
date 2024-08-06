package com.app.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		
		User user = userDAO.findUserByUserSearchCondition(userSearchCondition);
		
		return user;
	}
	
	

}
