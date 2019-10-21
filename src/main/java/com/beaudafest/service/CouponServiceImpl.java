package com.beaudafest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.CouponVO;
import com.beaudafest.persistence.CouponDAO;
@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO dao;
	
	
	@Override
	public void addCoupon(CouponVO vo) {
		dao.addCoupon(vo);
	}


	@Override
	public List<CouponVO> showCoupon(int shopNum) {
	
		return 	dao.showCoupon(shopNum);
				
	}


	@Override
	public CouponVO designDetail(int designId) {
		
		return dao.designDetail(designId);
	}


	@Override
	public void designUpdate(CouponVO vo) {

		 dao.designUpdate(vo);
		
	}


	@Override
	public void designDelete(int designId) {

		dao.designDelete(designId);
		
	}

}
