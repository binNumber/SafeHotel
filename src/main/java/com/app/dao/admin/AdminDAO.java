package com.app.dao.admin;

import java.util.List;

import com.app.dto.admin.UserList;
import com.app.dto.user.User;

public interface AdminDAO {

	List<UserList> findUserList();

	UserList findUserByCode(int userCode);

	void updateUser(UserList user);
}
