package com.beaudafest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ShopService;

@Controller
@RequestMapping("/*")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/shop/shopJoin")
	public String shopJoinPage(HttpSession session) { //샵 등록
		System.out.println(session.getAttribute("memberId"));
		return "shopInfo/shopRegister";
	}
	
	//샵 등록
	@PostMapping("/shop/shopJoin")
	public String shopJoin(ShopVO vo, HttpSession session) { //샵 등록
		//vo = new ShopVO(3333, "hana3", "셋샵", "02-333-3333", "서울시", "10:00", "20:00", "목", "111", "샵소개", 1, "취소정책");
		vo.setMemberId((String) session.getAttribute("memberId"));
		System.out.println("넘어온샵정보 : "+vo.toString());
		vo.setShopPhoto("setShopPhoto");
		int result = shopService.shopJoin(vo);
		session.removeAttribute("memberId");
		System.out.println(session.getAttribute("memberId"));
		return "redirect:/main"; //샵 등록 후 페이지 이동 --> 메인으로..?
	}
	
	//샵 정보 수정
	@PostMapping("/shop/modifyShop")
	public String modifyShop(ShopVO vo) {
		vo = new ShopVO(1111, "hana3", "하나샵", "02-1111-1111", "일산동구", "10:00", "20:00", "금", "11111.jpg", "샵소개", 1, "취소정책");
		shopService.modifyShopInfo(vo);
		return "/";
	}
	
	//샵 삭제
	@PostMapping("/shop/deleteShop")
	public String deleteShop(Integer shopNum) {
		//shopNum = 3333;
		shopService.deleteShop(shopNum);
		return "/";
	}
	
	//샵 조회
	@PostMapping("/shop/findShop")
	public String findShop(ShopVO vo) {
		vo.setMemberId("hana1");
		vo.setShopNum(1111);
		List<ShopVO> list = new ArrayList<>();
		list = shopService.findShop(vo);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return "/"; //조회페이지
	}
}
