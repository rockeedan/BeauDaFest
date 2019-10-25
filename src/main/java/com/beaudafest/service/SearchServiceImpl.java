package com.beaudafest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.domain.TimeSearchVO;
import com.beaudafest.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO dao;
	
	@Override
	public List<ShopVO> searchTimeShop(TimeSearchVO vo) {
		return dao.timeSearchShop(vo);
	}

}
