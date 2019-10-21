package com.beaudafest.service;

import java.util.List;

import com.beaudafest.domain.CouponVO;

public interface CouponService {
	public void addCoupon(CouponVO vo); 
	public List<CouponVO> showCoupon(int shopNum);
	public CouponVO designDetail(int designId);
	public void designUpdate(CouponVO vo);
	public void designDelete(int designId);
}
