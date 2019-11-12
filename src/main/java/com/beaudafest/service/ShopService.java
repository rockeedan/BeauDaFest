package com.beaudafest.service;

import java.util.List;
import java.util.Map;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.domain.ShopVO;

public interface ShopService {
	public int shopJoin(ShopVO vo);//샵 등록
	public int modifyShopInfo(ShopVO vo);//샵 정보 수정
	public int deleteShop(ShopVO vo);//샵 삭제
	
	public List<ShopVO> findOwnerShop(ShopVO vo);//한 오너의 여러 샵 & 특정 샵 조회
	public ShopVO findShopOne(ShopVO vo);//샵 조회
	
	public ShopVO findShopInfo(Integer shopNum);//한 샵 정보 조회
	public List<CouponVO> couponList(Integer shopNum);
	public List<CouponVO> addOption(Map<String, Object> map);
	public String selectedDesign(int designId);

}
