package com.beaudafest.persistence;

import java.util.List;

import com.beaudafest.domain.CouponVO;

public interface CouponDAO {
	
	public void addCoupon(CouponVO vo);

	public List<CouponVO> showCoupon(int shopNum);

	public CouponVO designDetail(int designId);

	public void designUpdate(CouponVO vo);

	public void designDelete(int designId);

}
