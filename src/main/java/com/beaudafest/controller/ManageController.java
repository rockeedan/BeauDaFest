package com.beaudafest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ReservationService;
import com.beaudafest.service.ShopService;

@Controller
public class ManageController {

	@Autowired
	ReservationService reservationService;

	@Autowired
	ShopService shopService;

	
	int shopNum = 0;
	
	@RequestMapping("/shopManage")
	public String manage(Model m) {
		
		// 세션 아이디
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "juwon";
		
		ShopVO shop = new ShopVO();
		shop.setMemberId(loginId);
		
		m.addAttribute("shopList", shopService.findOwnerShop(shop));
		return "shop/rsvnManage";
	}
	
	
	

	@GetMapping("/tables/{shopNum}")
	public String showtable(Model m, HttpSession session, @PathVariable("shopNum") Integer shopNum) {

		// 세션 아이디
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "juwon";
		
		//검색하기위한 vo생성
		ShopVO shop = new ShopVO();
		shop.setMemberId(loginId);
		shop.setShopNum(shopNum);

		List<Map<String, Object>> list = reservationService.selectRsvnList(shopNum);
		shop = shopService.findShopOne(shop);

		m.addAttribute("list", list);// 샵11111 예약정보
		m.addAttribute("shop", shop); // 샵1111 정보

		return "shop/tables";

	}

	@RequestMapping("/charts/{shopNum}")
	public String showcharts(@PathVariable("shopNum") Integer shopNum) {
		this.shopNum = shopNum;
		return "shop/charts";
	}

	
	
	@RequestMapping(value = "/myAreaChart")
	public @ResponseBody int[] showAreacharts() {

		//샵넘버
		int shopNum = this.shopNum;

		//월별 총 수익 조회
		List<Map<String, Object>> list = reservationService.selectMonthlyRsvnProfits(shopNum);
		
		
		//java.math.BigDecimal cannot be cast to java.lang.Integer
		// : NUMBER형 데이터 타입을 HashMap으로 받아 Java에서 사용하려 할 때 발생
		int[] value = {Integer.parseInt(String.valueOf(list.get(0).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(1).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(2).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(3).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(4).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(5).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(6).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(7).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(8).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(9).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(10).get("TOTALPRICE"))),
						Integer.parseInt(String.valueOf(list.get(11).get("TOTALPRICE")))};
		return value;

	}
	
	@RequestMapping(value = "/myBarChart")
	public @ResponseBody int[] showBarcharts() {

		// 세션 샵넘버
		// int shopNum = session.getAttribute("shopNum");
		int shopNum = 1;

		//월별 예약 수 조회
		List<Map<String, Object>> list = reservationService.selectMonthlyRsvnCount(shopNum);
	
		
		int[] value = {Integer.parseInt(String.valueOf(list.get(0).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(1).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(2).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(3).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(4).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(5).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(6).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(7).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(8).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(9).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(10).get("CNT"))),
						Integer.parseInt(String.valueOf(list.get(11).get("CNT")))};
		return value;

	}

}
