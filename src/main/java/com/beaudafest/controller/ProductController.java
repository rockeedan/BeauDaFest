package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.service.CouponService;

@Controller
@RequestMapping("/owner")
public class ProductController {

	@Autowired
	private CouponService service;
	
	@GetMapping("/manage")
	public String showManage() {
		return "shop/couponManage";
	}
	
	@PostMapping("/addCoupon")
	public String addCoupon(CouponVO vo) {
		
		service.addCoupon(vo);
		
		return "redirect:/owner/manage";
	}
	
	
}
