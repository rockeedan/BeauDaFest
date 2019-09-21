package com.beaudafest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.service.ReservationTableService;

@Controller
@RequestMapping("/reservation")
public class ReservationTableController {

	@Autowired
	private ReservationTableService service;
	
	
	@RequestMapping("/")
	public String tableView() {
		return "/reservationTest/reservationTable";
	}
	
	@RequestMapping("/insert")
	public @ResponseBody String insert() {
		if(service.insertTimeSchedule(1, "2019/09/21", "10:00", "17:00")) {
			return "성공!!!!!";
		}
		return "실패";
	}
}
