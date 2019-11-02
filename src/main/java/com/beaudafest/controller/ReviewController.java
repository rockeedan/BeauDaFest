package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.beaudafest.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/shopReview/{shopNum}")
	public String reviewList(@PathVariable Integer shopNum, Model m) {
		m.addAttribute("reviewList",service.reviewList(shopNum));
		
		//예약했었음 -->
		m.addAttribute("checkRsvn",service.reviewList(shopNum));
		return "shopInfo/review";
	}
	
//	@PostMapping("/shopReview/addReview")
//	public String reviewAdd
}
