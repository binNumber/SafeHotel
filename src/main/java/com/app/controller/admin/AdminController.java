package com.app.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.ReviewReport;
import com.app.dto.admin.UserList;
import com.app.service.admin.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("/adminpage")
	public String myPageAdmin() {
		return "admin/adminLogin";
	}

	@GetMapping("/adminpage/accommodationApproval")
	public String accommodationApproval(Model model) {
		List<Accommodation> accommodations = adminService.findPendingAccommodations();
		model.addAttribute("accommodations", accommodations);
		return "admin/accommodationApproval";
	}

	@PostMapping("/adminpage/accommodationApproval/approve")
	public String approveAccommodation(@RequestParam("acmCode") int acmCode) {
		adminService.approveAccommodation(acmCode);
		return "redirect:/adminpage/accommodationApproval";
	}

	@PostMapping("/adminpage/accommodationApproval/reject")
	public String rejectAccommodation(@RequestParam("acmCode") int acmCode) {
		adminService.rejectAccommodation(acmCode);
		return "redirect:/adminpage/accommodationApproval";
	}

	@GetMapping("/adminpage/eventCouponManagement")
	public String eventCouponManagement() {
		return "admin/eventCouponManagement";
	}

	@GetMapping("/adminpage/userManagement")
	public String getUserManagementPage(Model model) {
		List<UserList> userList = adminService.getAllUsers();
		model.addAttribute("userList", userList);
		return "admin/userManagement";
	}

	@GetMapping("/adminpage/userDetail")
	public String getUserDetail(@RequestParam("userCode") int userCode, Model model) {
		UserList user = adminService.getUserByCode(userCode); // 단일 유저 정보 가져오는 메서드
		model.addAttribute("user", user);
		return "admin/userDetail";
	}

	@PostMapping("/adminpage/updateUser")
	public String updateUser(UserList user) {
		adminService.updateUser(user); // 유저 정보를 업데이트하는 메서드
		return "redirect:/adminpage/userManagement";
	}

	@GetMapping("/adminpage/reviewReportManagement")
	public String getReviewReportManagementPage(Model model) {
		List<ReviewReport> reviewReportList = adminService.getAllReviewReports();
		model.addAttribute("reviewReportList", reviewReportList);
		return "admin/reviewReportManagement";
	}

	@PostMapping("/adminpage/reviewReportManagement/process")
	public String processReviewReport(@RequestParam("reviewCode") int reviewCode) {
		adminService.processReviewReport(reviewCode);
		return "redirect:/adminpage/reviewReportManagement";
	}

	@PostMapping("/adminpage/reviewReportManagement/revert")
	public String revertReviewReport(@RequestParam("reviewCode") int reviewCode) {
		adminService.revertReviewReportStatus(reviewCode);
		return "redirect:/adminpage/reviewReportManagement";
	}

	@GetMapping("/adminpage/accommodationList")
	public String getAccommodationList(Model model) {
		List<Accommodation> accommodations = adminService.findAllAccommodations();
		model.addAttribute("accommodations", accommodations);
		return "admin/accommodationList";
	}

	@GetMapping("/adminpage/accommodationDetail")
	public String getAccommodationDetail(@RequestParam("acmCode") int acmCode, Model model) {
		// 숙소 기본 정보 조회
		Accommodation accommodation = adminService.getAccommodationByCode(acmCode);
		// 숙소 상세 정보 조회
		AccommodationDetails accommodationDetails = adminService.getAccommodationDetailsByCode(acmCode);

		// 조회된 정보를 모델에 추가하여 JSP에 전달
		model.addAttribute("accommodation", accommodation);
		model.addAttribute("accommodationDetails", accommodationDetails);

		return "admin/accommodationDetail";
	}

	@PostMapping("/adminpage/updateAccommodation")
	public String updateAccommodation(Accommodation accommodation, AccommodationDetails accommodationDetails) {
		// 숙소 기본 정보 업데이트
		adminService.updateAccommodation(accommodation);
		// 숙소 상세 정보 업데이트
		adminService.updateAccommodationDetails(accommodationDetails);

		return "redirect:/adminpage/accommodationList";
	}

	@RequestMapping("/adminLoginPage")
	public String showAdminLoginPage() {
		return "admin/adminLogin";
	}

	@PostMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request, HttpSession session) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserList user = adminService.getUserByEmailAndPassword(email, password);

		if (user != null && "ADM".equals(user.getUserType())) {
			session.setAttribute("adminUser", user);
			// 로그인 성공 후 숙소 등록 승인 목록 페이지로 리다이렉트
			return "redirect:/adminpage/accommodationApproval";
		} else {
			request.setAttribute("loginError", true);
			return "admin/adminLogin";
		}
	}

	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/adminLoginPage";
	}

	@PostMapping("/adminpage/updateAccommodationStatus")
	public void updateAccommodationStatus(@RequestParam("acmCode") int acmCode, @RequestParam("status") int status) {
		if (status == 1) {
			adminService.approveAccommodation(acmCode);
		} else if (status == 2) {
			adminService.rejectAccommodation(acmCode);
		} else {
			 adminService.setPendingAccommodation(acmCode);
		}
	}

}
