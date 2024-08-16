package com.app.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.admin.AdminDAO;
import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;
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
    
    @Override
    public List<ReviewReport> getAllReviewReports() {
        return adminDAO.findAllReviewReports();
    }

    @Override
    public void processReviewReport(int reviewCode) {
        adminDAO.updateReviewReportStatus(reviewCode);
    }
    
    @Override
    public void revertReviewReportStatus(int reviewCode) {
        adminDAO.updateReviewReportStatusToZero(reviewCode);
    }
    
    @Override
    public List<Accommodation> findPendingAccommodations() {
        return adminDAO.findPendingAccommodations();
    }

    @Override
    public void approveAccommodation(int acmCode) {
        adminDAO.approveAccommodation(acmCode);
    }

    @Override
    public void rejectAccommodation(int acmCode) {
        adminDAO.rejectAccommodation(acmCode);
    }
    
    @Override
    public List<Accommodation> findAllAccommodations() {
        return adminDAO.findAllAccommodations();
    }
    
    @Override
    public Accommodation getAccommodationByCode(int acmCode) {
        return adminDAO.findAccommodationByCode(acmCode);
    }

    @Override
    public AccommodationDetails getAccommodationDetailsByCode(int acmCode) {
        return adminDAO.findAccommodationDetailsByCode(acmCode);
    }
    
    @Override
    public void updateAccommodation(Accommodation accommodation) {
        adminDAO.updateAccommodation(accommodation);
    }

    @Override
    public void updateAccommodationDetails(AccommodationDetails accommodationDetails) {
        adminDAO.updateAccommodationDetails(accommodationDetails);
    }
    
    @Override
	public UserList getUserByEmailAndPassword(String email, String password) {
		return adminDAO.findUserByEmailAndPassword(email, password);
	}
    
    @Override
    public void setPendingAccommodation(int acmCode) {
        adminDAO.setPendingAccommodation(acmCode);
    }
    
    
}