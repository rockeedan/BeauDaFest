package com.beaudafest.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.domain.TimeSearchVO;
import com.beaudafest.service.SearchService;

@Controller

public class SearchListController {
	
	@Autowired
	private SearchService service;

	//메인에서 날짜,시간,장소로 샵 검색
	@PostMapping("/searchShopList")
	public String availableShopList(TimeSearchVO vo, Model m,String date, String time) throws ParseException {
		String searchTime=date+" "+time;
		vo.setSearchTime(searchTime);
		List<ShopVO> vo2 = service.searchTimeShop(vo);
		for(int i=0; i<vo2.size(); i++) {
			System.out.println(vo2.toString());
		}
		
		m.addAttribute("shopList", vo2);
		
		//검색한 시간 뷰에 띄우기 위한 변환
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date to = transFormat.parse(searchTime);
		m.addAttribute("selectDate", to);
		return "main/availableShopList";
	}
	
}
