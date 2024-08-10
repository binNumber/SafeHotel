package com.app.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.admin.AdminDAO;
import com.app.dto.admin.UserList;
import com.app.dto.user.User;
import com.app.service.admin.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
    private AdminDAO adminDAO;

    @Override
    public List<UserList> getAllUsers() {
        return adminDAO.findUserList();
    }
    
    @Override
    public UserList getUserByCode(int userCode) {
        return adminDAO.findUserByCode(userCode);
    }

    @Override
    public void updateUser(UserList user) {
        adminDAO.updateUser(user);
    }
}