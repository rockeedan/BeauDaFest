package com.beaudafest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.ReviewVO;
import com.beaudafest.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewList(Integer shopNum) {
		return dao.reviewList(shopNum);
	}
}
