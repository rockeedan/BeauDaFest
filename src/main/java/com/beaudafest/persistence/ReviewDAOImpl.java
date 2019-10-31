package com.beaudafest.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewVO> reviewList(Integer shopNum) {
		return session.selectList("review.allReview", shopNum);
		
	} 
}
