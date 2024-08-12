package com.app.dao.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.admin.AdminDAO;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;
import com.app.dto.user.User;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<UserList> findUserList() {
		return sqlSessionTemplate.selectList("admin_mapper.findUserList");
	}
	
	@Override
    public UserList findUserByCode(int userCode) {
        return sqlSessionTemplate.selectOne("admin_mapper.findUserByCode", userCode);
    }

    @Override
    public void updateUser(UserList user) {
        sqlSessionTemplate.update("admin_mapper.updateUser", user);
    }
    
    @Override
    public List<ReviewReport> findAllReviewReports() {
        return sqlSessionTemplate.selectList("admin_mapper.findAllReviewReports");
    }

    @Override
    public void updateReviewReportStatus(int reviewCode) {
        sqlSessionTemplate.update("admin_mapper.updateReviewReportStatus", reviewCode);
    }
    
    @Override
    public void updateReviewReportStatusToZero(int reviewCode) {
        sqlSessionTemplate.update("admin_mapper.updateReviewReportStatusToZero", reviewCode);
    }
}
