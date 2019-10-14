package com.beaudafest.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.service.MemberService;

@Controller
public class MainController {

	@Autowired
	MemberService memberService;

	// 메인 페이지로 이동
	@GetMapping("/mainmain")
	public String mainPage() {
		return "main/searchAvailability";// 메인페이지
	}

	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		Map<String, Integer> login = memberService.login(vo);
		String success = String.valueOf(login.get("SUCCESS"));
		if(success==null) {
			System.out.println("ㄴㄴ");
		} else {
			System.out.println("로그인 성공");
			session.setAttribute("login", "success");
			session.setAttribute("loginId", vo.getMemberId());
			session.setAttribute("memberStatus", String.valueOf(login.get("MEMBERSTATUS")));
			System.out.println(session.getAttribute("memberStatus"));
		}
		return "redirect:/";
	}

	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
