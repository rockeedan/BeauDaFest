package com.beaudafest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class ManageController {


		@GetMapping("/rsvnManage")
		public String mainPage() {
			return "shop/rsvnManage";
		}

		
		
}
