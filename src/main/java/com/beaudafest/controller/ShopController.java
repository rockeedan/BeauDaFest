package com.beaudafest.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beaudafest.domain.MemberVO;
import com.beaudafest.domain.ShopVO;
import com.beaudafest.service.ShopService;

@Controller
@RequestMapping("/beaudafest/shop/*")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	//샵 등록
	@PostMapping("/shopJoin")
	public String shopJoin(ShopVO vo) { //샵 등록
		vo = new ShopVO(3333, "hana3", "셋샵", "02-333-3333", "서울시", "10:00", "20:00", "목", "111", "샵소개", 1, "취소정책");
		int result = shopService.shopJoin(vo);
		System.out.println(result);
		return "/"; //샵 등록 후 페이지 이동 --> 메인으로..?
	}
	
	//샵 정보 수정
	@PostMapping("/modifyShop")
	public String modifyShop(ShopVO vo) {
		vo = new ShopVO(1111, "hana3", "하나샵", "02-1111-1111", "일산동구", "10:00", "20:00", "금", "11111.jpg", "샵소개", 1, "취소정책");
		shopService.modifyShopInfo(vo);
		return "/";
	}
	
	//샵 삭제
	@PostMapping("/deleteShop")
	public String deleteShop(Integer shopNum) {
		//shopNum = 3333;
		shopService.deleteShop(shopNum);
		return "/";
	}
	
	//샵 조회
	@PostMapping("/findShop")
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
