package com.beaudafest.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beaudafest.domain.ShopVO;
import com.beaudafest.domain.TimeSearchVO;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ShopVO> timeSearchShop(TimeSearchVO vo) {
		return session.selectList("search.searchTimeShopList", vo);
	}

}
