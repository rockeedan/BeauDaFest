package com.beaudafest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.service.ReservationService;
import com.beaudafest.service.ShopService;

@Controller
public class myPageController {

	@Autowired
	ReservationService reservationService;
	
	@Autowired
	ShopService shopService;

	
	@RequestMapping("/myPage")
	public String manage() {
		return "shop/myPage";
	}
	
	@GetMapping("/myReservation")
	public String showtable(Model m, HttpSession session) {

		// 세션 아이디
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "gosolb";
		
		List<Map<String, Object>> list = reservationService.selectUserRsvnList(loginId);
		List<Map<String, Object>> history = reservationService.selectUserRsvnHistory(loginId);
		System.out.println(list);
		System.out.println(history);
		
		
		m.addAttribute("loginId", loginId);
		m.addAttribute("list", list);
		m.addAttribute("history", history);
		return "shop/myReservation";

	}
	


}
