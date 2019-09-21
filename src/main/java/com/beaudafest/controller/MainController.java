package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.service.UserService;

@Controller
@RequestMapping("/beaudafest/*")
public class MainController {

	@Autowired
	UserService service;

	//메인 페이지로 이동
	@GetMapping("/main")
	public String mainPage() {
		return "main/mainView"; //가입 페이지로 이동
	}
}
