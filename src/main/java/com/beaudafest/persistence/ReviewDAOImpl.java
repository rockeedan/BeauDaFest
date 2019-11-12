package com.beaudafest.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.ReviewVO;
import com.beaudafest.domain.ShopVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewVO> userReviewList(Integer shopNum) {
		return session.selectList("review.allUserReview", shopNum);
	}

	@Override
	public List<ReviewVO> ownerReviewList(Integer shopNum) {
		return session.selectList("review.allOwnerReview", shopNum);
	}
	
	@Override
	public ShopVO shopInfo(Integer shopNum) {
		return session.selectOne("shop.findShopInfo", shopNum);
	}
	
	@Override
	public Integer shopScore(Integer shopNum) {
		return session.selectOne("review.shopScore", shopNum);
	}


}
