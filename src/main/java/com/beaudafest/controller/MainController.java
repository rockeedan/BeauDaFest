package com.beaudafest.controller;

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

	//메인 페이지로 이동
	@GetMapping("/main")
	public String mainPage() {
		return "main/searchAvailability"; //가입 페이지로 이동
	}
	
}
