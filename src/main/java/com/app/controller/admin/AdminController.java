package com.app.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.admin.UserList;
import com.app.service.admin.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("/adminpage")
	public String myPageAdmin() {
		return "admin/accommodationApproval";
	}

	@GetMapping("/adminpage/accommodationApproval")
	public String accommodationApproval() {
		return "admin/accommodationApproval";
	}

	@GetMapping("/adminpage/eventCouponManagement")
	public String eventCouponManagement() {
		return "admin/eventCouponManagement";
	}

	@GetMapping("/adminpage/reviewReportManagement")
	public String reviewReportManagement() {
		return "admin/reviewReportManagement";
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
		return "redirect:/admin/userManagement";
	}

}
