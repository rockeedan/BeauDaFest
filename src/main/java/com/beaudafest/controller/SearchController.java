package com.beaudafest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class SearchController {
	
	
	@RequestMapping("/search")
	public String searchAvailability () {
		
		return "main/searchAvailability";
	}

}
