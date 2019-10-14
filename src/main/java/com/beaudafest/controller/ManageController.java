package com.beaudafest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ReservationService;
import com.beaudafest.service.ShopService;

@Controller
public class ManageController {

	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	ShopService shopService;
	

	@RequestMapping("/shopManage")
	public String manage () {
		return "shop/rsvnManage";
	}
	
	

	@RequestMapping("/tables")
	public String showtable (Model m, HttpSession session) {
		
		//세션 아이디 
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hana1";
		
		//세션 샵넘버
		//int shopNum = session.getAttribute("shopNum");
		int shopNum = 1111;
	
		ShopVO shop = new ShopVO();
		shop.setMemberId(loginId);
		shop.setShopNum(shopNum);
		
		
		List<Map<String, Object>> list = reservationService.selectRsvnList(1111);
		shop = shopService.findShopOne(shop);
		
		m.addAttribute("list", list);//샵11111 예약정보
		m.addAttribute("shop", shop); //샵1111 정보
		
		return "shop/tables";
		
	}
	

	@RequestMapping("/charts")
	public String showcharts () {
		return "shop/charts";
	}
	
		
}
