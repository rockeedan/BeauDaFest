package com.beaudafest.service;

import java.util.List;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.domain.TimeSearchVO;

public interface SearchService {
	public List<ShopVO> searchTimeShop(TimeSearchVO vo);
}
