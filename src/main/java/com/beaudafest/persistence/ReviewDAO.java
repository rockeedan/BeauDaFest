package com.beaudafest.persistence;

import java.util.List;

import com.beaudafest.domain.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewList(Integer shopNum); //샵의 리뷰 조회
}
