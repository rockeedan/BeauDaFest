package com.beaudafest.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addCoupon(CouponVO vo) {
		
		sqlSession.insert("coupon.addCoupon",vo);
		
	}

	
}
