package com.beaudafest.persistence;

import java.util.List;

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

	@Override
	public List<CouponVO> showCoupon(int shopNum) {
		return sqlSession.selectList("coupon.showCoupon", shopNum);
		
	}

	@Override
	public CouponVO designDetail(int designId) {
		
		return sqlSession.selectOne("coupon.designDetail", designId);
	}

	@Override
	public void designUpdate(CouponVO vo) {

		sqlSession.update("coupon.designUpdate", vo);
		
	}

	@Override
	public void designDelete(int designId) {
		sqlSession.delete("coupon.designDelete", designId);
	}

	
}
