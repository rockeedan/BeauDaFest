package com.beaudafest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class ManageController {


	@RequestMapping("/shopManage")
	public String manage () {
		return "shop/rsvnManage";
	}

		
		
}
