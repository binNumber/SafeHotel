package com.app.dao.user;

import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserDAO {
	
	public User findUserByUserSearchCondition(UserSearchCondition userSearchCondition);

	public User findUserById(String id);


}
