package com.beaudafest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.service.ReservationService;

@Controller
public class ReservationController {
	
	@Inject
	ReservationService service;
	
	@RequestMapping("/checkcheck")
	@ResponseBody
	public String createSchedule() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shopNum",1);
		map.put("startTime","2019-10-07 10:00");
		map.put("endTime","2019-10-07 11:00");
		if(service.createSchedule(map)) {
			return "성공";
		}else {
			System.out.println(TransactionSynchronizationManager.getCurrentTransactionName());
			return "안된다 안돼!!!";
		}
	}
}
