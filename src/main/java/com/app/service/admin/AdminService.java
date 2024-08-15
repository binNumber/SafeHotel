package com.app.service.admin;

import java.util.List;

import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;

public interface AdminService {

	List<UserList> getAllUsers();

	UserList getUserByCode(int userCode);

	void updateUser(UserList user);

	List<ReviewReport> getAllReviewReports();

	void processReviewReport(int reviewCode);

	void revertReviewReportStatus(int reviewCode);

	List<Accommodation> findPendingAccommodations();

	void approveAccommodation(int acmCode);

	void rejectAccommodation(int acmCode);

	List<Accommodation> findAllAccommodations();

	Accommodation getAccommodationByCode(int acmCode);

	AccommodationDetails getAccommodationDetailsByCode(int acmCode);

	void updateAccommodationDetails(AccommodationDetails accommodationDetails);

	void updateAccommodation(Accommodation accommodation);

	UserList getUserByEmailAndPassword(String email, String password);

	void setPendingAccommodation(int acmCode);

}
