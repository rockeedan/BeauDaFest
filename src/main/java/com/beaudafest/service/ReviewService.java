package com.beaudafest.service;

import java.util.List;

import com.beaudafest.domain.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(Integer shopNum);//샵의 전체 리뷰

}
