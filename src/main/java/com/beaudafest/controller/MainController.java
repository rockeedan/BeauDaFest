package com.beaudafest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.service.MemberService;

@Controller
@RequestMapping("/*")
public class MainController {

	@Autowired
	MemberService memberService;

	// 메인 페이지로 이동
	@GetMapping("/main")
	public String mainPage() {
		return "main/searchAvailability";// 메인페이지
	}

	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}

	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
}
