package com.beaudafest.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller

public class SearchController {
	
	
	@RequestMapping("/search")
	public String searchAvailability (HttpServletRequest request) {
		return "main/searchAvailability";
	}
	
	@RequestMapping("/list")
	public String availableShopList(HttpServletRequest request) {
		String addDate = request.getParameter("searchDate");
		String openTime = addDate + " " + request.getParameter("searchTime");
		String shopAddr = request.getParameter("searchAddr1")+" "+
				request.getParameter("searchAddr2")+" "+
				request.getParameter("searchAddr3");
		
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
	public String confirm (HttpServletRequest request) {
		request.setAttribute("shopNum", request.getParameter("shopNum"));
		request.setAttribute("designId", request.getParameter("designId"));
		request.setAttribute("designName", request.getParameter("designName"));
		request.setAttribute("designPrice", request.getParameter("designPrice"));
		request.setAttribute("designTime", request.getParameter("designTime"));
		request.setAttribute("optionId", request.getParameter("optionId"));
		request.setAttribute("optionName", request.getParameter("optionName"));
		request.setAttribute("optionPrice", request.getParameter("optionPrice"));
		request.setAttribute("optionTime", request.getParameter("optionTime"));
		request.setAttribute("rsvnDate", request.getParameter("rsvnDate"));
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

	
	
	@RequestMapping("/shopInfo")
	public String shopInfo () {
		return "shopInfo/shopInfo";
	}
	
	@GetMapping("/shopModify")
	public String shopModify () {
		return "shopInfo/modifyShopInfo";
	}
	
	@RequestMapping("/review")
	public String review () {
		return "shopInfo/review";
	}
	
}
