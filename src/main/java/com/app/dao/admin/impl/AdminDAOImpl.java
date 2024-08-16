package com.app.dao.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.admin.AdminDAO;
import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;

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
    
    @Override
    public List<Accommodation> findPendingAccommodations() {
        return sqlSessionTemplate.selectList("admin_mapper.findPendingAccommodations");
    }

    @Override
    public void approveAccommodation(int acmCode) {
        sqlSessionTemplate.update("admin_mapper.approveAccommodation", acmCode);
    }

    @Override
    public void rejectAccommodation(int acmCode) {
        sqlSessionTemplate.update("admin_mapper.rejectAccommodation", acmCode);
    }
    
    @Override
    public List<Accommodation> findAllAccommodations() {
        return sqlSessionTemplate.selectList("admin_mapper.findAllAccommodations");
    }
    
    @Override
    public Accommodation findAccommodationByCode(int acmCode) {
        return sqlSessionTemplate.selectOne("admin_mapper.findAccommodationByCode", acmCode);
    }

    @Override
    public AccommodationDetails findAccommodationDetailsByCode(int acmCode) {
        return sqlSessionTemplate.selectOne("admin_mapper.findAccommodationDetailsByCode", acmCode);
    }
    
    @Override
    public void updateAccommodation(Accommodation accommodation) {
        sqlSessionTemplate.update("admin_mapper.updateAccommodation", accommodation);
    }

    @Override
    public void updateAccommodationDetails(AccommodationDetails accommodationDetails) {
        sqlSessionTemplate.update("admin_mapper.updateAccommodationDetails", accommodationDetails);
    }
    
    @Override
	public UserList findUserByEmailAndPassword(String email, String password) {
		UserList param = new UserList();
		param.setUserEmail(email);
		param.setUserPw(password);
		return sqlSessionTemplate.selectOne("admin_mapper.findUserByEmailAndPassword", param);
	}
    
    @Override
    public void setPendingAccommodation(int acmCode) {
        sqlSessionTemplate.update("admin_mapper.setPendingAccommodation", acmCode);
    }
}
