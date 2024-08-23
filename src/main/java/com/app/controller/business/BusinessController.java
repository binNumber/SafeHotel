package com.app.controller.business;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.api.BusinessUserUpdatdReq;
import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.service.accommodation.AccommodationService;
import com.app.service.business.BusinessService;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Controller
public class BusinessController {

	@Autowired
	UserService userService;

	@Autowired
	BusinessService businessService;

	@Autowired
	AccommodationService accommodationService;

	// 사업자 메인
	@GetMapping("/businessMain")
	public String businessMain(HttpSession session, Model model) {

		if (!LoginManager.isLogin(session)) {
			return "/";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		model.addAttribute("user", user);

		return "business/businessMain";
	}

	// 사업장 등록
	@GetMapping("/businessRegister")
	public String registerBusiness(HttpSession session, Model model) {

		if (!LoginManager.isLogin(session)) {
			return "main";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		Business business = businessService.findBusinessByUserCode(user.getUserCode());

		model.addAttribute("business", business);
		model.addAttribute("user", user);

		return "business/lodging/businessRegister";
	}

	// 사업장 등록 액션
	@PostMapping("/businessRegister")
	public String registerBusiness(Accommodation accm, HttpSession session) {

		if (!LoginManager.isLogin(session)) {
			return "main";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		accm.setAcmRegDt(Date.valueOf(LocalDate.now()));
		accm.setAcmStatus("1");

		int result = businessService.saveAccommodation(accm);
		if (result >= 1) {
			return "business/lodging/businessRegister";
		}

		return "business/lodging/businessRegister";
	}

	// 사업장 관리
	@GetMapping("/businessManagement")
	public String manageBusiness(HttpSession session, Model model) {

		if (!LoginManager.isLogin(session)) {
			return "main";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		Business business = businessService.findBusinessByUserCode(user.getUserCode());

		List<Accommodation> accmList = businessService.findAccmListByUserCode(user.getUserCode());

		model.addAttribute("accmList", accmList);
		model.addAttribute("business", business);
		model.addAttribute("user", user);

		return "business/lodging/businessManagement";
	}

	// 사업장 세부 관리
	@GetMapping("/businessManagement/AcmDetail/{acmCode}")
	public String manageacmDetail(HttpSession session, @PathVariable("acmCode") int acmCode, Model model) {

		if (!LoginManager.isLogin(session)) {
			return "main";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		Business business = businessService.findBusinessByUserCode(user.getUserCode());
		AccommodationDetails acmDetail = accommodationService.findAcmDetailByAcmCode(acmCode);

		if (acmDetail != null) {

			// %%로 저장된 내용 enter로 변경
			if (acmDetail.getAcmDtlIntroduction() != null)
				acmDetail.setAcmDtlIntroduction(acmDetail.getAcmDtlIntroduction().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlNotice() != null)
				acmDetail.setAcmDtlNotice(acmDetail.getAcmDtlNotice().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlInfo() != null)
				acmDetail.setAcmDtlInfo(acmDetail.getAcmDtlInfo().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlUsageGuide() != null)
				acmDetail.setAcmDtlUsageGuide(acmDetail.getAcmDtlUsageGuide().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlAddPersonnel() != null)
				acmDetail.setAcmDtlAddPersonnel(acmDetail.getAcmDtlAddPersonnel().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlRoomInfo() != null)
				acmDetail.setAcmDtlRoomInfo(acmDetail.getAcmDtlRoomInfo().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlFacilities() != null)
				acmDetail.setAcmDtlFacilities(acmDetail.getAcmDtlFacilities().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlParking() != null)
				acmDetail.setAcmDtlParking(acmDetail.getAcmDtlParking().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlTransport() != null)
				acmDetail.setAcmDtlTransport(acmDetail.getAcmDtlTransport().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlBenefit() != null)
				acmDetail.setAcmDtlBenefit(acmDetail.getAcmDtlBenefit().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlSurroundingInfo() != null)
				acmDetail.setAcmDtlSurroundingInfo(acmDetail.getAcmDtlSurroundingInfo().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlGuide() != null)
				acmDetail.setAcmDtlGuide(acmDetail.getAcmDtlGuide().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlPolicy() != null)
				acmDetail.setAcmDtlPolicy(acmDetail.getAcmDtlPolicy().replace("%%", "\r\n"));
			if (acmDetail.getAcmDtlEtc() != null)
				acmDetail.setAcmDtlEtc(acmDetail.getAcmDtlEtc().replace("%%", "\r\n"));

			model.addAttribute("acmDetail", acmDetail);
		}

		System.out.println(acmDetail);
		model.addAttribute("business", business);
		model.addAttribute("user", user);
		//model.addAttribute("acmDetail", acmDetail);

		return "business/lodging/businessAcmDetail";
	}

	// 사업장 세부 관리 정보 수정
	@ResponseBody
	@PostMapping("/businessManagement/acmDetail/{acmCode}")
	public String manageacmDetailAction(HttpSession session, @PathVariable("acmCode") int acmCode, Model model) {

		if (!LoginManager.isLogin(session)) {
			return "main";
		}

		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		Business business = businessService.findBusinessByUserCode(user.getUserCode());
		AccommodationDetails acmDetail = accommodationService.findAcmDetailByAcmCode(acmCode);

		System.out.println(acmDetail);
		model.addAttribute("business", business);
		model.addAttribute("user", user);
		model.addAttribute("acmDetail", acmDetail);

		return "business/lodging/businessacmDetail";
	}

	// 사업자 대기 예약 조회
	@GetMapping("/businessWaitingReservation")
	public String selectWaitingReservation() {
		return "business/reservation/businessWaitingReservation";
	}

	// 예약 관리
	@GetMapping("/businessReservationManagement")
	public String manageReservation() {
		return "business/reservation/businessReservationManagement";
	}

	// 리뷰 조회
	@GetMapping("/review")
	public String selectReview() {
		return "business/review/review";
	}

	// 리뷰 조회
	@GetMapping("/reviewManagement")
	public String manageReview() {
		return "business/review/reviewManagement";
	}

}
