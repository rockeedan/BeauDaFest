package com.beaudafest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopInfoController {
	
	@RequestMapping("/")
	public String shopIndex() {
		return "shopInfo/shopIndex";
	}
	@RequestMapping("/info")
	public String shopInfo() {
		return "shopInfo/shopInfo";
	}
	@RequestMapping("/couponList")
	public String couponList() {
		return "shopInfo/couponList";
	}
	@RequestMapping("/reviewList")
	public String review() {
		return "shopInfo/review";
	}
}
