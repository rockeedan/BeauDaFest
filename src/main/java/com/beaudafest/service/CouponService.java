package com.beaudafest.service;

import java.util.List;

import com.beaudafest.domain.CouponVO;

public interface CouponService {
	public void addCoupon(CouponVO vo); 
	public List<CouponVO> showCoupon(int shopNum);
}
