package com.app.service.user;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserService {
	
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition);

}
