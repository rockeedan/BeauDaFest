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
@RequestMapping("/*")
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
		/* 샵통계 - 예약 리스트 테이블
		 * (예약번호, 예약자아이디, 예약자이름, 예약자전번, 디자인이름, 옵션이름,
		 *  총가격, 예약날짜, 시술일시, 샵번호 출력)
		 * 1. 로그인아이디 세션에서 가져와서 
		 * 2. 아이디로 샵번호 검색
		 * 3. 샵번호로 예약 리스트 가져오기
		 * 4. 예약 리스트 대스보드 테이블에 출력
		 */
		
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hana1";
		ShopVO shop = new ShopVO();
		shop.setMemberId(loginId);
		
		
		//한사람이 여러개의 샵을 가진경우 예약 리스트 조회?
		List<ShopVO> shopList = shopService.findShop(shop);
		for(int i=0; i<shopList.size(); i++) {
			shopList.get(i).getShopNum();
			System.out.println(
					shopList.get(i).getShopNum()+","+ shopList.get(i).getShopName());
		}
		
		
		//샵번호 임의
		List<Map<String, Object>> list = reservationService.selectRsvnList(1111);
		
		m.addAttribute("list", list);
		
		return "shop/tables";
		
	}
	

	@RequestMapping("/charts")
	public String showcharts () {
		
		
		
		
		return "shop/charts";
	}
	
		
}
