package com.app.service.admin;

import java.util.List;

import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;

public interface AdminService {

	List<UserList> getAllUsers();

	UserList getUserByCode(int userCode);

	void updateUser(UserList user);

	List<ReviewReport> getAllReviewReports();

	void processReviewReport(int reviewCode);

	void revertReviewReportStatus(int reviewCode);

}
