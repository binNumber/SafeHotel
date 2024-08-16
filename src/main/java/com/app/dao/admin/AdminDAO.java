package com.app.dao.admin;

import java.util.List;

import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;
import com.app.dto.user.User;

public interface AdminDAO {

	List<UserList> findUserList();

	UserList findUserByCode(int userCode);

	void updateUser(UserList user);

	List<ReviewReport> findAllReviewReports();

	void updateReviewReportStatus(int reviewCode);

	void updateReviewReportStatusToZero(int reviewCode);

	List<Accommodation> findPendingAccommodations();

	void approveAccommodation(int acmCode);

	void rejectAccommodation(int acmCode);

	List<Accommodation> findAllAccommodations();

	Accommodation findAccommodationByCode(int acmCode);

	AccommodationDetails findAccommodationDetailsByCode(int acmCode);

	void updateAccommodation(Accommodation accommodation);

	void updateAccommodationDetails(AccommodationDetails accommodationDetails);

	UserList findUserByEmailAndPassword(String email, String password);

	void setPendingAccommodation(int acmCode);
}
