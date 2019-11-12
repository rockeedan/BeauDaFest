package com.beaudafest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.domain.ReviewVO;
import com.beaudafest.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//리뷰페이지
	@GetMapping("/shopReview/{shopNum}")
	public String reviewList(@PathVariable Integer shopNum, Model m) {
		m.addAttribute("userReviewList",service.userReviewList(shopNum)); //유저리뷰조회
		m.addAttribute("shopInfo",service.shopInfo(shopNum)); //샵정보조회
		m.addAttribute("shopScore",service.shopScore(shopNum)); //평점조회
		return "shopInfo/review";
	}
	
	@PostMapping("/shopReview/owners/{shopNum}")
	public @ResponseBody List<ReviewVO> ownersReply(@PathVariable Integer shopNum, Model m){
		System.out.println(service.ownerReviewList(shopNum));
		return service.ownerReviewList(shopNum); //오너의 댓글 조회
	}
	
}
