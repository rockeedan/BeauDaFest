package com.beaudafest.persistence;

import java.util.List;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.domain.TimeSearchVO;

public interface SearchDAO {
	public List<ShopVO> timeSearchShop(TimeSearchVO vo);
}
