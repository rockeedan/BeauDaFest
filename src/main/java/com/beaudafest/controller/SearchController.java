package com.beaudafest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class SearchController {
	
	
	@RequestMapping("/search")
	public String searchAvailability () {
		
		return "main/searchAvailability";
	}
	
	@RequestMapping("/list")
	public String availableShopList() {
		return "main/availableShopList";
	}
	
	@RequestMapping("/nav")
	public String nav() {
		return "include/loginNav";
	}
	
	@RequestMapping("/option")
	public String addOption() {
		return "reservation/addOption";
	}
	
	@RequestMapping("/confirm")
	public String confirm () {
		return "reservation/rsvnConfirm";
	}
	
	@RequestMapping("/login")
	public String login () {
		return "member/login";
	}
	@RequestMapping("/signup")
	public String signUp () {
		return "member/signUp";
	}
	@RequestMapping("/registration")
	public String register () {
		return "shop/shopRegister";
	}
	
	@RequestMapping("/shopManage")
	public String manage () {
		return "shop/rsvnManage";
	}
	
	
	@RequestMapping("/tables")
	public String table () {
		return "shop/tables";
	}
	@RequestMapping("/charts")
	public String charts () {
		return "shop/charts";
	}
	
	
	@RequestMapping("/shopInfo")
	public String shopInfo () {
		return "shopInfo/shopInfo";
	}
	
}
