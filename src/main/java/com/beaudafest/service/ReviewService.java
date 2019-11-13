package com.beaudafest.service;

import java.util.List;

import com.beaudafest.domain.ReviewVO;
import com.beaudafest.domain.ShopVO;

public interface ReviewService {
	public List<ReviewVO> userReviewList(Integer shopNum);//샵의 사용자 리뷰
	public List<ReviewVO> ownerReviewList(Integer shopNum); //샵의 오너 리뷰
	public ShopVO shopInfo(Integer shopNum); //샵의 오너 리뷰
	public Integer shopScore(Integer shopNum);
}
