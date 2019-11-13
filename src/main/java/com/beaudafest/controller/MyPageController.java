package com.beaudafest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.service.ReservationService;
import com.beaudafest.service.ShopService;

@Controller
public class MyPageController {

	@Autowired
	ReservationService reservationService;
	
	@Autowired
	ShopService shopService;

	
	@RequestMapping("/myPage")
	public String manage() {
		return "member/myPage";
	}
	
	@RequestMapping("/myReservation")
	public String showtable(Model m, HttpSession session) {

		// 세션 아이디
		String loginId = (String) session.getAttribute("loginId");
		//String loginId = "gosolb";
		
		m.addAttribute("loginId", loginId);
		m.addAttribute("list", reservationService.selectUserRsvnList(loginId));
		m.addAttribute("history", reservationService.selectUserRsvnHistory(loginId));
		return "member/myReservation";

	}
	
	@GetMapping("/addReview")
	public String addReview() {
		return "member/addReview";
	}


}
