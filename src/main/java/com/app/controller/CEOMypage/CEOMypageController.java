package com.app.controller.CEOMypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CEOMypageController {
	
	@GetMapping("/CEOMypage")
	public String CEOMypage() {
		return "mypage/CEOMypage/CEOMypage";
	}

}
