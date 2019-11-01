package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.beaudafest.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
}
