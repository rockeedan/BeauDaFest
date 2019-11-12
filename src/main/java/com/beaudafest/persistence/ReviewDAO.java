package com.beaudafest.persistence;

import java.util.List;

import com.beaudafest.domain.ReviewVO;
import com.beaudafest.domain.ShopVO;

public interface ReviewDAO {
	public List<ReviewVO> userReviewList(Integer shopNum); //샵 이용자 리뷰 조회
	public List<ReviewVO> ownerReviewList(Integer shopNum); //샵오너 리뷰 조회
	public ShopVO shopInfo(Integer shopNum);//샵정보조회
	public Integer shopScore(Integer shopNum);//샵의 평점 조회
}
